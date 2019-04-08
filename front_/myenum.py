from enum import IntEnum, auto

class TokenKind(IntEnum):
    AUTO = auto()
    EXTERN = auto()
    REGISTER = auto()
    STATIC = auto()
    TYPEDEF = auto()
    CONST = auto()
    VOLATILE = auto()
    SIGNED = auto()
    SHORT = auto()
    LONG = auto()
    CHAR = auto()
    INT = auto()
    FLOAT = auto()
    DOUBLE = auto()
    ENUM = auto()
    STRUCT = auto()
    UNION = auto()
    VOID = auto()
    BREAK = auto()
    CASE = auto()
    CONTINUE = auto()
    DEFAULT = auto()
    DO = auto()
    ELSE = auto()
    FOR = auto()
    GOTO = auto()
    IF = auto()
    RETURN = auto()
    SWITCH = auto()
    WHILE = auto()
    SIZEOF = auto()
    ID = auto()
    INTCONST = auto()
    UINTCONST = auto()
    LONGCONST = auto()
    ULONGCONST = auto()
    LLONGCONST = auto()
    ULLONGCONST = auto()
    FLOATCONST = auto()
    DOUBLECONST = auto()
    STRING = auto()
    WIDESTRING = auto()

    COMMA = auto()
    QUESTION = auto()
    COLON = auto()
    ASSIGN = auto()
    BITOR_ASSIGN = auto()
    BITXOR_ASSIGN = auto()
    BITAND_ASSIGN = auto()
    LSHIFT_ASSIGN = auto()
    RSHIFT_ASSIGN = auto()
    ADD_ASSIGN = auto()
    SUB_ASSIGN = auto()
    MUL_ASSIGN = auto()
    DIV_ASSIGN = auto()
    MOD_ASSIGN = auto()
    OR = auto()
    AND = auto()
    BITOR = auto()
    BITXOR = auto()
    BITAND = auto()
    EQUAL = auto()
    UNEQUAL = auto()
    GREAT = auto()
    LESS = auto()
    GREAT_EQ = auto()
    LESS_EQ = auto()
    LSHIFT = auto()
    RSHIFT = auto()
    ADD = auto()
    SUB = auto()
    MUL = auto()
    DIV = auto()
    MOD = auto()
    INC = auto()
    DEC = auto()
    NOT = auto()
    COMP = auto()
    DOT = auto()
    POINTER = auto()
    LPAREN = auto()
    RPAREN = auto()
    LBRACKET = auto()
    RBRACKET = auto()
    LBRACE = auto()
    RBRACE = auto()
    SEMICOLON = auto()
    ELLIPSIS = auto()
    POUND = auto()
    NEWLINE = auto()
    EOF = auto()



class TypeKind(IntEnum):
    INT = auto()
    FLOAT = auto()
    DOUBLE = auto()
    VOID = auto()
    STRING = auto()

class NodeKind(IntEnum):
    CALL = auto()
    FUNCTION = auto()
    SEQ = auto()
    STMT = auto()
    PRINTF = auto()
    ACTUAL_PARAMETER = auto()
    FORMAL_PARAMETER = auto()
    PARAMETER = auto()
    DECLARATOR = auto()
    DECLARATION = auto()
    ADD = auto()
    SUB = auto()
    MUL = auto()
    DIV = auto()

class BlockKind(IntEnum):
    FUNCTION = auto()
    STRING = auto()
    GENERAL = auto()

class SymbolKind(IntEnum):
    FUNCTION = auto()
    STRING = auto()
    ID = auto()
    CONST = auto()
    FLOATCONST = auto()
    INTCONST = auto()
    DOUBLECONST = auto()
    TAG = auto()

class IRKind(IntEnum):
    CALL = auto()
    ASSIGN = auto()
    ADD = auto()
    SUB = auto()
    MUL = auto()
    DIV = auto()

class LevelKind(IntEnum):
    CURRENT = auto()
    OUTEST = auto()
    ALL = auto()
