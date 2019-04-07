

from front_.token_ import *
from front_.myenum import *

#TODO 引号  反斜杠 不应该包括在reserve_symbols中   需要解析为字符串
reserve_symbols = [ '+', '-', '*', '/', '!', '=',
            '<', '<=', '>', '>=', '==', '!=',
            '&&', '||', '&', '|',
            '{', '}', '(', ')', '[', ']',
            ',', '.', ';', '%',
            ]


word_map = {
    'int': TokenKind.INT,
    'float': TokenKind.FLOAT,
    'double': TokenKind.DOUBLE,
    'void': TokenKind.VOID,
    'if': TokenKind.IF,
    'else': TokenKind.ELSE,
    'break': TokenKind.BREAK,
    'return': TokenKind.RETURN,
    'for': TokenKind.FOR,
    'continue': TokenKind.CONTINUE,
    'while': TokenKind.WHILE,
    'do': TokenKind.DO,
    ',': TokenKind.COMMA,
    '?': TokenKind.QUESTION,
    ':': TokenKind.COLON,
    '=': TokenKind.ASSIGN,
    '|=': TokenKind.BITOR_ASSIGN,
    '&=': TokenKind.BITXOR_ASSIGN,
    '^=': TokenKind.BITAND_ASSIGN,
    '<<=': TokenKind.LSHIFT_ASSIGN,
    '>>=': TokenKind.RSHIFT_ASSIGN,
    '+=': TokenKind.ADD_ASSIGN,
    '-=': TokenKind.SUB_ASSIGN,
    '*=': TokenKind.MUL_ASSIGN,
    '/=': TokenKind.DIV_ASSIGN,
    '%=': TokenKind.MOD_ASSIGN,
    '||': TokenKind.OR,
    '&&': TokenKind.AND,
    '|': TokenKind.BITOR,
    '&': TokenKind.BITXOR,
    '^': TokenKind.BITAND,
    '==': TokenKind.EQUAL,
    '!=': TokenKind.UNEQUAL,
    '<': TokenKind.GREAT,
    '<=': TokenKind.LESS,
    '>': TokenKind.GREAT_EQ,
    '>=': TokenKind.LESS_EQ,
    '<<': TokenKind.LSHIFT,
    '>>': TokenKind.RSHIFT,
    '+': TokenKind.ADD,
    '-': TokenKind.SUB,
    '*': TokenKind.MUL,
    '/': TokenKind.DIV,
    '%': TokenKind.MOD,
    '++': TokenKind.INC,
    '--': TokenKind.DEC,
    '!': TokenKind.NOT,
    '~': TokenKind.COMP,
    '.': TokenKind.DOT,
    '->': TokenKind.POINTER,
    '(': TokenKind.LPAREN,
    ')': TokenKind.RPAREN,
    '[': TokenKind.LBRACKET,
    ']': TokenKind.RBRACKET,
    '{': TokenKind.LBRACE,
    '}': TokenKind.RBRACE,
    ';': TokenKind.SEMICOLON,
    '...': TokenKind.ELLIPSIS,
    '#': TokenKind.POUND,

}