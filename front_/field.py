
from front_.myenum import *


class Field:
    def __init__(self):
        self.symbols = []

    def add(self, symbol):
        self.symbols.append(symbol)

    def find(self, token, type, field):
        for s in field.symbols:
            if s.match(token, type):
                return s
        return None

class GlobalField(Field):
    def find_symbol(self, token, type=None, level_kind=None):
        return self.find(token, type, self)

class IdentifierField(Field):
    def __init__(self):
        self.outside = None
        self.symbols = []

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
