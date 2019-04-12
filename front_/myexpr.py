from front_.util import *
from front_.myenum import *
from front_.type_system import TypeSystem
from front_.symbol_system import *
from front_.ir import *
from front_.AST import Node
from front_.defind import *

class ExprNode(Node):
    def __init__(self, function, kind, left, right):
        super(ExprNode, self).__init__()
        self.left = left
        self.right = right
        self.kind = kind
        self.function = function

    def check(self, kind, type):
        super().check()
        self.left = self.left.check(kind, type)
        self.right = self.right.check(kind, type)
        return self

    def gen(self):
        left = self.left.gen()
        right = self.right.gen()
        type = TypeSystem.max_type(left.type, right.type)
        # TODO: 可能需要add symbol
        dst = self.function.new_tag(type)
        d = Defind(self.kind, dst, left, right)
        dst.defind = d

        m = {
            NodeKind.ADD: IRKind.ADD,
            NodeKind.SUB: IRKind.SUB,
            NodeKind.MUL: IRKind.MUL,
            NodeKind.DIV: IRKind.DIV,
        }
        k = m[self.kind]
        ir = ExprIR(k, dst, left, right)
        self.function.gen_ir(ir)
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
        super(ArithNode, self).__init__()
        self.left = left
        self.right = right
        self.operator = operator

class UnaryNode(Node):
    def __init__(self, function, kind, operand):
        super(UnaryNode, self).__init__()
        self.kind = kind
        self.operand = operand
        self.function = function

    def check(self, kind, type):
        super().check()
        self.operand = self.operand.check(kind, type)
        return self

    @property
    def type(self):
        return self.operand.type

    def gen(self):
        if self.kind is NodeKind.ADDRESS_OF:
            operand = self.operand.gen()

            dst = self.function.new_tag(TypeSystem.POINTER)
            d = Defind(NodeKind.ADDRESS_OF, dst, operand)
            dst.defind = d
            ir = UnaryIR(IRKind.ADDRESS_OF, dst, operand)
            self.function.gen_ir(ir)
        elif self.kind is NodeKind.INDIRECTION:
            # TODO: 类型的获取需要进一步实现
            operand = self.operand.gen()
            # TODO: 这里src的获取可以包装为id symbol的方法
            type = operand.sub_type()
            dst = self.function.new_tag(type)
            d = Defind(NodeKind.INDIRECTION, dst, operand)
            dst.defind = d

            ir = UnaryIR(IRKind.INDIRECTION, dst, operand)
            self.function.gen_ir(ir)
        return dst

class ArrayNode(Node):
    def __init__(self, variable, index):
        self.variable = variable
        self.index = index

class Array_Node(Node):
    def __init__(self, array):
        self.array = array
