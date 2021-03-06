

from front_.type_system import *
from front_.data import *
from front_.symbol_system import *
from front_.block import *
from front_.common_expression import *
import operator as _operator
import hashlib


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
        return f'\t{self.array.name()}[]\t:= {init}\n'

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
        return f'\t{dst}\t:= {array}[{index}]\n'

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
        return f'\t{dst}\t:= ({type}) {src}\n'

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

    def optimize(self):
        self.destination.add_define(self)
        self.source.add_use(self)
        return self

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
        return f'\t{dst}\t:= {left} {op} {right}\n'

    @property
    def id(self):
        array = [self.left.name(), self.right.name(), self.kind.name]
        array.sort()
        s = ''.join(array)
        bytes = s.encode()
        h = hashlib.md5(bytes).hexdigest()
        return h

class ArithIR(ExprIR):
    def optimize(self):
        ir = self.identity_optimize()
        if ir is not None:
            return ir
        if SymbolSystem.is_numeric(self.left) and SymbolSystem.is_numeric(self.right):
            ir = self.constant_folding(self.operator_function)
            return ir
        ir = self.reduction()
        if ir is not None:
            ir = ir.optimize()
            return ir
        ir = self.common_expression_optimize()
        if ir is not None:
            ir.optimize()
            return ir
        self.set_data_flow()
        return self

    def set_data_flow(self):
        dst = self.destination
        dst.add_define(self)
        self.left.add_use(self)
        self.right.add_use(self)
        common_expression[self.id] = dst


    def common_expression_optimize(self):
        target = common_expression.get(self.id)
        if target is not None:
            ir = AssignIR(self.destination, target)

            return ir
        return None

    def match_constant(self, operand, value):
        if operand.match(SymbolKind.INTCONST, SymbolKind.DOUBLECONST):
            if operand.value == value:
                return True
        return False

    def constant_folding(self, operator):
        left = self.left.value
        right = self.right.value
        dst = self.destination
        t = dst.type
        if t.match(TypeKind.DOUBLE):
            k = SymbolKind.DOUBLECONST
            cast = float
        else:
            k = SymbolKind.INTCONST
            cast = int
        v = operator(cast(left), cast(right))
        v = str(v)
        s = SymbolSystem.find_add(k, t.kind, v)
        ir = AssignIR(dst, s)
        return ir

    def reduction(self):
        return None

class AddIR(ArithIR):
    def __init__(self, destination, left, right):
        super(AddIR, self).__init__(OperatorKind.ADD, destination, left, right)
        self.operator_function = _operator.add

    def identity_optimize(self):
        left = self.left
        right = self.right
        target = None
        ir = None
        if self.match_constant(left, '0'):
            target = right
        if self.match_constant(right, '0'):
            target = left
        if target is not None:
            ir = AssignIR(self.destination, target)
        return ir

class SubIR(ArithIR):
    def __init__(self, destination, left, right):
        super(SubIR, self).__init__(OperatorKind.SUB, destination, left, right)
        self.operator_function = _operator.sub

    def identity_optimize(self):
        left = self.left
        right = self.right
        dst = self.destination
        ir = None
        if self.match_constant(right, '0'):
            ir = AssignIR(dst, left)
        elif self.match_constant(left, '0'):
            # TODO: 可以直接返回一个取负后的constant symbol
            ir = MinusIR(dst, right)
        return ir

    @property
    def id(self):
        # 操作数顺序不可变
        array = [self.left.name(), self.right.name(), self.kind.name]
        s = ''.join(array)
        bytes = s.encode()
        h = hashlib.md5(bytes).hexdigest()
        return h

class MulIR(ArithIR):
    def __init__(self, destination, left, right):
        super(MulIR, self).__init__(OperatorKind.MUL, destination, left, right)
        self.operator_function = _operator.mul

    def identity_optimize(self):
        left = self.left
        right = self.right
        ir = None
        target = None
        if self.match_constant(left, '0') or self.match_constant(right, '1'):
            target = left
        elif self.match_constant(right, '0') or self.match_constant(left, '1'):
            target = right
        if target is not None:
            ir = AssignIR(self.destination, target)
        return ir

    def reduction(self):
        left = self.left
        right = self.right
        ir = None
        target = None
        if self.match_constant(left, '2'):
            target = right
        elif self.match_constant(right, '2'):
            target = left
        if target is not None:
            ir = AddIR(self.destination, target, target)
        return ir

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
        return f'\t{dst}\t:= {op} {src}\n'

class MinusIR(IR):
    def __init__(self, destination, operand):
        super(MinusIR, self).__init__()
        self.kind = OperatorKind.MINUS
        self.operand = operand
        self.destination = destination

    def format(self):
        dst = self.destination.name()
        src = self.operand.name()
        return f'\t{dst}\t:= -{src}\n'

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
        dst = self.destination
        if self.destination is None:
            return f'\tcall {self.function.value} ({params})\n'
        else:
            dst = dst.name()
            return f'\t{dst}\t:= call {self.function.value} ({params})\n'
