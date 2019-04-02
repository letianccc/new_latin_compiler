
from myenum import *

class TypeSystem(object):
    types = None
    @classmethod
    def init(cls):
        cls.types = {
            TokenKind.INT: Type(TypeKind.INT),
            TokenKind.FLOAT: Type(TypeKind.FLOAT),
            TokenKind.DOUBLE: Type(TypeKind.DOUBLE),
            TokenKind.VOID: Type(TypeKind.VOID),
        }

    @classmethod
    def type(cls, token_kind):
        return cls.types[token_kind]


class Type(object):
    """docstring for Type."""

    def __init__(self, kind):
        super(Type, self).__init__()
        self.kind = kind
        self.child = None
