
from front_.myenum import *
from front_.field import *
from front_.ir import *


class SymbolSystem(object):
    identifiers = None
    constants = None
    strings = None

    @classmethod
    def init(cls):
        StringSymbol.init()
        cls.identifiers = IdentifierField()
        cls.constants = GlobalField()
        cls.strings = GlobalField()


    @classmethod
    def enter(cls):
        inner = IdentifierField()
        inner.outside = cls.identifiers
        cls.identifiers = inner

    @classmethod
    def quit(cls):
        cls.identifiers = cls.identifiers.outside

    @classmethod
    def add(cls, symbol):
        k = symbol.kind
        if k is SymbolKind.CONST:
            cls.constants.add(symbol)
        elif k is SymbolKind.STRING:
            cls.strings.add(symbol)
        elif k is SymbolKind.ID or k is SymbolKind.FUNCTION:
            cls.identifiers.add(symbol)

    @classmethod
    def find_symbol(cls, token, type=None, level_kind=None):
        k = token.kind
        if k is TokenKind.INTCONST:
            s = cls.constants.find_symbol(token, type, level_kind)
        elif k is TokenKind.STRING:
            s = cls.strings.find_symbol(token, type, level_kind)
        elif k is TokenKind.ID:
            s = cls.identifiers.find_symbol(token, type, level_kind)
        return s

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

    def __init__(self, type, name):
        super(FunctionSymbol, self).__init__()
        self.kind = SymbolKind.FUNCTION
        self.type = type
        self.params = []
        self.value = name
        self.max_actual_param = 0
        self.strings = []
        self.locals = []
        b = Block()
        b.kind = BlockKind.FUNCTION
        self.cur_block = b
        self.blocks = [b]

    def add_param(self, parameter):
        parameter.index = len(self.params)
        self.params.append(parameter)

    def allocate_block_id(self):
        index = 0
        for b in self.blocks:
            if b.kind is BlockKind.GENERAL:
                b.index = index
                index += 1

    def gen_ir(self, ir):
        self.cur_block.add_ir(ir)

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

    def __init__(self, type, value):
        super(IdentifierSymbol, self).__init__()
        self.kind = SymbolKind.ID
        self.type = type
        self.value = value
        self.index = 0
        self.offset = None
        self.is_formal_param = False


    def access_name(self):
        reg = '%ebp' if self.is_formal_param else '%esp'
        return f'{self.offset}({reg})'
