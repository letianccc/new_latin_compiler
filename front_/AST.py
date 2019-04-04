
from util import *
from myenum import *
from type_system import TypeSystem
from mysymbol import *
from ir import *


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
        self.type = type
        self.parameter = parameter
        self.index = None

    def check(self):
        k = self.parameter.kind
        v = self.parameter.value
        if k is TokenKind.INTCONST or k is TokenKind.STRING:
            s = self.parameter.check(self.function.symbol)
        elif k is TokenKind.ID:
            have_declared = self.kind is NodeKind.ACTUAL_PARAMETER
            s = self.parameter.check(self.function.symbol, have_declared)
        self.parameter = s

    def access_name(self):
        return self.parameter.access_name()

class DeclarationNode:
    def __init__(self, function):
        self.function = function
        self.specifier = None
        self.declarators = []

    def add(self, declarator):
        self.declarators.append(declarator)

    def check(self):
        self.specifier = TypeSystem.type(self.specifier.kind)
        type = self.specifier
        for d in self.declarators:
            d.check(type)

    def gen(self):
        return

class DeclaratorNode:
    def __init__(self, function):
        self.function = function
        self.identifier = None
        self.initializer = None

    def check(self, type):
        s = SymbolSystem.find_symbol(self.identifier, None, LevelKind.CURRENT)
        if s is not None:
            raise Exception("不能声明已经存在的变量")
        s = IdentifierSymbol()
        s.value = self.identifier.value
        s.type = type
        SymbolSystem.add(s)
        self.function.symbol.locals.append(s)

class AssignNode(Node):
    def __init__(self, variable, value):
        self.variable = variable
        self.value = value

    def check(self):
        self.variable = self.variable.check()

        for p in self.params:
            p.check()
        s = SymbolSystem.find_symbol(self.call_function)
        if s is None:
            s = FunctionSymbol()
            s.value = self.call_function.value
            SymbolSystem.add(s)
        self.call_function = s

    def gen(self):
        return
        ir = CallIR(self.call_function, self.params)
        self.function.gen_ir(ir)


class Node(object):
    """docstring for Node."""

    def __init__(self):
        super(Node, self).__init__()

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
