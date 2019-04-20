from front_.token_ import *
from front_.myenum import *
from front_.data import *




class Lexer:
    def __init__(self, code):
        self.tokens = list()
        self.index = 0
        self.code = code + ' '
        self.length = len(code)

    def scan(self):
        while not self.is_eof():
            t = self.scan_token()
            if t is not None:
                self.tokens.append(t)
        t = Token(TokenKind.EOF)
        self.tokens.append(t)

    def scan_token(self):
        self.skip_space()
        if self.is_eof():
            return None

        c = self.cur_char()
        if c.isalpha():
            t = self.scan_identifier()
        elif c.isdigit():
            t = self.scan_number()
        elif c == '"':
            t = self.scan_string()
        elif c == '/':
            self.skip_comment()
            t = None
        elif c in reserve_symbols:
            t = self.scan_symbol()
        else:
            raise Exception(c)
        return t

    def skip_comment(self):
        self.expect('/')
        self.expect('/')
        while self.cur_char() != '\n':
            self.next_char()
        self.next_char()

    def scan_string(self):
        word = self.cur_char()
        c = self.next_char()
        while c != '"':
            word += c
            c = self.next_char()
        word += c
        self.next_char()
        kind = TokenKind.STRING
        t = StringToken(kind, word)
        return t

    def scan_symbol(self):
        word = self.symbol_word()
        kind = word_map[word]
        t = Token(kind, word)
        return t

    def symbol_word(self):
        c = self.cur_char()
        word = c
        if c == '%' or c == '<' or c == '>' or c == '!':
            next = self.next_char()
            if next == '=':
                word += next
                self.next_char()
        elif c == '&' or c == '|' or c == '=' or c == '+' or c == '-':
            next = self.next_char()
            if c == next:
                word += next
                self.next_char()
        # elif c == '\\':
        #     next = self.next_char()
        #     if next == 'n':
        #         word = '\\n'
        #         self.next_char()
        #     elif next == '\\':
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
            c = self.next_char()
        kind = word_map.get(word)
        if kind is None:
            kind = TokenKind.ID
        t = IdentifierToken(kind, word)
        return t

    def scan_number(self):
        digits = self.scan_digits()
        c = self.cur_char()
        is_float = False
        if c == '.':
            is_float = True
            digits += c
            self.next_char()
            digits += self.scan_digits()
        Const = DoubleConstant if is_float else IntConstant
        t = Const(digits)
        return t

    def scan_digits(self):
        digits = ''
        c = self.cur_char()
        while c.isdigit():
            digits += c
            c = self.next_char()
        return digits

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

    def skip_space(self):
        while not self.is_eof():
            c = self.cur_char()
            if not c.isspace():
                return
            self.next_char()

    def is_eof(self):
        return self.index >= self.length

    def cur_char(self):
        return self.code[self.index]

    def next_char(self):
        self.index += 1
        c = self.cur_char()
        return c

    def expect(self, char):
        if self.index < len(self.code):
            c = self.cur_char()
            if c != char:
                log('not match!')
                log('last:  ', self.code[self.index-2], self.code[self.index-1])
                log('index: ', self.index, 'len:  ', len(self.code))
                log('match:  ', c)
                log('expect: ', char)
                raise Exception
            self.next_char()
        else:
            log('index out of range!')
            log('last:  ', self.code[self.index-1])
            log('expect: ', char)
            raise Exception
