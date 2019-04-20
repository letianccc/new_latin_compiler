

from front_.util import *
from front_.node.node import Node
from front_.defind import *
from front_.ir import *
from front_.reg_system import *
from front_.symbol_system import *
from front_.data import *
from front_.memory import *


class ExpressionNode(Node):
    def change_type(self):
        return self


class ArrayNode(Node):
    def __init__(self, function, array, index_expression):
        self.array = array
        self.index_expression = index_expression
        self.function = function
        self.kind = NodeKind.ARRAY
        self.type = None

    def check(self):
        super().check()
        self.array = self.array.check()
        self.type = self.array.type
        self.index_expression = self.index_expression.check()
        return self

    def gen(self):
        index = self.index_expression.gen()
        self.gen_assign_core(RegSystem.ECX, index)
        src = self
        dst = self.function.new_tag(self.type)
        d = Defind(None, dst, self)
        self.gen_assign_core(dst, src)
        return dst

    def access_name(self):
        offset = self.array.offset
        size = self.type.size
        pos = f'{offset}(%esp, %ecx, {size})'
        return pos



class CastNode(Node):
    def __init__(self, function, type, expression):
        super(CastNode, self).__init__()
        self.kind = NodeKind.CAST
        self.function = function
        self.expression = expression
        self.type = type
        self.operator = OperatorKind.CAST

    def check(self):
        super().check()
        self.type = self.type.check()
        self.expression = self.expression.check()
        return self

    def gen(self):
        src = self.expression.gen()
        dst = self.function.new_tag(self.type)
        d = Defind(self.operator, dst, src)
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
        self.operator = OperatorKind.INDIRECTION

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
        d = Defind(self.operator, dst, operand)
        dst.defind = d
        ir = UnaryIR(self.operator, dst, operand)
        self.function.gen_ir(ir)
        return dst

class AddressOfNode(Node):
    def __init__(self, function, operand):
        super(AddressOfNode, self).__init__()
        self.kind = NodeKind.ADDRESS_OF
        self.operator = OperatorKind.ADDRESS_OF
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
        d = Defind(self.operator, dst, operand)
        dst.defind = d
        ir = UnaryIR(self.operator, dst, operand)
        self.function.gen_ir(ir)
        return dst

class CallNode(Node):
    def __init__(self, function, call_function, parameters):
        super(CallNode, self).__init__()
        self.function = function
        self.call_function = call_function
        self.params = parameters
        self.kind = NodeKind.CALL
        self.operator = OperatorKind.CALL

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

        size = self.call_function.type.size
        dst = RegSystem.reg(RegKind.AX, size)
        return dst

class AssignNode(Node):
    def __init__(self, function, variable, value):
        super(AssignNode, self).__init__()
        self.variable = variable
        self.value = value
        self.function = function
        self.kind = NodeKind.ASSIGN
        self.operator = OperatorKind.ASSIGN

    def check(self):
        super().check()
        self.variable = self.variable.check()
        self.value = self.value.check()
        d = Defind(self.operator, self.variable, self.value)
        self.variable.defind = d
        return self

    def gen(self):
        dst = self.variable
        src = self.value
        self.gen_assign_core_node(dst, src)

class ArithNode(ExpressionNode):
    def __init__(self, function, operator, left, right):
        super(ArithNode, self).__init__()
        self.left = left
        self.right = right
        self.kind = NodeKind.ARITH
        self.operator = operator
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

        k = self.operator
        ir = ExprIR(k, dst, left, right)
        self.function.gen_ir(ir)
        return dst

class LogicNode(ExpressionNode):
    def __init__(self, function, operator, left, right):
        super(LogicNode, self).__init__()
        self.left = left
        self.right = right
        self.operator = operator
        self.function = function
        self.kind = NodeKind.BOOLEAN

    def check(self):
        super().check()
        self.left = self.left.check()
        self.right = self.right.check()
        return self

    def gen(self, true_block, false_block):
        middle_block = Block()
        if self.operator is OperatorKind.AND:
            left_not = self.left.not_node()
            left_not.gen(false_block, middle_block)
        elif self.operator is OperatorKind.OR:
            self.left.gen(true_block, middle_block)
        self.function.add_block(middle_block)
        self.function.change_block(middle_block)
        self.right.gen(true_block, false_block)

    def not_node(self):
        left = self.left.not_node()
        right = self.right.not_node()
        k = not_map[self.operator]
        n = LogicNode(self.function, k, left, right)
        return n

class CompareNode(ExpressionNode):
    def __init__(self, function, operator, left, right):
        super(CompareNode, self).__init__()
        self.left = left
        self.right = right
        self.kind = NodeKind.BOOLEAN
        self.function = function
        self.operator = operator

    def check(self):
        super().check()
        self.left = self.left.check()
        self.right = self.right.check()
        return self

    def gen(self, true_block, false_block):

        left = self.left.gen()
        right = self.right.gen()
        type = TypeSystem.max_type(left.type, right.type)
        if type.match(TypeKind.DOUBLE):
            left, right = self.translate_type(type, left, right)

        k = self.operator
        ir = ConditionalJumpIR(k, left, right, true_block)
        self.gen_ir(ir)

    def not_node(self):
        left = self.left.not_node()
        right = self.right.not_node()
        k = not_map[self.operator]
        n = CompareNode(self.function, k, left, right)
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
        self.operator = OperatorKind.RETURN

    def check(self):
        super().check()
        self.operand = self.operand.check()
        return self

    def gen(self):
        src = self.operand.gen()
        t = self.function.type
        src = self.translate_type(t, src)
        ir = ReturnIR(t, src)
        self.gen_ir(ir)

# class ArrayNode(Node):
#     def __init__(self, variable, index):
#         self.variable = variable
#         self.index = index
#
# class Array_Node(Node):
#     def __init__(self, array):
#         self.array = array
