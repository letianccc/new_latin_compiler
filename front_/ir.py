

from myenum import *



class Block:
    id_pool = 0
    def __init__(self):
        # self.stmts = stmts
        self.id = Block.id_pool
        Block.id_pool += 1
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


class PrintIR(IR):
    def __init__(self):
        super(PrintIR, self).__init__()
        self.value = None
        self.format = None

    def emit(self, emiter):
        if self.value:
            if hasattr(self.value, 'index'):
                addr = emiter.address(self.value.index)
            else:
                addr = '$' + self.value.name
            emiter.movl(addr, '%esi')
        LC_tag = '$' + emiter.LC_tag(self.format)
        ir = 'movl ' + LC_tag + ', %edi\n'\
                   'movl $0, %eax\n'\
                   'call printf\n'\
                   'movl $0, %eax\n'
        emiter.emit_as(ir)

class AssignIR(IR):
    def emit(self, emiter):
        left = self.operands[0]
        right = self.operands[1]
        emiter.movl(right.emit(emiter), '%eax')
        emiter.movl('%eax', emiter.address(left.index))

class ExprIR(IR):
    def __init__(self):
        self.op = None
        self.left = None
        self.right = None
        self.result = None

    def emit(self, emiter):
        emiter.emit_expr(self.op, self.left, self.right, self.result)

class CallIR(object):
    """docstring for CallIR."""

    def __init__(self):
        super(CallIR, self).__init__()
        self.function = None
        self.param = None
        self.kind = IRKind.CALL
