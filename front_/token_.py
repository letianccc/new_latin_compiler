from front_.symbol_system import *
from front_.myenum import *
from front_.type_system import TypeSystem


class Token(object):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind


class ConstantToken(object):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

    def check(self, function):
        assert self.kind is TokenKind.INTCONST or self.kind is TokenKind.FLOATCONST
        if self.kind is TokenKind.INTCONST:
            k = SymbolKind.INTCONST
        else:
            k = SymbolKind.FLOATCONST
        s = SymbolSystem.find_symbol(self)
        if s is None:
            type = TypeSystem.type(TokenKind.INT)
            s = ConstantSymbol(SymbolKind.INTCONST, type, self.value)
            SymbolSystem.add(s)
        return s


class IdentifierToken(object):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

    def check(self, function, kind=None, type=None):
        if kind is NodeKind.FUNCTION:
            s = SymbolSystem.find_symbol(self)
            if s is not None:
                raise Exception("重复定义")
            s = FunctionSymbol(type, self.value)
            SymbolSystem.add(s)
            function.symbol = s
            return s
        if kind is NodeKind.DECLARATOR or kind is NodeKind.FORMAL_PARAMETER:
            s = SymbolSystem.find_symbol(self, None, LevelKind.CURRENT)
            if s is not None:
                raise Exception("重复定义")
            s = IdentifierSymbol(type, self.value)
            SymbolSystem.add(s)
            if kind is NodeKind.DECLARATOR:
                function.locals.append(s)
            else:
                s.is_formal_param = True

        if kind is NodeKind.CALL:
            # TODO: 检测最外层作用域标识符是否存在
            # TODO: 检测是否有声明保留函数 printf
            s = SymbolSystem.find_symbol(self)
            if s is None:
                v = self.value
                s = FunctionSymbol(None, v)
                SymbolSystem.add(s)
            return s

        s = SymbolSystem.find_symbol(self)
        if s is None:
            raise Exception("缺少声明")
        return s



class StringToken(object):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

    def check(self, function):
        # TODO: 检测最外层
        s = SymbolSystem.find_symbol(self)
        if s is None:
            s = StringSymbol(self.value)
            SymbolSystem.add(s)
            strings = function.strings
            strings.append(s)
        return s
