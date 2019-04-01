from enum import Enum, auto

class TokenKind(Enum):
    AUTO = auto()
    EXTERN = auto()

t = TokenKind.AUTO
print(type(t) is TokenKind)