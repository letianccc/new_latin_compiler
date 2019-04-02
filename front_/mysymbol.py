
from myenum import *

class SymbolSystem(object):
    symbols = []

    @classmethod
    def add(cls, symbol):
        return cls.symbols.append(symbol)

    @classmethod
    def find_symbol(cls, token):
        for s in cls.symbols:
            if s.name == token.name:
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
