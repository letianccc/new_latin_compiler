
from front_.util import *
from front_.myenum import *
from front_.type_system import TypeSystem
from front_.mysymbol import *
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
        for p in self.params:
            p.check()
        s = SymbolSystem.find_symbol(self.call_function)
        if s is None:
            s = FunctionSymbol()
            s.value = self.call_function.value
            SymbolSystem.add(s)
        self.call_function = s

    def gen(self):
        ir = CallIR(self.call_function, self.params)
        self.function.gen_ir(ir)

class FunctionNode:
    def __init__(self):
        self.kind = NodeKind.FUNCTION
        self.type = None
        self.symbol = None
        self.statements = None
        self.cur_block = None
        self.blocks = []
        self.code = ''

    def check(self):
        SymbolSystem.enter()
        for stmt in self.statements:
            stmt.check()
        SymbolSystem.quit()

    def gen(self):
        self.symbol.blocks = self.blocks
        if self.statements is None:
            return
        b = Block()
        b.kind = BlockKind.FUNCTION
        self.cur_block = b
        self.blocks.append(b)
        for stmt in self.statements:
            stmt.gen()
        index = 0
        for b in self.blocks:
            if b.kind is BlockKind.GENERAL:
                b.index = index
                index += 1

    def gen_ir(self, ir):
        self.cur_block.add_ir(ir)

    def emit(self):
        self.func_tag = f'_{function.value}'

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
        k = self.parameter.kind
        v = self.parameter.value
        if k is TokenKind.INTCONST or k is TokenKind.STRING:
            s = self.parameter.check(self.function.symbol)
        elif k is TokenKind.ID:
            s = self.parameter.check(self.function.symbol, self.type)
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
        self.function = function
        self.identifier = identifier
        self.initializer = initializer

    def check(self, identifier_type):
        self.identifier = self.identifier.check(self.function.symbol, identifier_type)
        if self.initializer:
            self.initializer = self.initializer.check(self.function.symbol)

    def gen(self):
        # TODO: initializer 应该递归gen
        if self.initializer:
            ir = AssignIR(self.function.symbol, self.identifier, self.initializer)
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
        ir = AssignIR(self.function.symbol, self.variable, self.value)
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

class ExprNode(Node):
    def __init__(self, left, right, op):
        self.left = left
        self.right = right
        self.operator = op


class OrNode(Node):
    def __init__(self, left, right):
        self.left = left
        self.right = right
        self.operator = '||'

class AndNode(Node):
    def __init__(self, left, right):
        self.left = left
        self.right = right
        self.operator = '&&'

class EqualNode(Node):
    def __init__(self, left, right, operator):
        self.left = left
        self.right = right
        self.operator = operator

class RelNode(Node):
    def __init__(self, left, right, operator):
        self.left = left
        self.right = right
        self.operator = operator

class ArithNode(Node):
    def __init__(self, left, right, operator):
        self.left = left
        self.right = right
        self.operator = operator

class UnaryNode(Node):
    def __init__(self, operator, operand):
        self.operator = operator
        self.operand = operand

class ArrayNode(Node):
    def __init__(self, variable, index):
        self.variable = variable
        self.index = index

class Array_Node(Node):
    def __init__(self, array):
        self.array = array
