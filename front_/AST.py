
from util import *
from myenum import *
from type_system import TypeSystem
from mysymbol import *


class CallNode:
    def __init__(self, function):
        self.function = function
        self.name = None
        self.call_function = None
        self.param = None
        self.kind = NodeKind.CALL

    def check(self):
        self.param.check()
        s = SymbolSystem.find_symbol(self.call_function)
        if s is None:
            s = FunctionSymbol()
            s.name = self.call_function.value
            SymbolSystem.add(s)
        self.call_function = s



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

    def check(self):
        if self.stmts is not None:
            self.stmts.check()

class ParameterNode:
    def __init__(self, function):
        self.function = function
        self.decls = []
        self.kind = NodeKind.PARAMETER
        self.count = 0

    def add(self, parameter):
        self.decls.append(parameter)
        self.count += 1

    def check(self):
        for decl in self.decls:
            decl.check()

# class ParameterNode:
#     def __init__(self, type, parameter):
#         self.type = type
#         self.parameter = parameter
#         self.index = None
#
#     def access_name(self):
#         return self.parameter.access_name()
#

class Seq:
    def __init__(self, function, stmt, next_stmt):
        self.function = function
        self.stmt = stmt
        self.next_stmt = next_stmt
        self.kind = NodeKind.SEQ

    def check(self):
        self.stmt.check()
        if self.next_stmt is not None:
            self.next_stmt.check()

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
    def __init__(self, function, type, variable, extra_data=None):
        self.function = function
        self.type = type
        self.variable = variable
        self.extra_data = extra_data
        self.index = None

    def check(self):
        k = self.variable.kind
        if k is TokenKind.INTCONST:
            type = TypeSystem.type(TokenKind.INT)
            s = ConstantSymbol(type, self.variable.value)
        elif k is TokenKind.STRING:
            s = StringSymbol(self.variable.value)
            SymbolSystem.add(s)
            self.function.strings.append(s)
        self.variable = s

    def access_name(self):
        return self.variable.access_name()
        # if self.variable.kind is SymbolKind.STRING:
        #     return self.variable.access_name()
        # raise Exception
        # size = 4
        # offset = decl.index * size


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
