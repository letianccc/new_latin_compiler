
from front_.myenum import *
from front_.util import *

class Type(object):
    """docstring for Type."""

    def __init__(self, kind, size, sub_type=None):
        super(Type, self).__init__()
        self.kind = kind
        self.size = size
        self.sub_type = sub_type

    def match(self, *types):
        for t in types:
            if self.kind is t.kind:
                return True
        return False

class TypeSystem(object):
    VOID = Type(TypeKind.VOID, 0)
    SHORT = Type(TypeKind.SHORT, 2)
    STRING = Type(TypeKind.STRING, 4)
    INT = Type(TypeKind.INT, 4)
    FLOAT = Type(TypeKind.FLOAT, 4)
    DOUBLE = Type(TypeKind.DOUBLE, 8)
    POINTER = Type(TypeKind.POINTER, 4)

    types = None
    @classmethod
    def init(cls):
        cls.types = {
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

    @classmethod
    def type(cls, token_kind):
        return cls.types[token_kind]

    @classmethod
    def max_type(cls, *types):
        k = max(t.kind for t in types)
        # if k > TypeKind.DOUBLE:
        #     raise Exception
        t = cls.type(k)
        return t

    @classmethod
    def new(cls, kind, size, sub_type):
        t = Type(kind, size, sub_type)
        return t
