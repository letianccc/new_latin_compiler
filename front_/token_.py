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

    def check(self, kind, type):
        k = SymbolKind.INTCONST
        type = TypeSystem.type(TokenKind.INT)
        s = SymbolSystem.find_symbol(self)
        if s is None:
            s = IntSymbol(self.value)
            SymbolSystem.add(s)
        return s

class DoubleConstant(ConstantToken):
    def __init__(self, value):
        self.value = value
        self.kind = TokenKind.DOUBLECONST

    def check(self, kind, type):
        # TODO: 这部分逻辑可以抽象
        # add_symbol(kind, type, value)
        # type = TypeSystem.type(self.type)
        k = SymbolKind.DOUBLECONST
        type = TypeSystem.type(TokenKind.DOUBLE)
        s = SymbolSystem.find_symbol(self)
        if s is None:
            s = ConstantSymbol(k, type, self.value)
            SymbolSystem.add(s)
        return s

class IdentifierToken(Token):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

    def check(self, kind=None, type=None):
        if kind is NodeKind.DECLARATOR_INITIALIZER or kind is NodeKind.FORMAL_PARAMETER:
            s = SymbolSystem.find_symbol(self, None, LevelKind.CURRENT)
            if s is not None:
                raise Exception("重复定义")
            s = IdentifierSymbol(type, self.value)
            SymbolSystem.add(s)
            if kind is NodeKind.DECLARATOR_INITIALIZER:
                ...
            else:
                s.is_formal_param = True

        elif kind is NodeKind.CALL:
            # TODO: 检测最外层作用域标识符是否存在
            # TODO: 检测是否有声明保留函数 printf
            s = SymbolSystem.find_symbol(self)
            if s is None:
                v = self.value
                type = TypeSystem.VOID
                s = FunctionSymbol(type, v, True)
                SymbolSystem.add(s)
            return s

        s = SymbolSystem.find_symbol(self)
        if s is None:
            raise Exception("缺少声明")
        return s



class StringToken(Token):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

    def check(self, kind, type):
        # TODO: 检测最外层
        s = SymbolSystem.find_symbol(self)
        if s is None:
            type = TypeSystem.type(TokenKind.STRING)
            s = StringSymbol(self.value, type)
            SymbolSystem.add(s)
        return s
