
from myenum import *

class Table:
    def __init__(self):
        self.outside = None
        self.symbols = []

    def add(self, symbol):
        self.symbols.append(symbol)

    def find_symbol(self, token, type=None, level_kind=None):
        # TODO: find 应该增加kind参数
        cur = self
        t = token
        if level_kind is LevelKind.CURRENT:
            s = self.find(t, type, cur)
            if s is not None:
                return s
            return None
        while cur is not None:
            s = self.find(t, type, cur)
            if s is not None:
                return s
            cur = cur.outside
        return None

    def find(self, token, type, field):
        for s in field.symbols:
            if s.match(token, type):
                return s
        return None

class SymbolSystem(object):
    identifiers = None
    @classmethod
    def init(cls):
        cls.identifiers = []
        StringSymbol.init()
        cls.identifiers = Table()

    @classmethod
    def enter(cls):
        inner = Table()
        inner.outside = cls.identifiers
        cls.identifiers = inner

    @classmethod
    def quit(cls):
        cls.identifiers = cls.identifiers.outside

    @classmethod
    def add(cls, symbol):
        cls.identifiers.add(symbol)

    @classmethod
    def find_symbol(cls, token, type=None, level_kind=None):
        return cls.identifiers.find_symbol(token, type, level_kind)

class Symbol(object):
    """docstring for Symbol."""

    def __init__(self):
        super(Symbol, self).__init__()
        self.kind = None
        self.value = None

    def match(self, token, type=None):
        if self.value == token.value:
            if type is None or self.type is type:
                return True
        return False


class FunctionSymbol(Symbol):
    """docstring for FunctionSymbol."""

    def __init__(self):
        super(FunctionSymbol, self).__init__()
        self.kind = SymbolKind.FUNCTION
        self.params = None
        self.type = None
        self.value = None
        self.blocks = None
        self.max_actual_param = 0
        self.strings = []
        self.locals = []

    def init(self, type, name, parameters):
        self.params = parameters
        self.type = type
        self.name = name

class StringSymbol(Symbol):
    index = 0
    """docstring for StringSymbol."""
    @classmethod
    def init(cls):
        cls.index = 0

    def __init__(self, string):
        super(StringSymbol, self).__init__()
        self.kind = SymbolKind.STRING
        self.value = string
        self.tag = None
        self.index = StringSymbol.index
        StringSymbol.index += 1
        self.allocate = False

    def access_name(self):
        return f'$LC{self.index}'

class ConstantSymbol(Symbol):
    """docstring for ConstantSymbol."""

    def __init__(self, type, value):
        super(ConstantSymbol, self).__init__()
        self.kind = SymbolKind.CONST
        self.value = value
        self.type = type


    def access_name(self):
        return f'${self.value}'

class IdentifierSymbol(Symbol):
    """docstring for IdentifierSymbol."""

    def __init__(self):
        super(IdentifierSymbol, self).__init__()
        self.kind = SymbolKind.ID
        self.type = None
        self.value = None
