

from front_.myenum import *
from front_.type_system import *
from front_.data import *


class Block:
    id = 0
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
        self.id = 0
        Block.id += 1

    def add_ir(self, ir):
        self.irs.append(ir)

    def access_name(self):
        return self.__access_name

    def set_access_name(self, access_name):
        self.__access_name = access_name

    def name(self):
        return f'B{str(self.id)}'

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

    def optimize(self):
        return self

    def format(self):
        raise Exception
        return None

class ArrayInitialIR(IR):
    def __init__(self, array, values):
        super(ArrayInitialIR, self).__init__()
        self.kind = OperatorKind.ARRAY_INIT
        self.operator = OperatorKind.ARRAY_INIT
        self.array = array
        self.values = values

    def format(self):
        values = []
        for v in self.values:
            values.append(v.name())
        values = ",".join(values)
        init = '{' + values + '}'
        return f'\t{self.array.name()}[]\t= {init}\n'

class ArrayIR(IR):
    def __init__(self, destination, array, index):
        super(ArrayIR, self).__init__()
        self.kind = OperatorKind.ARRAY
        self.operator = OperatorKind.ARRAY
        self.array = array
        self.index = index
        self.destination = destination

    def format(self):
        dst = self.destination.name()
        array = self.array.name()
        index = self.index.name()
        return f'\t{dst}\t= {array}[{index}]\n'

class ConditionalJumpIR(IR):
    def __init__(self, operator, left, right, block):
        super(ConditionalJumpIR, self).__init__()
        self.kind = OperatorKind.CONDITIONAL_JUMP
        self.operator = operator
        self.left = left
        self.right = right
        self.block = block

    def format(self):
        left = self.left.name()
        right = self.right.name()
        block = self.block.name()
        op = operator_format[self.operator]
        return f'\tif {left} {op} {right} goto {block}\n'

class JumpIR(IR):
    def __init__(self, block):
        super(JumpIR, self).__init__()
        self.kind = OperatorKind.JUMP
        self.block = block

    def format(self):
        block = self.block.name()
        return f'\tgoto {block}\n'

class CastIR(IR):
    def __init__(self, destination, source):
        super(CastIR, self).__init__()
        self.kind = OperatorKind.CAST
        self.destination = destination
        self.source = source

    def format(self):
        dst = self.destination
        type = dst.type.name()
        dst = dst.name()
        src = self.source.name()
        return f'\t{dst}\t= ({type}) {src}\n'

class ReturnIR(IR):
    def __init__(self, type, operand):
        super(ReturnIR, self).__init__()
        self.kind = OperatorKind.RETURN
        self.operand = operand
        self.type = type

    def format(self):
        return f'\treturn {self.operand.name()}\n'

class AssignIR(IR):
    def __init__(self, destination, source):
        super(AssignIR, self).__init__()
        self.kind = OperatorKind.ASSIGN
        self.destination = destination
        self.source = source

    def format(self):
        dst = self.destination.name()
        src = self.source.name()
        return f'\t{dst}\t= {src}\n'

class IndirectionAssignIR(IR):
    def __init__(self, destination, source):
        super(IndirectionAssignIR, self).__init__()
        self.kind = OperatorKind.INDIRECTION_ASSIGN
        self.dst = destination
        self.src = source

    def format(self):
        return f'\t*{self.dst.name()}\t= {self.src.name()}\n'

class ArrayAssignIR(IR):
    def __init__(self, array, index, source):
        super(ArrayAssignIR, self).__init__()
        self.kind = OperatorKind.ARRAY_ASSIGN
        self.array = array
        self.index = index
        self.source = source

    def format(self):
        src = self.source.name()
        array = self.array.name()
        index = self.index.name()
        return f'\t{array}[{index}]\t= {src}\n'

class ExprIR(IR):
    def __init__(self, kind, destination, left, right):
        super(ExprIR, self).__init__()
        self.kind = kind
        self.left = left
        self.right = right
        self.destination = destination
        self.type = TypeSystem.max_type(self.left.type, self.right.type)

    def format(self):
        left = self.left.name()
        right = self.right.name()
        dst = self.destination.name()
        op = operator_format[self.kind]
        return f'\t{dst}\t= {left} {op} {right}\n'

class AddIR(ExprIR):
    def optimize(self):
        left = self.left
        right = self.right
        ir = self
        use = None
        if self.is_zero(left):
            use = right
        if self.is_zero(right):
            use = left
        if use is not None:
            ir = AssignIR(self.destination, use)
        return ir

    def is_zero(self, operand):
        if operand.match(SymbolKind.INTCONST, SymbolKind.DOUBLECONST):
            if operand.value == '0':
                return True
        return False

class SubIR(ExprIR):
    def optimize(self):
        return self
        left = self.left
        right = self.right
        ir = self
        use = None
        if self.is_zero(left):
            use = right
        if self.is_zero(right):
            use = left
        if use is not None:
            ir = AssignIR(self.destination, use)
        return ir

class MulIR(ExprIR):
    def optimize(self):
        op = self.left
        if op.match(SymbolKind.INTCONST, SymbolKind.DOUBLECONST):
            if op.value == '0':
                ir = AssignIR(self.destination, self.right)
                return ir
        return self

class UnaryIR(IR):
    def __init__(self, kind, destination, operand):
        super(UnaryIR, self).__init__()
        self.kind = kind
        self.operand = operand
        self.destination = destination

    def format(self):
        dst = self.destination.name()
        src = self.operand.name()
        if self.kind is OperatorKind.ADDRESS_OF:
            op = '&'
        elif self.kind is OperatorKind.INDIRECTION:
            op = '*'
        return f'\t{dst}\t= {op} {src}\n'

class MinusIR(IR):
    def __init__(self, destination, operand):
        super(MinusIR, self).__init__()
        self.kind = OperatorKind.MINUS
        self.operand = operand
        self.destination = destination

    def format(self):
        dst = self.destination.name()
        src = self.operand.name()
        return f'\t{dst}\t= -{src}\n'

class CallIR(IR):
    """docstring for CallIR."""

    def __init__(self, destination, function, parameters):
        super(CallIR, self).__init__()
        self.destination = destination
        self.function = function
        self.params = parameters
        self.kind = OperatorKind.CALL

    def format(self):
        params = []
        for v in self.params:
            params.append(v.name())
        params = ",".join(params)
        return f'\tcall\t{self.function.value} ({params})\n'
