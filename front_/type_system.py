
from front_.myenum import *

class Type(object):
    """docstring for Type."""

    def __init__(self, kind, size):
        super(Type, self).__init__()
        self.kind = kind
        self.child = None
        self.size = size

    def match(self, *types):
        for t in types:
            if self.kind is t.kind:
                return True
        return False

class TypeSystem(object):
    SHORT = Type(TypeKind.SHORT, 2)
    INT = Type(TypeKind.INT, 4)
    FLOAT = Type(TypeKind.FLOAT, 4)
    DOUBLE = Type(TypeKind.DOUBLE, 8)
    VOID = Type(TypeKind.VOID, 0)
    STRING = Type(TypeKind.STRING, 4)

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
            TokenKind.SHORT: cls.SHORT,

        }

    @classmethod
    def type(cls, token_kind):
        return cls.types[token_kind]

    @classmethod
    def max_type(cls, *types):
        k = max(t.kind for t in types)
        t = cls.type(k)
        return t
