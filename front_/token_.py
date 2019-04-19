from front_.symbol_system import *
from front_.myenum import *
from front_.type_system import TypeSystem


class Token(object):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

    def match(self, *kinds):
        for k in kinds:
            if self.kind is k:
                return True
        return False

class ConstantToken(Token):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

class IntConstant(ConstantToken):
    def __init__(self, value):
        self.value = value
        self.kind = TokenKind.INTCONST

    def check(self):
        k = SymbolKind.INTCONST
        t = TypeKind.INT
        s = SymbolSystem.find_symbol(k, self.value, t)
        if s is None:
            s = IntSymbol(self.value)
            SymbolSystem.add(s)
        return s

class DoubleConstant(ConstantToken):
    def __init__(self, value):
        self.value = value
        self.kind = TokenKind.DOUBLECONST

    def check(self):
        # TODO: 这部分逻辑可以抽象
        # add_symbol(kind, type, value)
        # type = TypeSystem.type(self.type)
        k = SymbolKind.DOUBLECONST
        t = TypeKind.DOUBLE
        s = SymbolSystem.find_symbol(k, self.value, t)
        if s is None:
            s = DoubleSymbol(self.value)
            SymbolSystem.add(s)
        return s

class IdentifierToken(Token):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

    def check(self):
        s = SymbolSystem.find_symbol(SymbolKind.ID, self.value)
        if s is None:
            raise Exception("缺少声明", self.value)
        return s

class FunctionToken(Token):
    def __init__(self, value):
        self.value = value
        self.kind = TokenKind.FUNCTION

    def check(self):
        # TODO: 检测最外层作用域标识符是否存在
        # TODO: 检测是否有声明保留函数 printf
        s = SymbolSystem.find_symbol(SymbolKind.FUNCTION, self.value)
        if s is None:
            v = self.value
            type = TypeSystem.VOID
            s = FunctionSymbol(type, v, True)
            SymbolSystem.add(s)
        return s

class DeclaratorToken(Token):
    def __init__(self, value):
        self.value = value
        self.kind = TokenKind.DECLARATOR

    def check(self, type):
        s = SymbolSystem.find_symbol(SymbolKind.ID, self.value, None, LevelKind.CURRENT)
        if s is not None:
            raise Exception("重复定义")
        s = IdentifierSymbol(type, self.value)
        SymbolSystem.add(s)
        return s

class ArrayDeclaratorToken(Token):
    def __init__(self, value, size_expression):
        self.value = value
        self.kind = TokenKind.DECLARATOR
        self.size_expression = size_expression

    def check(self, type):
        s = SymbolSystem.find_symbol(SymbolKind.ID, self.value, None, LevelKind.CURRENT)
        if s is not None:
            raise Exception("重复定义")
        expr = self.size_expression.check()
        s = ArraySymbol(type, self.value, expr)
        SymbolSystem.add(s)
        return s

class StringToken(Token):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

    def check(self):
        # TODO: 检测最外层
        s = SymbolSystem.find_symbol(SymbolKind.STRING, self.value)
        if s is None:
            type = TypeSystem.type(TokenKind.STRING)
            s = StringSymbol(self.value, type)
            SymbolSystem.add(s)
        return s
