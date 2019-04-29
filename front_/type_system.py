
from front_.myenum import *
from front_.util import *

class Type(object):
    """docstring for Type."""

    def __init__(self, kind, size, value, sub_type=None):
        super(Type, self).__init__()
        self.kind = kind
        self.size = size
        self.value = value
        self.sub_type = sub_type

    def match(self, *kinds):
        for k in kinds:
            if k is self.kind:
                return True
        return False

    def name(self):
        return f'{self.value}'

class TypeSystem(object):
    VOID = Type(TypeKind.VOID, 0, 'void')
    SHORT = Type(TypeKind.SHORT, 2, 'short')
    STRING = Type(TypeKind.STRING, 4, None)
    INT = Type(TypeKind.INT, 4, 'int')
    FLOAT = Type(TypeKind.FLOAT, 4, 'float')
    DOUBLE = Type(TypeKind.DOUBLE, 8, 'double')
    POINTER = Type(TypeKind.POINTER, 4, None)

    types = None

    @classmethod
    def init(cls):
        cls.types = [cls.VOID, cls.SHORT, cls.STRING, cls.INT, cls.FLOAT, cls.DOUBLE,
        cls.POINTER]
        cls.type_map = {
            TokenKind.INT: cls.INT,
            TokenKind.FLOAT: cls.FLOAT,
            TokenKind.DOUBLE: cls.DOUBLE,
            TokenKind.VOID: cls.VOID,
            TokenKind.STRING: cls.STRING,
            TokenKind.SHORT: cls.SHORT,

            TypeKind.INT: cls.INT,
            TypeKind.FLOAT: cls.FLOAT,
            TypeKind.DOUBLE: cls.DOUBLE,
            TypeKind.VOID: cls.VOID,
            TypeKind.STRING: cls.STRING,
            TypeKind.SHORT: cls.SHORT,

        }
        cls.numeric_types = [cls.SHORT, cls.INT, cls.FLOAT, cls.DOUBLE]

    @classmethod
    def type(cls, token_kind):
        return cls.type_map[token_kind]

    @classmethod
    def max_type(cls, *types):
        k = max(t.kind for t in types)
        # if k > TypeKind.DOUBLE:
        #     raise Exception
        t = cls.type(k)
        return t

    @classmethod
    def new(cls, kind, size, sub_type):
        t = Type(kind, size, None, sub_type)
        return t

    @classmethod
    def is_type_prefix(cls, kind):
        t = cls.type_map.get(kind)
        return t is not None

    @classmethod
    def pointer(self, type):
        t = TypeSystem.new(TypeKind.POINTER, TypeSystem.POINTER.size, type)
        return t

    @classmethod
    def is_integer(cls, type):
        if type.match(TypeKind.INT, TypeKind.SHORT):
            return True
        return False
