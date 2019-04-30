
from front_.myenum import *
from front_.field import *
from front_.type_system import *
from front_.block import *

class SymbolSystem(object):
    identifiers = None
    __literals = None
    debug_id = []

    @classmethod
    def add(cls, symbol):
        if symbol.match(SymbolKind.INTCONST, SymbolKind.DOUBLECONST, SymbolKind.STRING):
            symbols = cls.__literals
        elif symbol.match(SymbolKind.ID, SymbolKind.FUNCTION):
            symbols = cls.identifiers
            cls.debug_id.append(symbol)
        symbols.add(symbol)

    @classmethod
    def find_add(cls, kind, type, value):
        s = cls.find_symbol(kind, value, type)
        if s is None:
            if kind is SymbolKind.INTCONST:
                s = IntSymbol(value)
            elif kind is SymbolKind.DOUBLECONST:
                s = DoubleSymbol(value)
            else:
                raise Exception
            SymbolSystem.add(s)
        return s

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

        s = IntSymbol('1')
        SymbolSystem.add(s)
        s = IntSymbol('0')
        SymbolSystem.add(s)

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
            if type is None or self.type.match(type):
                return True
        return False

    def match(self, *kinds):
        for k in kinds:
            if self.kind is k:
                return True
        return False

    def gen(self):
        return self

    def not_node(self):
        return self

    def access_name(self):
        return self.__access_name

    def set_access_name(self, access_name):
        self.__access_name = access_name

    def name(self):
        return self.value

# TODO: function 应该继承 id
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
        # TODO: local 和 array 最好分开
        self.locals = []
        b = Block(BlockKind.FUNCTION)
        name = f'_{self.value}'
        b.set_access_name(name)
        self.cur_block = b
        self.blocks = [b]
        self.is_array = False

    @property
    def arrays(self):
        a = [local for local in self.locals if local.is_array is True]
        return a

    def add_param(self, parameter):
        # parameter.index = len(self.params)
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

    def __init__(self, value):
        super(ConstantSymbol, self).__init__()
        self.value = value
        self.__access_name = f'${self.value}'


class IntSymbol(ConstantSymbol):
    """docstring for ConstantSymbol."""

    def __init__(self, value):
        super(IntSymbol, self).__init__(value)
        self.kind = SymbolKind.INTCONST
        self.type = TypeSystem.INT
        self.size = 4

    def translate_type(self, type):
        s = self
        if type.match(TypeKind.DOUBLE):
            s = SymbolSystem.find_symbol(SymbolKind.DOUBLECONST, self.value, TypeKind.DOUBLE)
            if s is None:
                s = DoubleSymbol(self.value)
                SymbolSystem.add(s)
        return s

    def access_name(self):
        return f'${self.value}'

class DoubleSymbol(ConstantSymbol):
    """docstring for ConstantSymbol."""

    def __init__(self, value):
        super(DoubleSymbol, self).__init__(value)
        self.kind = SymbolKind.DOUBLECONST
        self.type = TypeSystem.DOUBLE
        self.size = 8

    def translate_type(self, type):
        s = self
        if type.match(TypeKind.INT, TypeKind.SHORT):
            i = self.integer(self.value)
            s = SymbolSystem.find_symbol(SymbolKind.INTCONST, i, TypeKind.INT)
            if s is None:
                s = IntSymbol(i)
                SymbolSystem.add(s)
        return s

    def integer(self, double_value):
        n = double_value.split('.')
        i = n[0]
        return i

    def access_name(self):
        return self.__access_name

    def set_access_name(self, name):
        self.__access_name = name

class IdentifierSymbol(Symbol):
    """docstring for IdentifierSymbol."""

    def __init__(self, type, value):
        super(IdentifierSymbol, self).__init__()
        self.kind = SymbolKind.ID
        self.type = type
        self.value = value
        self.__index = 0
        self.is_formal_param = False
        self.__access_name = None
        self.is_array = False

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

class ArraySymbol(IdentifierSymbol):
    """docstring for IdentifierSymbol."""

    def __init__(self, type, value, size_expression):
        super(ArraySymbol, self).__init__(type, value)
        self.size_expression = size_expression
        self.is_formal_param = False
        self.__access_name = None
        self.is_array = True
        self.__offset = None

    @property
    def size(self):
        return int(self.size_expression.value)

    @property
    def offset(self):
        return self.__offset

    @offset.setter
    def offset(self, offset):
        self.__offset = offset

    def get_size(self):
        count = self.size_expression.value
        count = int(count)
        s = count * self.type.size
        return s

class TagSymbol(Symbol):
    id = 0
    """docstring for IdentifierSymbol."""

    def __init__(self, type):
        super(TagSymbol, self).__init__()
        self.kind = SymbolKind.TAG
        self.type = type
        self.defind = None
        self.id = TagSymbol.id
        TagSymbol.id += 1

    def sub_type(self):
        # TODO: 暂时允许返回当前类型  int b = &a; int c = *b; 后面这种情况要报错
        if self.type.sub_type is None:
            return self.type
        return self.type.sub_type

    def name(self):
        return f't{self.id}'
