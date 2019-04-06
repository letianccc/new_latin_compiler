
from front_.myenum import *

class TypeSystem(object):
    types = None
    @classmethod
    def init(cls):
        cls.types = {
            TokenKind.INT: Type(TypeKind.INT, 4),
            TokenKind.FLOAT: Type(TypeKind.FLOAT, 4),
            TokenKind.DOUBLE: Type(TypeKind.DOUBLE, 8),
            TokenKind.VOID: Type(TypeKind.VOID, 0),
            TokenKind.STRING: Type(TypeKind.STRING, 4),

        }

    @classmethod
    def type(cls, token_kind):
        return cls.types[token_kind]


class Type(object):
    """docstring for Type."""

    def __init__(self, kind, size):
        super(Type, self).__init__()
        self.kind = kind
        self.child = None
        self.size = size
