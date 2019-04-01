from token_ import Token
from myenum import TokenKind

#TODO 引号  反斜杠 不应该包括在symbols中   需要解析为字符串
symbols = [ '+', '-', '*', '/', '!', '=',
            '<', '<=', '>', '>=', '==', '!=',
            '&&', '||', '&', '|',
            '{', '}', '(', ')', '[', ']',
            ',', '.', '\'', '\"', ';', '%', '\\'
            ]
reserved_word = ['int', 'float', 'if', 'else', 'break', 'return',
'for', 'continue', 'while', 'do', 'printf', ]

reserved_word_map = {
    'int': TokenKind.INT,
    'float': TokenKind.FLOAT,
    'if': TokenKind.IF,
    'else': TokenKind.ELSE,
    'break': TokenKind.BREAK,
    'return': TokenKind.RETURN,
    'for': TokenKind.FOR,
    'continue': TokenKind.CONTINUE,
    'while': TokenKind.WHILE,
    'do': TokenKind.DO,
}

symbol_map = {
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
    '-=': TokenKind.subl_ASSIGN,
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
    '-': TokenKind.subl,
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

class Lexer:
    def __init__(self, code):
        self.tokens = list()
        self.index = 0
        self.code = code + ' '
        self.len_ = len(code)
        self.setup()

    def setup(self):
        self.skip_space()

    def scan(self):
        while self.not_eof():
            t = self.scan_tok()
            self.tokens.append(t)
        t = Token()
        t.kind = TokenKind.EOF
        self.tokens.append(t)


    def skip_space(self):
        while self.not_eof():
            c = self.cur_char()
            if c.isspace():
                self.next_index()
            else:
                return

    def not_eof(self):
        return self.index < self.len_

    def cur_char(self):
        return self.code[self.index]

    def next_char(self):
        self.next_index()
        c = self.cur_char()

        return c

    def next_index(self):
        self.index += 1

    def expect(self, char):
        if self.index < len(self.code):
            c = self.cur_char()
            if c != char:
                print('not match!')
                print('last:  ', self.code[self.index-2], self.code[self.index-1])
                print('index: ', self.index, 'len:  ', len(self.code))
                print('match:  ', c)
                print('expect: ', char)
                raise Exception
            self.next_index()
        else:
            print('index out of range!')
            print('last:  ', self.code[self.index-1])
            print('expect: ', char)
            raise Exception

    def scan_tok(self):
        word = ''
        c = self.cur_char()
        if c.isalpha():
            t = self.scan_identifier()
        elif c.isdigit():
            t = self.scan_number()
        elif c == '"':
            t = self.scan_string()
        elif c in symbols:
            t = self.scan_symbol()
        else:
            raise Exception(c)

        self.skip_space()
        return t

    def scan_string(self):
        word = ''
        self.expect('\"')
        c = self.cur_char()
        while c != '"':
            word += c
            c = self.next_char()
        self.expect('\"')
        kind = TokenKind.STRING
        type_ = 'string'
        t = Token(word, type_)
        t.kind = kind
        return t

    def scan_symbol(self):
        type_ = 'symbol'
        word = self.symbol_word()
        kind = symbol_map.get(word)
        if kind is None:
            raise Exception(word)
        t = Token(word, type_)
        t.kind = kind
        return t

    def symbol_word(self):
        c = self.cur_char()
        word = c
        if c == '%' or c == '<' or c == '>' or c == '!':
            next_c = self.next_char()
            if next_c == '=':
                word += next_c
                self.next_char()
        elif c == '&' or c == '|' or c == '=':
            next_c = self.next_char()
            if c == next_c:
                word += next_c
                self.next_char()
        # elif c == '\\':
        #     next_c = self.next_char()
        #     if next_c == 'n':
        #         word = '\\n'
        #         self.next_char()
        #     elif next_c == '\\':
        #         word = '\\\\'
        #         self.next_char()
        else:
            self.next_char()
        return word

    def scan_identifier(self):
        word = ''
        c = self.cur_char()


        while c.isalnum() or c == '_':
            word += c
            self.next_char()
            c = self.cur_char()
        kind = reserved_word_map.get(word)
        if kind is None:
            kind = TokenKind.ID
        if word in reserved_word:
            type_ = 'reserved'
        else:
            type_ = 'identifier'
        t = Token(word, type_)
        t.kind = kind
        return t


    # def is_array(self):
    #     c = self.cur_char()
    #     return c == '['
    #
    # def array_index(self):
    #     self.expect('[')
    #     c = self.cur_char()
    #     if c.isdigit():
    #         index = self.num_word()
    #     else:
    #         index = self.ident_word()
    #     self.expect(']')
    #     return index


    def scan_number(self):
        kind = TokenKind.INTCONST
        digits = self.scan_digits()
        c = self.cur_char()
        if c == '.':
            kind = TokenKind.FLOATCONST
            digits += c
            self.next_char()
            digits += self.scan_digits()

        type_ = 'number'
        t = Token(digits, type_)
        t.kind = kind
        return t

    def scan_digits(self):
        digits = ''
        c = self.cur_char()
        while c.isdigit():
            digits += c
            c = self.next_char()
        return digits
