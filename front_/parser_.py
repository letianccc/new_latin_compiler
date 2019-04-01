from lexer_ import Lexer
from AST import *
from myenum import TokenKind

class Parser:
    def __init__(self, tokens):

        self.tokens = tokens
        self.index = 0
        self.symbols = list()
        self.printf_formats = list()
        self.symbol_count = 0
        self.ident_count = 0
        self.has_array = False
        self.AST = self.parse_function()


    def parse_functions(self):
        ...

    def parse_function(self, type=None, name=None):
        self.match(TokenKind.INT)
        type = self.next_token()
        self.match(TokenKind.ID)
        name = self.next_token()
        param = self.parse_parameter()
        stmts = self.block_()
        return FunctionNode(type, name, param, stmts)

    def parse_parameter(self):
        self.expect(TokenKind.LPAREN)
        self.expect(TokenKind.RPAREN)
        return None




    def block_(self):
        if self.match(TokenKind.LBRACE):
            self.expect('{')
            if self.is_type('number'):
                block = self.parse_array_data()
            else:
                block = self.stmts_()
            self.expect('}')
        else:
            block = self.single_stmt()
        return block

    def stmts_(self):
        stmt = self.stmt_()
        if not self.match(TokenKind.RBRACE):
            next_stmt = self.stmts_()
            stmt = Seq(stmt, next_stmt)
        return stmt

    def single_stmt(self):
        return self.stmt_()

    def stmt_(self):
        t = self.cur_token()
        name = t.name
        if self.match(TokenKind.IF):
            return self.if_stmt()
        elif self.match(TokenKind.INT) or self.match(TokenKind.FLOAT):
            return self.decl()
        elif self.match(TokenKind.WHILE):
            return self.while_stmt()
        elif self.is_word('printf'):
            return self.printf_stmt()
        elif self.match(TokenKind.LBRACE):
            return self.block_()
        else:
            return self.assign()

    def parse_array_data(self):
        array = list()
        while True:
            t = self.next_token()
            num = t.name
            array.append(num)
            if self.match(TokenKind.COMMA):
                self.expect(',')
            else:
                # }
                break
        return Array_(array)

    def printf_stmt(self):
        self.expect('printf')
        self.expect('(')
        val = None
        format_ = self.parse_format()
        if self.match(TokenKind.COMMA):
            self.expect(',')
            val = self.factor()
        self.expect(')')
        self.expect(';')
        return Printf(format_, val)

    def parse_format(self):
        # format_ = self.format_word()
        t = self.next_token()
        format_ = t.name
        if format_ not in self.printf_formats:
            self.printf_formats.append(format_)
        return format_

    # def format_word(self):
    #     format_ = ''
    #     while not self.match('\"'):
    #         c = self.next_token().name
    #         format_ += c
    #     return format_

    def while_stmt(self):
        self.expect('while')
        self.expect('(')
        cond = self.bool_()
        self.expect(')')
        suite = self.block_()
        return While(cond, suite)

    def if_stmt(self):
        self.expect('if')
        self.expect('(')
        cond = self.bool_()
        self.expect(')')
        then_stmts = self.block_()
        if self.match(TokenKind.ELSE):
            self.expect('else')
            else_stmts = self.block_()
        else:
            else_stmts = None
        return If(cond, then_stmts, else_stmts)

    def decl(self):
        type_ = self.next_token().name
        if self.is_array():
            self.has_array = True
            decl_ = self.decl_array(type_)
            self.expect(';')
        else:
            decl_ = self.decl_single_variable(type_)

        return decl_

    def is_array(self):
        t = self.tokens[self.index + 1]
        if t.name == '[':
            return True
        else:
            return False

    def decl_array(self, type_):
        var = self.next_token()
        expr = self.parse_array_postfix() # expr是number类型
        array = Array(var, expr)
        array_size = int(expr.name)
        self.add_symbol(array, array_size)
        return Decl(type_, array)

    def parse_array_postfix(self):
        self.expect('[')
        expr = self.expr_()
        self.expect(']')
        return expr

    def is_num(self, array_node):
        n = array_node
        if n.__class__.__name__ == 'Token':
            if n.type_ == 'number':
                return True
        return False

    def decl_single_variable(self, type_):
        var = self.next_token()
        if self.match(TokenKind.LPAREN):
            return self.parse_function(type_, var)

        amount = 1
        self.add_symbol(var, amount)
        self.expect(';')
        return Decl(type_, var)

    def add_symbol(self, symbol, amount):
        self.symbols.append(symbol)
        self.ident_count += amount
        self.symbol_count += amount

    def assign(self):
        variable = self.factor()
        self.expect('=')
        value = self.bool_()
        self.expect(';')
        return Assign(variable, value)

    def bool_(self):
        expr = self.join()
        while self.match(TokenKind.OR):
            self.expect('||')
            # expr = Or(expr, self.join())
            expr = Expr(expr, self.join(), '||')
        return expr

    def join(self):
        expr = self.equal()
        while self.match(TokenKind.AND):
            self.expect('&&')
            # expr = And(expr, self.equal())
            expr = Expr(expr, self.equal(), '&&')
        return expr

    def equal(self):
        expr = self.rel()

        while self.match(TokenKind.EQUAL) or self.match(TokenKind.UNEQUAL):
            operator = self.next_token().name
            # expr = Equal(expr, self.rel(), operator)
            expr = Expr(expr, self.rel(), operator)
        return expr

    def rel(self):
        expr = self.expr_()
        while self.match(TokenKind.LESS) or self.match(TokenKind.LESS_EQ) or self.match(TokenKind.GREAT) or self.match(TokenKind.GREAT_EQ):
            operator = self.next_token().name
            expr = Expr(expr, self.expr_(), operator)
        return expr

    def expr_(self):
        expr = self.term()

        while self.match(TokenKind.ADD) or self.match(TokenKind.subl):
            self.symbol_count += 1
            operator = self.next_token().name
            # expr = Arith(expr, self.term(), operator)
            expr = Expr(expr, self.term(), operator)

        return expr

    def term(self):
        expr = self.unary()

        while self.match(TokenKind.MUL) or self.match(TokenKind.DIV):
            self.symbol_count += 1
            operator = self.next_token().name
            # expr = Arith(expr, self.unary(), operator)
            expr = Expr(expr, self.unary(), operator)

        return expr

    def unary(self):
        if self.match(TokenKind.NOT) or self.match(TokenKind.subl):
            operator = self.next_token().name
            expr = Unary(operator, self.factor())
        else:
            expr = self.factor()
        return expr

    def factor(self):
        if self.match(TokenKind.LPAREN):
            self.expect('(')
            expr = self.bool_()
            self.expect(')')
            return expr
        elif self.match(TokenKind.LBRACE):
            return self.block_()
        elif self.is_array():
            name = self.next_token()
            index = self.parse_array_element()
            return Array(name, index)
        else:
            # 标识符
            return self.next_token()

    def parse_array_element(self):
        array_index = self.parse_array_postfix()
        if not self.is_num(array_index):
            self.symbol_count += 1
        return array_index

    def match(self, token_kind):
        t = self.cur_token()
        is_match = t.kind is token_kind
        return is_match

    def is_word(self, word):
        t = self.cur_token()
        if t.name == word:
            return True
        else:
            return False

    def is_type(self, type_):
        t = self.cur_token()
        if t.type_ == type_:
            return True
        else:
            return False

    def cur_token(self):
        return self.tokens[self.index]

    def next_token(self):
        t = self.tokens[self.index]
        self.increase_index()
        return t

    def last_token(self):
        return self.tokens[self.index-1]

    def increase_index(self):
        self.index += 1
        if self.index < len(self.tokens):
            self.debug_token = self.cur_token()

    def return_token(self):
        self.index += 1

    def expect(self, word):
        if self.index < len(self.tokens):
            t = self.cur_token()
            if type(word) is TokenKind and word is t.kind:
                self.increase_index()
                return
            if t.name == word:
                self.increase_index()
            else:
                print('not match!')
                print('last:  ', self.tokens[self.index-4].name, self.tokens[self.index-3   ].name,
                      self.tokens[self.index-2].name, self.tokens[self.index-1].name)
                print('index: ', self.index, 'len:  ', len(self.tokens))
                print('match:  ', t.name)
                print('expect: ', word)
                raise Exception

        else:
            print('index out of range!')
            print('last:  ', self.tokens[self.index-1].name)
            print('expect: ', word)
            raise Exception
