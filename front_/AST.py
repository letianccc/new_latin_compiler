
from front_.util import *
from front_.myenum import *
from front_.type_system import TypeSystem
from front_.symbol_system import *
from front_.ir import *

class Node(object):
    """docstring for Node."""

    def __init__(self):
        super(Node, self).__init__()

class CallNode:
    def __init__(self, function, call_function, parameters):
        self.function = function
        self.call_function = call_function
        self.params = parameters
        self.kind = NodeKind.CALL

    def check(self):
        self.call_function = self.call_function.check(self.function, NodeKind.CALL)

        for p in self.params:
            p.check()

        # 计算调用最多需要预留的栈空间
        space = 0
        for p in self.params:
            space += p.parameter.type.size
        if space > self.function.symbol.call_space:
            self.function.symbol.call_space = space
        # 分配实参偏移
        self.set_param_offset()

    def check_callee(self):
        if not self.call_function.is_extern:
            if len(self.params) != len(self.call_function.params):
                raise Exception('函数参数数量不匹配')
            # TODO: 检测参数兼容性


    def set_param_offset(self):
        # TODO: 这部分逻辑要移到emit中
        size = 0
        offset = 0
        for p in reversed(self.params):
            p.offset = offset
            size = p.parameter.type.size
            offset += size

    def gen(self):
        ir = CallIR(self.call_function, self.params)
        self.function.gen_ir(ir)

class FunctionNode:
    def __init__(self):
        self.kind = NodeKind.FUNCTION
        self.type = None
        self.identifier = None
        self.params = None
        self.symbol = None
        self.statements = None
        self.cur_block = None
        self.blocks = []
        self.code = ''
        self.call_nodes = []

    def check(self):
        SymbolSystem.enter()
        for p in self.params:
            p.check()
        for stmt in self.statements:
            stmt.check()
        SymbolSystem.quit()

    def gen(self):
        if self.statements is None:
            return
        for stmt in self.statements:
            stmt.gen()
        self.symbol.allocate_block_id()

    def gen_ir(self, ir):
        self.symbol.gen_ir(ir)

    def emit(self):
        ...

class ParameterNode:
    def __init__(self, function, kind, type, parameter):
        self.function = function
        self.kind = kind
        # 表示实参的变量或常量已经存在，因此有type
        # 表示形参的变量未声明，因此type为None
        self.type = type
        self.parameter = parameter
        self.index = None

    def check(self):
        f = self.function.symbol
        p = self.parameter
        if p.match(TokenKind.INTCONST, TokenKind.STRING, TokenKind.DOUBLECONST):
            s = p.check(f)
        elif p.match(TokenKind.ID):
            s = p.check(f, self.kind, self.type)
            if self.kind is NodeKind.FORMAL_PARAMETER:
                f.add_param(s)
        self.parameter = s


    def access_name(self):
        return self.parameter.access_name()

class DeclarationNode:
    def __init__(self, function, specifier):
        self.function = function
        self.specifier = specifier
        self.declarators = []

    def add(self, declarator):
        self.declarators.append(declarator)

    def check(self):
        self.specifier = TypeSystem.type(self.specifier.kind)
        type = self.specifier
        for d in self.declarators:
            d.check(type)

    def gen(self):
        for d in self.declarators:
            d.gen()

class DeclaratorNode:
    def __init__(self, function, identifier, initializer):
        self.kind = NodeKind.DECLARATOR
        self.function = function
        self.identifier = identifier
        self.initializer = initializer

    def check(self, identifier_type):
        self.identifier = self.identifier.check(self.function.symbol, self.kind, identifier_type)
        if self.initializer:
            self.initializer = self.initializer.check(self.function.symbol)

    def gen(self):
        # TODO: initializer 应该递归gen
        if self.initializer:
            src = self.initializer.gen()
            ir = AssignIR(self.function.symbol, self.identifier, src)
            self.function.gen_ir(ir)

class AssignNode(Node):
    def __init__(self, function, variable, value):
        self.variable = variable
        self.value = value
        self.function = function

    def check(self):
        self.variable = self.variable.check(self.function)
        self.value = self.value.check(self.function)

    def gen(self):
        src = self.value.gen()
        ir = AssignIR(self.function.symbol, self.variable, src)
        self.function.gen_ir(ir)

class IfNode(Node):
    def __init__(self, cond, then_stmts, else_stmts):
        self.cond = cond
        self.then = then_stmts
        self.else_ = else_stmts

class WhileNode(Node):
    def __init__(self, cond, suite):
        self.cond = cond
        self.suite = suite
