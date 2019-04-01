from enum import Enum, auto

class TokenKind(Enum):
    AUTO = auto()
    EXTERN = auto()

print(TokenKind.AUTO is TokenKind.AUTO)