from front_.mysymbol import *
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
        if self.kind is TokenKind.INTCONST:
            s = SymbolSystem.find_symbol(self)
            if s is None:
                type = TypeSystem.type(TokenKind.INT)
                s = ConstantSymbol(type, self.value)
                SymbolSystem.add(s)
            return s
        else:
            raise Exception()


class IdentifierToken(object):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

    def check(self, function, type=None):
        # 标识符是未声明（等待声明）的变量，则需要type以add symbol，检测是否重复定义
        # 需要type 则type不能是None
        # 如果已经声明，则未找到symbol报错
        # 如果未声明，则生成symbol
        have_declared = type is None
        if have_declared:
            s = SymbolSystem.find_symbol(self)
            if s is None:
                raise Exception("缺少声明")
        else:
            s = SymbolSystem.find_symbol(self, None, LevelKind.CURRENT)
            if s is not None:
                raise Exception("重复定义")
            s = IdentifierSymbol()
            s.value = self.value
            s.type = type
            SymbolSystem.add(s)
            function.locals.append(s)
        return s




class StringToken(object):
    def __init__(self, kind, value=None):
        self.value = value
        self.kind = kind

    def check(self, function):
        s = SymbolSystem.find_symbol(self)
        if s is None:
            s = StringSymbol(self.value)
            SymbolSystem.add(s)
            strings = function.strings
            strings.append(s)
        return s
