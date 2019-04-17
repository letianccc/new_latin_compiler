

from front_.util import *
from front_.node.node import Node
from front_.defind import *
from front_.ir import *
from front_.reg_system import *


class ExpressionNode(Node):
    def change_type(self):
        return self


class CastNode(Node):
    def __init__(self, function, type, expression):
        super(CastNode, self).__init__()
        self.kind = NodeKind.CAST
        self.function = function
        self.expression = expression
        self.type = type

    def check(self):
        super().check()
        self.type = self.type.check()
        self.expression = self.expression.check()
        return self

    def gen(self):
        src = self.expression.gen()
        dst = self.function.new_tag(self.type)
        d = Defind(NodeKind.CAST, dst, src)
        dst.defind = d
        ir = CastIR(dst, src)
        self.function.gen_ir(ir)
        return dst

class IndirectionNode(Node):
    def __init__(self, function, operand):
        super(IndirectionNode, self).__init__()
        self.kind = NodeKind.INDIRECTION
        self.operand = operand
        self.function = function

    def check(self):
        super().check()
        self.operand = self.operand.check()
        assert self.operand.type.match(TypeKind.POINTER)
        return self

    @property
    def type(self):
        return self.operand.type

    def gen(self):
        # TODO: 类型的获取需要进一步实现
        operand = self.operand.gen()
        # TODO: 这里src的获取可以包装为id symbol的方法
        type = operand.sub_type()
        dst = self.function.new_tag(type)
        d = Defind(NodeKind.INDIRECTION, dst, operand)
        dst.defind = d
        ir = UnaryIR(OperatorKind.INDIRECTION, dst, operand)
        self.function.gen_ir(ir)
        return dst

class AddressOfNode(Node):
    def __init__(self, function, operand):
        super(AddressOfNode, self).__init__()
        self.kind = NodeKind.ADDRESS_OF
        self.operand = operand
        self.function = function
        self.type = None

    def check(self):
        super().check()
        self.operand = self.operand.check()
        self.type = TypeSystem.pointer(self.operand.type)
        return self

    def gen(self):
        operand = self.operand.gen()
        dst = self.function.new_tag(TypeSystem.POINTER)
        d = Defind(NodeKind.ADDRESS_OF, dst, operand)
        dst.defind = d
        ir = UnaryIR(OperatorKind.ADDRESS_OF, dst, operand)
        self.function.gen_ir(ir)
        return dst

class CallNode(Node):
    def __init__(self, function, call_function, parameters):
        super(CallNode, self).__init__()
        self.function = function
        self.call_function = call_function
        self.params = parameters
        self.kind = NodeKind.CALL


    def check(self):

        super().check()
        self.call_function = self.call_function.check()

        params = []
        for p in self.params:
            params.append(p.check())
        self.params = params
        return self

    def check_callee(self):
        if not self.call_function.is_extern:
            if len(self.params) != len(self.call_function.params):
                raise Exception('函数参数数量不匹配')
            # TODO: 检测参数兼容性


    def gen(self):
        params = []
        for p in self.params:
            src = p.gen()
            params.append(src)
        ir = CallIR(self.call_function, params)
        self.gen_ir(ir)
        size = TypeSystem.INT.size
        dst = RegSystem.reg(RegKind.AX, size)
        return dst

class AssignNode(Node):
    def __init__(self, function, variable, value):
        super(AssignNode, self).__init__()
        self.variable = variable
        self.value = value
        self.function = function
        self.kind = NodeKind.ASSIGN

    def check(self):
        super().check()
        self.variable = self.variable.check()
        self.value = self.value.check()
        d = Defind(NodeKind.ASSIGN, self.variable, self.value)
        self.variable.defind = d

    def gen(self):
        if self.variable.match(NodeKind.INDIRECTION):
            dst = self.variable.gen()
            src = self.value.gen()
            dst = dst.defind.src1
            ir = IndirectionAssignIR(dst, src)
            self.gen_ir(ir)
        else:
            self.gen_assign(self.variable, self.value)

