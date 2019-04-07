from front_.util import *
from front_.myenum import *
from front_.type_system import TypeSystem
from front_.symbol_system import *
from front_.ir import *
from front_.AST import Node


class ExprNode(Node):
    def __init__(self, function, left, right, kind):
        self.left = left
        self.right = right
        self.kind = kind
        self.function = function

    def check(self, function):
        self.left = self.left.check(function)
        self.right = self.right.check(function)
        return self

    def gen(self):
        left = self.left.gen()
        right = self.right.gen()
        type = TypeSystem.max_type(left.type, right.type)
        dst = TagSymbol(type)
        m = {
            NodeKind.ADD: IRKind.ADD,
            NodeKind.SUB: IRKind.SUB,
            NodeKind.MUL: IRKind.MUL,
            NodeKind.DIV: IRKind.DIV,
        }
        k = m[self.kind]
        ir = ExprIR(k, dst, left, right)
        self.function.symbol.gen_ir(ir)
        return dst

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
    def __init__(self, kind, operand):
        self.kind = kind
        self.operand = operand

    def check(self):
        self.operand.check()

class ArrayNode(Node):
    def __init__(self, variable, index):
        self.variable = variable
        self.index = index

class Array_Node(Node):
    def __init__(self, array):
        self.array = array
