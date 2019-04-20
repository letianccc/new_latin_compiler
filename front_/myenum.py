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
    DECLARATOR = auto()
    FUNCTION = auto()


    ARRAY_DECLARATOR = auto()


class TypeKind(IntEnum):
    VOID = auto()
    SHORT = auto()
    STRING = auto()
    POINTER = auto()
    INT = auto()
    FLOAT = auto()
    DOUBLE = auto()

class NodeKind(IntEnum):
    IF = auto()
    WHILE = auto()
    FOR = auto()

    ARITH = auto()
    BOOLEAN = auto()

    CALL = auto()
    FUNCTION = auto()
    ACTUAL_PARAMETER = auto()
    FORMAL_PARAMETER = auto()
    PARAMETER = auto()
    DECLARATOR = auto()
    DECLARATION = auto()
    DECLARATOR_INITIALIZER = auto()

    ADDRESS_OF = auto()
    INDIRECTION = auto()
    POINTER_DECLARATOR = auto()
    ASSIGN = auto()
    RETURN = auto()
    TYPE = auto()
    CAST = auto()

    BITOR = auto()
    BITXOR = auto()
    BITAND = auto()

    ARRAY = auto()


class OperatorKind(IntEnum):
    CALL = auto()
    ADD = auto()
    SUB = auto()
    MUL = auto()
    DIV = auto()
    ADDRESS_OF = auto()
    INDIRECTION = auto()
    RETURN = auto()
    ASSIGN = auto()
    INDIRECTION_ASSIGN = auto()
    CAST = auto()
    CONDITIONAL_JUMP = auto()
    JUMP = auto()
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

    ARRAY_INIT = auto()

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
    MEMORY = auto()
    REG = auto()

class LevelKind(IntEnum):
    CURRENT = auto()
    OUTEST = auto()
    ALL = auto()

class RegKind(IntEnum):
    AX = auto()
    DX = auto()
    CX = auto()
    BX = auto()
    ST = auto()
