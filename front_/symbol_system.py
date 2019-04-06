
from front_.myenum import *
from front_.field import *
from front_.ir import *


class SymbolSystem(object):
    identifiers = None
    constants = None
    strings = None

    @classmethod
    def add(cls, symbol):
        k = symbol.kind
        if k is SymbolKind.INTCONST or k is SymbolKind.DOUBLECONST:
            cls.constants.add(symbol)
        elif k is SymbolKind.STRING:
            cls.strings.add(symbol)
        elif k is SymbolKind.ID or k is SymbolKind.FUNCTION:
            cls.identifiers.add(symbol)

    @classmethod
    def find_symbol(cls, token, type=None, level_kind=None):
        k = token.kind
        if k is TokenKind.INTCONST or k is TokenKind.DOUBLECONST:
            s = cls.constants.find_symbol(token, type, level_kind)
        elif k is TokenKind.STRING:
            s = cls.strings.find_symbol(token, type, level_kind)
        elif k is TokenKind.ID:
            s = cls.identifiers.find_symbol(token, type, level_kind)
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

    def access_name():
        doc = "The access_name property."
        def fget(self):
            return f'$LC{self.index}'
        def fset(self, access_name):
            self.__access_name = access_name
        return locals()
    access_name = property(**access_name())

    # def access_name(self):
    #     return f'$LC{self.index}'

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

    def access_name():
        doc = "The access_name property."
        def fget(self):
            return self.__access_name
        def fset(self, access_name):
            self.__access_name = access_name
        def fdel(self):
            del self.__access_name
        return locals()
    access_name = property(**access_name())




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

    def access_name():
        doc = "The access_name property."
        def fget(self):
            reg = '%ebp' if self.is_formal_param else '%esp'
            return f'{self.offset}({reg})'
        def fset(self, access_name):
            self.__access_name = access_name
        return locals()
    access_name = property(**access_name())

    # def access_name(self):
    #     reg = '%ebp' if self.is_formal_param else '%esp'
    #     return f'{self.offset}({reg})'