class BinaryNode(ExpressionNode):
    def __init__(self, function, kind, left, right):
        super(BinaryNode, self).__init__()
        self.left = left
        self.right = right
        self.kind = kind
        self.function = function

    def check(self):
        super().check()
        self.left = self.left.check()
        self.right = self.right.check()
        return self

    def gen(self):
        left = self.left.gen()
        right = self.right.gen()
        type = TypeSystem.max_type(left.type, right.type)
        if type.match(TypeKind.DOUBLE):
            left, right = self.translate_type(type, left, right)

        # TODO: 可能需要add symbol
        dst = self.function.new_tag(type)
        d = Defind(self.kind, dst, left, right)
        dst.defind = d

        m = {
            NodeKind.ADD: OperatorKind.ADD,
            NodeKind.SUB: OperatorKind.SUB,
            NodeKind.MUL: OperatorKind.MUL,
            NodeKind.DIV: OperatorKind.DIV,
        }
        k = m[self.kind]
        ir = ExprIR(k, dst, left, right)
        self.function.gen_ir(ir)
        return dst

class RelationNode(ExpressionNode):
    def __init__(self, function, kind, left, right):
        super(RelationNode, self).__init__()
        self.left = left
        self.right = right
        self.kind = kind
        self.function = function

    def check(self):
        super().check()
        self.left = self.left.check()
        self.right = self.right.check()
        return self

    def gen(self, true_block, false_block):
        if self.match(NodeKind.AND):
            middle_block = Block()
            left_not = self.left.not_node()
            left_not.gen(false_block, middle_block)
            self.function.add_block(middle_block)
            self.function.change_block(middle_block)
            self.right.gen(true_block, false_block)
            return
        if self.match(NodeKind.OR):
            middle_block = Block()
            self.left.gen(true_block, middle_block)
            self.function.add_block(middle_block)
            self.function.change_block(middle_block)
            self.right.gen(true_block, false_block)
            return

        left = self.left.gen()
        right = self.right.gen()
        type = TypeSystem.max_type(left.type, right.type)
        if type.match(TypeKind.DOUBLE):
            left, right = self.translate_type(type, left, right)

        op_map = {
            NodeKind.EQUAL: OperatorKind.EQUAL,
            NodeKind.UNEQUAL: OperatorKind.UNEQUAL,
            NodeKind.GREAT: OperatorKind.GREAT,
            NodeKind.LESS: OperatorKind.LESS,
            NodeKind.GREAT_EQ: OperatorKind.GREAT_EQ,
            NodeKind.LESS_EQ: OperatorKind.LESS_EQ,
        }
        k = op_map[self.kind]
        ir = ConditionalJumpIR(k, left, right, true_block)
        self.gen_ir(ir)

    def not_node(self):
        not_map = {
            NodeKind.EQUAL: NodeKind.UNEQUAL,
            NodeKind.UNEQUAL: NodeKind.EQUAL,
            NodeKind.GREAT: NodeKind.LESS_EQ,
            NodeKind.GREAT_EQ: NodeKind.LESS,
            NodeKind.LESS: NodeKind.GREAT_EQ,
            NodeKind.LESS_EQ: NodeKind.GREAT,
            NodeKind.AND: NodeKind.OR,
            NodeKind.OR: NodeKind.AND,
        }
        left = self.left.not_node()
        right = self.right.not_node()
        k = not_map[self.kind]
        n = RelationNode(self.function, k, left, right)
        return n

class OrNode(ExpressionNode):
    def __init__(self, left, right):
        self.left = left
        self.right = right
        self.operator = '||'

class AndNode(ExpressionNode):
    def __init__(self, left, right):
        self.left = left
        self.right = right
        self.operator = '&&'

class EqualNode(ExpressionNode):
    def __init__(self, left, right, operator):
        self.left = left
        self.right = right
        self.operator = operator

class RelNode(ExpressionNode):
    def __init__(self, left, right, operator):
        self.left = left
        self.right = right
        self.operator = operator

class ReturnNode(Node):
    def __init__(self, function, operand):
        super(ReturnNode, self).__init__()
        self.operand = operand
        self.function = function
        self.kind = NodeKind.RETURN

    def check(self):
        super().check()
        self.operand = self.operand.check()

    def gen(self):
        src = self.operand.gen()
        type = TypeSystem.INT
        ir = ReturnIR(type, src)
        self.gen_ir(ir)

class ArrayNode(Node):
    def __init__(self, variable, index):
        self.variable = variable
        self.index = index

class Array_Node(Node):
    def __init__(self, array):
        self.array = array
