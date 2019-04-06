
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


        for p in self.params:
            p.check()

        space = 0
        for p in self.params:
            space += p.parameter.type.size
        if space > self.function.symbol.call_space:
            self.function.symbol.call_space = space
        # count = len(self.params)
        # if count > self.function.symbol.max_actual_param:
        #     self.function.symbol.max_actual_param = count

        self.call_function = self.call_function.check(self.function, NodeKind.CALL)

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
        k = self.parameter.kind
        v = self.parameter.value
        if k is TokenKind.INTCONST or k is TokenKind.STRING or k is TokenKind.DOUBLECONST:
            s = self.parameter.check(self.function.symbol)
        elif k is TokenKind.ID:

            s = self.parameter.check(self.function.symbol, self.kind, self.type)
            if self.kind is NodeKind.FORMAL_PARAMETER:
                self.function.symbol.add_param(s)
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
