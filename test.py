from enum import IntEnum, auto
class TypeKind(IntEnum):
    VOID = auto()
    SHORT = auto()
    STRING = auto()
    POINTER = auto()
    INT = auto()
    FLOAT = auto()
    DOUBLE = auto()

class RegKind(IntEnum):
    AX = auto()
    DX = auto()
    CX = auto()
    BX = auto()
    ST = auto()

t = RegKind.AX
r = isinstance(t, TypeKind)
print(r)