

from front_.myenum import *
from front_.type_system import *


class Block:
    # id_pool = 0
    def __init__(self, kind=BlockKind.GENERAL):
        # self.statements = stmts
        # self.id = Block.id_pool
        # Block.id_pool += 1
        self.irs = []
        self.kind = kind
        self.symbol = None
        # self.index = None
        self.__access_name = None

    def add_ir(self, ir):
        self.irs.append(ir)

    def access_name(self):
        return self.__access_name

    def set_access_name(self, access_name):
        self.__access_name = access_name


class IR:
    def __init__(self):
        self.kind = None
        self.operands = [None, None, None]
        self.op = None
        # 用于调试   from表示ir由哪个node产生
        self.from_node = None

    def match(self, *kinds):
        for k in kinds:
            if self.kind is k:
                return True
        return False

class ArrayInitialIR(IR):
    def __init__(self, array, values):
        super(ArrayInitialIR, self).__init__()
        self.kind = OperatorKind.ARRAY_INIT
        self.operator = OperatorKind.ARRAY_INIT
        self.array = array
        self.values = values

class ArrayIR(IR):
    def __init__(self, destination, array, index):
        super(ArrayIR, self).__init__()
        self.kind = OperatorKind.ARRAY
        self.operator = OperatorKind.ARRAY
        self.array = array
        self.index = index
        self.destination = destination


class ConditionalJumpIR(IR):
    def __init__(self, operator, left, right, block):
        super(ConditionalJumpIR, self).__init__()
        self.kind = OperatorKind.CONDITIONAL_JUMP
        self.operator = operator
        self.left = left
        self.right = right
        self.block = block

class JumpIR(IR):
    def __init__(self, block):
        super(JumpIR, self).__init__()
        self.kind = OperatorKind.JUMP
        self.block = block

class CastIR(IR):
    def __init__(self, destination, source):
        super(CastIR, self).__init__()
        self.kind = OperatorKind.CAST
        self.destination = destination
        self.source = source

class ReturnIR(IR):
    def __init__(self, type, operand):
        super(ReturnIR, self).__init__()
        self.kind = OperatorKind.RETURN
        self.operand = operand
        self.type = type

class BranchIR(IR):
    def __init__(self):
        super(BranchIR, self).__init__()
        self.target = None
        self.op = None

    def emit(self, emiter):
        if self.op is None:
            emiter.emit_jmp(self.op, self.target)
        else:
            left = self.operands[0]
            right = self.operands[1]
            emiter.emit_cmp(left, right)
            emiter.emit_jmp(self.op, self.target)

class AssignIR(IR):
    def __init__(self, destination, source1, source2=None):
        super(AssignIR, self).__init__()
        self.kind = OperatorKind.ASSIGN
        self.operands[0] = destination
        self.operands[1] = source1
        self.operands[2] = source2

class IndirectionAssignIR(IR):
    def __init__(self, destination, source):
        super(IndirectionAssignIR, self).__init__()
        self.kind = OperatorKind.INDIRECTION_ASSIGN
        self.dst = destination
        self.src = source

class AssignAssignIR(IR):
    def __init__(self, array, index, source):
        super(AssignAssignIR, self).__init__()
        self.kind = OperatorKind.ARRAY_ASSIGN
        self.array = array
        self.index = index
        self.source = source

class ExprIR(IR):
    def __init__(self, kind, destination, left, right):
        super(ExprIR, self).__init__()
        self.kind = kind
        self.left = left
        self.right = right
        self.destination = destination
        self.type = TypeSystem.max_type(self.left.type, self.right.type)

    def emit(self, emiter):
        emiter.emit_expr(self.op, self.left, self.right, self.result)

class UnaryIR(IR):
    def __init__(self, kind, destination, operand):
        super(UnaryIR, self).__init__()
        self.kind = kind
        self.operand = operand
        self.destination = destination

class CallIR(IR):
    """docstring for CallIR."""

    def __init__(self, destination, function, parameters):
        super(CallIR, self).__init__()
        self.destination = destination
        self.function = function
        self.params = parameters
        self.kind = OperatorKind.CALL
