

from front_.myenum import *



class Block:
    # id_pool = 0
    def __init__(self):
        # self.statements = stmts
        # self.id = Block.id_pool
        # Block.id_pool += 1
        self.irs = []
        self.kind = None
        self.symbol = None
        self.index = None

    def add_ir(self, ir):
        self.irs.append(ir)

# class IfBlock:
#     def __init__(self, stmts):
#         self.condBlock = None
#         self.clauseBlock = None
#         self.elseBlock = None
#         # if块接下来的块
#         self.nextBlock = None

class IR:
    def __init__(self):
        self.kind = None
        self.operands = [None, None, None]
        self.op = None

    def match(self, *kinds):
        for k in kinds:
            if self.kind is k:
                return True
        return False

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
    def __init__(self, function, operand1, operand2, operand3=None):
        super(AssignIR, self).__init__()
        self.kind = IRKind.ASSIGN
        self.operands[0] = operand1
        self.operands[1] = operand2
        self.operands[2] = operand3



class ExprIR(IR):
    def __init__(self, kind, destination, left, right):
        self.kind = kind
        self.left = left
        self.right = right
        self.destination = destination

    def emit(self, emiter):
        emiter.emit_expr(self.op, self.left, self.right, self.result)

class UnaryIR(IR):
    def __init__(self, kind, destination, operand):
        self.kind = kind
        self.operand = operand
        self.destination = destination

class CallIR(IR):
    """docstring for CallIR."""

    def __init__(self, function, parameters):
        super(CallIR, self).__init__()
        self.function = function
        self.params = parameters
        self.kind = IRKind.CALL
