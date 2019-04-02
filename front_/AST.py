
from util import *
from myenum import *


class CallNode:
    def __init__(self):
        self.name = None
        self.function = None
        self.param = None
        self.kind = NodeKind.CALL




# kind: number
# class Symbol:
#     def __init__(self):
#         self.kind = None
#         self.index = 0
#         self.token = None
#
#     def emit(self, emiter):
#         if self.kind == 'number':
#             return '$' + self.token.name
#         else:
#             return emiter.address(self.index)
#


class FunctionNode:
    def __init__(self, symbol, stmts):
        self.kind = NodeKind.FUNCTION
        self.type = type
        self.symbol = symbol
        self.stmts = stmts


class Seq:
    def __init__(self, stmt, next_stmt):
        self.stmt = stmt
        self.next_stmt = next_stmt
        self.kind = NodeKind.SEQ

class Stmt:
    def __init__(self, stmt):
        self.stmt = stmt

class Printf:
    def __init__(self, format_, value):
        self.format_ = format_
        self.value = value
        self.kind = NodeKind.PRINTF

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
