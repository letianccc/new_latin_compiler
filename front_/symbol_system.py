
from front_.myenum import *
from front_.field import *
from front_.ir import *
from front_.type_system import *

class SymbolSystem(object):
    identifiers = None
    __literals = None

    @classmethod
    def add(cls, symbol):
        if symbol.match(SymbolKind.INTCONST, SymbolKind.DOUBLECONST, SymbolKind.STRING):
            symbols = cls.__literals
        elif symbol.match(SymbolKind.ID, SymbolKind.FUNCTION):
            symbols = cls.identifiers
        symbols.add(symbol)

    @classmethod
    def find_symbol(cls, kind, value, type=None, level_kind=None):
        if kind is SymbolKind.INTCONST or kind is SymbolKind.DOUBLECONST or kind is SymbolKind.STRING:
            field = cls.__literals
        elif kind is SymbolKind.ID or kind is SymbolKind.FUNCTION:
            field = cls.identifiers
        s = cls.find_from_fields(value, type, level_kind, field)
        return s

    @classmethod
    def find_from_fields(cls, value, type, level_kind, field):
        s = field.find(value, type)
        if s is not None or level_kind is LevelKind.CURRENT:
            return s
        cur = field.outside
        while cur is not None:
            s = cur.find(value, type)
            if s is not None:
                return s
            cur = cur.outside
        return None

    @classmethod
    def literals(cls, kind):
        if kind is SymbolKind.DOUBLECONST:
            ls = cls.__literals.double_constants
        elif kind is SymbolKind.STRING:
            ls = cls.__literals.strings
        return ls

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
        cls.__literals = GlobalField()

    @classmethod
    def is_numeric(self, symbol):
        k = symbol.kind
        r = k is SymbolKind.DOUBLECONST or k is SymbolKind.INTCONST
        return r

class Symbol(object):
    """docstring for Symbol."""

    def __init__(self):
        super(Symbol, self).__init__()
        self.kind = None
        self.value = None

    def equal(self, type, value):
        if self.value == value:
            if type is None or self.type is type:
                return True
        return False

    def match(self, *kinds):
        for k in kinds:
            if self.kind is k:
                return True
        return False

    def gen(self):
        return self

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
        self.call_nodes = None
        # reverse_space 包括局部变量与调用参数所需要的全部空间
        self.reverse_space = 0
        self.tags = []
        self.strings = []
        self.locals = []
        b = Block(BlockKind.FUNCTION)
        self.cur_block = b
        self.blocks = [b]

    def add_param(self, parameter):
        parameter.index = len(self.params)
        self.params.append(parameter)

    def gen_ir(self, ir):
        self.cur_block.add_ir(ir)

    def new_tag(self, type):
        t = TagSymbol(type)
        self.tags.append(t)
        return t

    def change_block(self, block):
        self.cur_block = block

    def add_block(self, block):
        self.blocks.append(block)

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

    def translate_type(self, type):
        s = self
        if type.match(TypeSystem.DOUBLE):
            s = SymbolSystem.find_symbol(SymbolKind.DOUBLECONST, self.value, TypeSystem.DOUBLE)
            if s is None:
                s = ConstantSymbol(SymbolKind.DOUBLECONST, TypeSystem.DOUBLE, self.value)
                SymbolSystem.add(s)
        return s



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

    def translate_type(self, type):
        s = self
        if type.match(TypeSystem.INT, TypeSystem.SHORT):
            i = self.integer(self.value)
            s = SymbolSystem.find_symbol(SymbolKind.INTCONST, i, TypeSystem.INT)
            if s is None:
                s = IntSymbol(i)
                SymbolSystem.add(s)
        return s

    def integer(self, double_value):
        n = double_value.split('.')
        i = n[0]
        return i

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

    def sub_type(self):
        # TODO: sub_type  考虑放到PointerSymbol里面
        # TODO: 暂时允许返回当前类型  int b = &a; int c = *b; 后面这种情况要报错
        if self.type.sub_type is None:
            return self.type
        return self.type.sub_type

    def access_name(self):
        return self.__access_name

    def set_access_name(self, access_name):
        self.__access_name = access_name

class TagSymbol(Symbol):
    """docstring for IdentifierSymbol."""

    def __init__(self, type):
        super(TagSymbol, self).__init__()
        self.kind = SymbolKind.TAG
        self.type = type
        self.offset = None
        self.defind = None

    def sub_type(self):
        # TODO: 暂时允许返回当前类型  int b = &a; int c = *b; 后面这种情况要报错
        if self.type.sub_type is None:
            return self.type
        return self.type.sub_type

    def access_name(self):
        return f'{self.offset}(%esp)'
