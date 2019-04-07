
from front_.myenum import *
from front_.field import *
from front_.ir import *
from front_.type_system import *

class SymbolSystem(object):
    identifiers = None
    constants = None
    strings = None

    @classmethod
    def add(cls, symbol):
        if symbol.match(SymbolKind.INTCONST, SymbolKind.DOUBLECONST):
            symbols = cls.constants
        elif symbol.match(SymbolKind.STRING):
            symbols = cls.strings
        elif symbol.match(SymbolKind.ID, SymbolKind.FUNCTION):
            symbols = cls.identifiers
        symbols.add(symbol)

    @classmethod
    def find_symbol(cls, token, type=None, level_kind=None):
        t = token
        if t.match(TokenKind.INTCONST, TokenKind.DOUBLECONST):
            s = cls.constants.find_symbol(t, type, level_kind)
        elif t.match(TokenKind.STRING):
            s = cls.strings.find_symbol(t, type, level_kind)
        elif t.match(TokenKind.ID):
            s = cls.identifiers.find_symbol(t, type, level_kind)
        return s

    @classmethod
    def double_constants(cls):
        return cls.constants.double_constants()

    @classmethod
    def strings(cls):
        return cls.strings.symbols

    @classmethod
    def enter(cls):
        inner = IdentifierField()
        inner.outside = cls.identifiers
        cls.identifiers = inner

    @classmethod
    def quit(cls):
        cls.identifiers = cls.identifiers.outside

    @classmethod
    def init(cls):
        StringSymbol.init()
        cls.identifiers = IdentifierField()
        cls.constants = GlobalField()
        cls.strings = GlobalField()

class Symbol(object):
    """docstring for Symbol."""

    def __init__(self):
        super(Symbol, self).__init__()
        self.kind = None
        self.value = None

    def equal(self, type, token=None):
        if self.value == token.value:
            if type is None or self.type is type:
                return True
        return False

    def match(self, *kinds):
        for k in kinds:
            if self.kind is k:
                return True
        return False



class FunctionSymbol(Symbol):
    """docstring for FunctionSymbol."""

    def __init__(self, type, name, is_extern=False):
        super(FunctionSymbol, self).__init__()
        self.kind = SymbolKind.FUNCTION
        self.type = type
        self.params = []
        self.value = name
        self.is_extern = is_extern
        # self.max_actual_param = 0
        self.call_space = 0
        # reverse_space 包括局部变量与调用参数所需要的全部空间
        self.reverse_space = 0
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

    def __init__(self, string, type):
        super(StringSymbol, self).__init__()
        self.kind = SymbolKind.STRING
        self.type = type
        self.value = string
        self.tag = None
        self.index = StringSymbol.index
        StringSymbol.index += 1
        self.allocate = False
        self.__access_name = None

    def access_name(self):
        return f'$LC{self.index}'

class ConstantSymbol(Symbol):
    """docstring for ConstantSymbol."""

    def __init__(self, kind, type, value):
        super(ConstantSymbol, self).__init__()
        self.kind = kind
        self.value = value
        self.type = type
        if self.kind is SymbolKind.INTCONST:
            self.size = 4
        elif self.kind is SymbolKind.DOUBLECONST:
            self.size = 8
        self.__access_name = f'${self.value}'
        # self.__access_name = f'${self.value}'

    def access_name(self):
        return self.__access_name

    def set_access_name(self, name):
        self.__access_name = name

class IntSymbol(Symbol):
    """docstring for ConstantSymbol."""

    def __init__(self, value):
        super(IntSymbol, self).__init__()
        self.kind = SymbolKind.INTCONST
        self.type = TypeSystem.INT
        self.size = 4
        self.value = value
        self.__access_name = f'${self.value}'

    def access_name(self):
        return self.__access_name

class DoubleSymbol(Symbol):
    """docstring for ConstantSymbol."""

    def __init__(self, value):
        super(DoubleSymbol, self).__init__()
        self.kind = SymbolKind.DOUBLECONST
        self.type = TypeSystem.DOUBLE
        self.size = 8
        self.value = value
        self.__access_name = f'${self.value}'

    def access_name(self):
        return self.__access_name

    def set_access_name(self, name):
        self.__access_name = name

    def emit(self):
        ...

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
        self.__access_name = None

    def access_name(self):
        reg = '%ebp' if self.is_formal_param else '%esp'
        return f'{self.offset}({reg})'
