
from util import *
from myenum import *
from type_system import TypeSystem
from mysymbol import *
from ir import *


class CallNode:
    def __init__(self, function, call_function, parameters):
        self.function = function
        self.name = None
        self.call_function = call_function
        self.params = parameters
        self.kind = NodeKind.CALL

    def check(self):
        for p in self.params:
            p.check()
        # self.params.check()
        s = SymbolSystem.find_symbol(self.call_function)
        if s is None:
            s = FunctionSymbol()
            s.name = self.call_function.value
            SymbolSystem.add(s)
        self.call_function = s

    def gen(self):
        ir = CallIR(self.call_function, self.params)
        self.function.gen_ir(ir)



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
    def __init__(self):
        self.kind = NodeKind.FUNCTION
        self.type = None
        self.symbol = None
        self.stmts = None
        self.cur_block = None
        self.blocks = []
        self.code = ''

    def check(self):
        if self.stmts is not None:
            self.stmts.check()

    def gen(self):
        self.symbol.blocks = self.blocks
        if self.stmts is None:
            return
        b = Block()
        b.kind = BlockKind.FUNCTION
        self.cur_block = b
        self.blocks.append(b)
        self.stmts.gen()
        index = 0
        for b in self.blocks:
            if b.kind is BlockKind.GENERAL:
                b.index = index
                index += 1

    def gen_ir(self, ir):
        self.cur_block.add_ir(ir)

    def emit(self):
        self.func_tag = f'_{function.name}'


class ParameterListNode:
    def __init__(self, function):
        self.function = function
        self.parameters = []
        self.kind = NodeKind.PARAMETER
        self.count = 0

    def add(self, type, parameter):
        p = ParameterNode(self.function, type, parameter)
        p.index = self.count
        self.count += 1
        self.parameters.append(p)


    def check(self):
        for p in self.parameters:
            p.check()

class ParameterNode:
    def __init__(self, function, type, parameter):
        self.function = function
        self.type = type
        self.parameter = parameter
        self.index = None

    def check(self):
        k = self.parameter.kind
        v = self.parameter.value
        if k is TokenKind.INTCONST:
            type = TypeSystem.type(TokenKind.INT)
            s = ConstantSymbol(type, v)
        elif k is TokenKind.STRING:
            s = StringSymbol(v)
            SymbolSystem.add(s)
            strings = self.function.symbol.strings
            strings.append(s)
        self.parameter = s

    def access_name(self):
        return self.parameter.access_name()


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

    def gen(self):
        self.stmt.gen()
        if self.next_stmt is not None:
            self.next_stmt.gen()

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

class DeclNode:
    def __init__(self, function, type, variable, extra_data=None):
        self.function = function
        self.type = type
        self.variable = variable
        self.extra_data = extra_data
        self.index = None

    def check(self):
        k = self.variable.kind
        v = self.variable.value
        if k is TokenKind.INTCONST:
            type = TypeSystem.type(TokenKind.INT)
            s = ConstantSymbol(type, v)
        elif k is TokenKind.STRING:
            s = StringSymbol(v)
            SymbolSystem.add(s)
            strings = self.function.symbol.strings
            strings.append(s)
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
