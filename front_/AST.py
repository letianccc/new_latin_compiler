
from util import *


class CallNode:
    def __init__(self):
        self.function = None
        self.param = None




# kind: number
class Symbol:
    def __init__(self):
        self.kind = None
        self.index = 0
        self.token = None

    def emit(self, emiter):
        if self.kind == 'number':
            return '$' + self.token.name
        else:
            return emiter.address(self.index)



class FunctionNode:
    def __init__(self, type, name, parameters, stmts):
        self.type = type
        self.name = name
        self.stmts = stmts
        self.param = parameters


class Block:
    id_pool = 0
    def __init__(self):
        # self.stmts = stmts
        self.id = Block.id_pool
        Block.id_pool += 1
        self.irs = []

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

class Seq:
    def __init__(self, stmt, next_stmt):
        self.stmt = stmt
        self.next_stmt = next_stmt

class Stmt:
    def __init__(self, stmt):
        self.stmt = stmt

class Printf:
    def __init__(self, format_, value):
        self.format_ = format_
        self.value = value

class If:
    def __init__(self, cond, then_stmts, else_stmts):
        self.cond = cond
        self.then = then_stmts
        self.else_ = else_stmts

class While:
    def __init__(self, cond, suite):
        self.cond = cond
        self.suite = suite

class Expr:
    def __init__(self, left, right, op):
        self.left = left
        self.right = right
        self.operator = op


class Or:
    def __init__(self, left, right):
        self.left = left
        self.right = right
        self.operator = '||'

class And:
    def __init__(self, left, right):
        self.left = left
        self.right = right
        self.operator = '&&'

class Equal:
    def __init__(self, left, right, operator):
        self.left = left
        self.right = right
        self.operator = operator

class Rel:
    def __init__(self, left, right, operator):
        self.left = left
        self.right = right
        self.operator = operator

class Arith:
    def __init__(self, left, right, operator):
        self.left = left
        self.right = right
        self.operator = operator

class Unary:
    def __init__(self, operator, operand):
        self.operator = operator
        self.operand = operand

class Decl:
    def __init__(self, type_, variable, extra_data=None):
        self.type_ = type_
        self.variable = variable
        self.extra_data = extra_data

class Assign:
    def __init__(self, variable, value):
        self.variable = variable
        self.value = value

class Array:
    def __init__(self, variable, index):
        self.variable = variable
        self.index = index

class Array_:
    def __init__(self, array):
        self.array = array
