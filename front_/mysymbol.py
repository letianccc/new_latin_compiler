
from myenum import *

class SymbolSystem(object):
    symbols = []

    @classmethod
    def add(cls, symbol):
        return cls.symbols.append(symbol)

    @classmethod
    def find_symbol(cls, token):
        for s in cls.symbols:
            if s.kind is SymbolKind.STRING:
                if s.value == token.name:
                    return s
            elif s.name == token.name:
                return s
        return None

class Symbol(object):
    """docstring for Symbol."""

    def __init__(self):
        super(Symbol, self).__init__()
        self.kind = None
        self.value = None
        self.name = None

class FunctionSymbol(Symbol):
    """docstring for FunctionSymbol."""

    def __init__(self):
        super(FunctionSymbol, self).__init__()
        self.kind = SymbolKind.FUNCTION
        self.param = None
        self.type = None
        self.name = None
        self.blocks = None
        self.max_actual_param = 0
        self.strings = []
        self.locals = []

class StringSymbol(object):
    index = 0
    """docstring for StringSymbol."""

    def __init__(self, string):
        super(StringSymbol, self).__init__()
        self.kind = SymbolKind.STRING
        self.value = f'\"{string}\"'
        self.tag = None
        self.index = StringSymbol.index
        StringSymbol.index += 1
        self.allocate = False

    def access_name(self):
        return f'$LC{self.index}'

class ConstantSymbol(object):
    """docstring for ConstantSymbol."""

    def __init__(self, type, value):
        super(ConstantSymbol, self).__init__()
        self.kind = SymbolKind.CONST
        self.value = value
        self.type = type


    def access_name(self):
        return f'${self.value}'
