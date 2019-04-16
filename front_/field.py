
from front_.myenum import *


class Field:
    def __init__(self):
        self.symbols = []
        self.outside = None

    def add(self, symbol):
        self.symbols.append(symbol)

    def find(self, value, type):
        for s in self.symbols:
            if s.equal(type, value):
                return s
        return None

class GlobalField(Field):
    @property
    def double_constants(self):
        const = [s for s in self.symbols if s.match(SymbolKind.DOUBLECONST)]
        return const

    @property
    def strings(self):
        strs = [s for s in self.symbols if s.match(SymbolKind.STRING)]
        return strs


class IdentifierField(Field):
    def __init__(self):
        self.outside = None
        self.symbols = []
