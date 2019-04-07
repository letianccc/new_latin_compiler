
from front_.myenum import *

class Type(object):
    """docstring for Type."""

    def __init__(self, kind, size):
        super(Type, self).__init__()
        self.kind = kind
        self.child = None
        self.size = size

    def match(self, *kinds):
        for k in kinds:
            if self.kind is k:
                return True
        return False    

class TypeSystem(object):
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

        }

    @classmethod
    def type(cls, token_kind):
        return cls.types[token_kind]
