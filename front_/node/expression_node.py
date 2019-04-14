

from front_.util import *
from front_.node.node import Node
from front_.defind import *
from front_.ir import *
from front_.reg_system import *





class CastNode(Node):
    def __init__(self, function, type, expression):
        super(CastNode, self).__init__()
        self.kind = NodeKind.CAST
        self.function = function
        self.expression = expression
        self.type = type

    def check(self, kind, type):
        super().check()
        self.type = self.type.check(type)
        self.expression = self.expression.check(kind, type)
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

    def check(self, kind, type):
        super().check()
        self.operand = self.operand.check(kind, type)
        assert self.operand.type.match(TypeSystem.POINTER)
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

    def check(self, kind, type):
        super().check()
        op = self.operand.check(kind, type)
        self.operand = op
        return self

    @property
    def type(self):
        t = TypeSystem.new(TypeKind.POINTER, TypeSystem.POINTER.size, self.operand.type)
        return t

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

    def check(self, kind, type):
        super().check()
        self.call_function = self.call_function.check(NodeKind.CALL)

        for p in self.params:
            p.check()

        # self.allocate_call_space()
        # 分配实参偏移
        # self.set_param_offset()
        return self

    def allocate_call_space(self):
        # 计算调用最多需要预留的栈空间
        space = 0
        callee = self.call_function
        int_size = TypeSystem.INT.size
        for p in self.params:
            psize = p.parameter.type.size
            if callee.is_extern:
                # printf参数占8位或4位
                size = max(int_size, psize)
            else:
                size = psize
            space += size
        current = self.function.call_space
        self.function.call_space = max(space, current)


    def check_callee(self):
        if not self.call_function.is_extern:
            if len(self.params) != len(self.call_function.params):
                raise Exception('函数参数数量不匹配')
            # TODO: 检测参数兼容性


    def set_param_offset(self):
        # TODO: 这部分逻辑要移到emit中
        # FIXME: 这部分逻辑可以删掉 因为在emit allocate已经实现过
        size = 0
        offset = 0
        for p in reversed(self.params):
            p.offset = offset
            size = p.parameter.type.size
            offset += size

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

    def check(self, kind, type):
        super().check()
        self.variable = self.variable.check(self.kind, None)
        self.value = self.value.check(self.kind, None)
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
            dst = self.variable.gen()
            src = self.value.gen()
            ir = AssignIR(dst, src)
            self.gen_ir(ir)

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
            NodeKind.ADD: OperatorKind.ADD,
            NodeKind.SUB: OperatorKind.SUB,
            NodeKind.MUL: OperatorKind.MUL,
            NodeKind.DIV: OperatorKind.DIV,
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

class ReturnNode(Node):
    def __init__(self, function, operand):
        super(ReturnNode, self).__init__()
        self.operand = operand
        self.function = function
        self.kind = NodeKind.RETURN

    def check(self, kind, type):
        super().check()
        self.operand = self.operand.check(kind, type)

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
