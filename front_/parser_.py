from front_.lexer_ import Lexer
from front_.AST import *
from front_.myenum import *
from front_.type_system import TypeSystem
# from front_.mysymbol import *

class Parser:

    def __init__(self, tokens):
        self.tokens = tokens
        self.index = 0
        self.function = None
        self.AST = self.parse_functions()
        self.function_nodes = self.AST

    def parse_functions(self):
        fs = []
        while not self.match(TokenKind.EOF):
            f = self.parse_function()
            fs.append(f)
        self.expect(TokenKind.EOF)
        return fs

    def parse_function(self, type=None, name=None):
        node = FunctionNode()
        s = FunctionSymbol()
        node.symbol = s
        self.function = node
        # 返回值  函数名
        self.match(TokenKind.INT)
        t = self.next_token()
        type = TypeSystem.type(t.kind)
        self.match(TokenKind.ID)
        func_ident = self.next_token()
        # 参数
        params = self.parse_parameters(NodeKind.FORMAL_PARAMETER)

        s.init(type, func_ident.value, params)
        SymbolSystem.add(s)
        stmts = self.block_()
        node.statements = stmts
        return node

    def parse_parameters(self, parameter_kind):
        self.expect(TokenKind.LPAREN)
        params = []
        if self.match(TokenKind.RPAREN):
            self.next_token()
            return params
        self.parse_param(params, parameter_kind)
        while self.match(TokenKind.COMMA):
            self.next_token()
            self.parse_param(params, parameter_kind)
        self.expect(TokenKind.RPAREN)
        for index, p in enumerate(reversed(params)):
            p.index = index
        return params

    def parse_param(self, parameters, parameter_kind):
        type = None
        if parameter_kind is NodeKind.FORMAL_PARAMETER:
            t = self.next_token()
            type = TypeSystem.type(t.kind)
        param = self.next_token()
        p = ParameterNode(self.function, parameter_kind, type, param)
        parameters.insert(0, p)

    def parse_call(self, variable):
        params = self.parse_parameters(NodeKind.ACTUAL_PARAMETER)
        self.expect(TokenKind.SEMICOLON)
        n = CallNode(self.function, variable, params)
        count = len(params)
        if count > self.function.symbol.max_actual_param:
            self.function.symbol.max_actual_param = count
        return n

    def block_(self):
        if self.match(TokenKind.LBRACE):
            self.expect(TokenKind.LBRACE)
            if self.match(TokenKind.RBRACE):
                self.expect(TokenKind.RBRACE)
                return []
            # 数组初始化
            if self.match(TokenKind.INTCONST) or self.match(TokenKind.FLOATCONST):
                block = self.parse_array_data()
            else:
                block = self.parse_statements()
            self.expect(TokenKind.RBRACE)
        else:
            block = self.single_stmt()
        return block

    def parse_statements(self):
        stmts = []
        while not self.match(TokenKind.RBRACE):
            stmt = self.parse_statement()
            stmts.append(stmt)
        return stmts

    def single_stmt(self):
        return self.parse_statement()

    def parse_statement(self):
        t = self.cur_token()
        if self.match(TokenKind.IF):
            return self.if_stmt()
        elif self.match(TokenKind.INT) or self.match(TokenKind.FLOAT):
            return self.parse_declaration()
        elif self.match(TokenKind.WHILE):
            return self.while_stmt()
        elif self.match(TokenKind.LBRACE):
            return self.block_()
        else:
            return self.parse_expression()

    def parse_expression(self):
        variable = self.factor()
        if self.match(TokenKind.LPAREN):
            return self.parse_call(variable)
        if self.match(TokenKind.ASSIGN):
            self.next_token()
            value = self.bool_()
            self.expect(TokenKind.SEMICOLON)
            return AssignNode(self.function, variable, value)

    def parse_declaration(self):
        type = self.next_token()
        node = DeclarationNode(self.function, type)
        while True:
            d = self.parse_declarator()
            node.add(d)
            if self.match(TokenKind.SEMICOLON):
                break
            self.expect(TokenKind.COMMA)
        self.expect(TokenKind.SEMICOLON)
        return node

    def parse_declarator(self):
        ident = self.parse_identifier()
        init = None
        if self.match(TokenKind.ASSIGN):
            self.next_token()
            init = self.bool_()
        d = DeclaratorNode(self.function, ident, init)
        return d




        # if self.is_array():
        #     self.has_array = True
        #     decl_ = self.decl_array(type)
        #     self.expect(TokenKind.SEMICOLON)
        # else:
        #     decl_ = self.decl_single_variable(type)

        # return decl_

    def decl_single_variable(self, type):
        ident = self.next_token()

        if self.match(TokenKind.LPAREN):
            raise Exception


        # amount = 1
        # self.add_symbol(var, amount)
        self.expect(TokenKind.SEMICOLON)
        return DeclNode(self.function, type, ident)


    def add_symbol(self, symbol, amount):
        self.symbols.append(symbol)
        self.ident_count += amount
        self.symbol_count += amount


    def while_stmt(self):
        self.expect('while')
        self.expect(TokenKind.LPAREN)
        cond = self.bool_()
        self.expect(TokenKind.RPAREN)
        suite = self.block_()
        return While(cond, suite)

    def if_stmt(self):
        self.expect('if')
        self.expect(TokenKind.LPAREN)
        cond = self.bool_()
        self.expect(TokenKind.RPAREN)
        then_stmts = self.block_()
        if self.match(TokenKind.ELSE):
            self.expect('else')
            else_stmts = self.block_()
        else:
            else_stmts = None
        return If(cond, then_stmts, else_stmts)

    def is_array(self):
        t = self.tokens[self.index + 1]
        if t.value == '[':
            return True
        else:
            return False

    def decl_array(self, type_):
        var = self.next_token()
        expr = self.parse_array_postfix() # expr是number类型
        array = Array(var, expr)
        array_size = int(expr.value)
        self.add_symbol(array, array_size)
        return DeclNode(self.function, type_, array)

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

    def assign(self):
        variable = self.factor()
        if self.match(TokenKind.LPAREN):
            return self.parse_call(variable)
        self.expect(TokenKind.ASSIGN)
        value = self.bool_()

        self.expect(TokenKind.SEMICOLON)
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
            operator = self.next_token().value
            # expr = Equal(expr, self.rel(), operator)
            expr = Expr(expr, self.rel(), operator)
        return expr

    def rel(self):
        expr = self.expr_()
        while self.match(TokenKind.LESS) or self.match(TokenKind.LESS_EQ) or self.match(TokenKind.GREAT) or self.match(TokenKind.GREAT_EQ):
            operator = self.next_token().value
            expr = Expr(expr, self.expr_(), operator)
        return expr

    def expr_(self):
        expr = self.term()

        while self.match(TokenKind.ADD) or self.match(TokenKind.SUB):
            self.symbol_count += 1
            operator = self.next_token().value
            # expr = Arith(expr, self.term(), operator)
            expr = Expr(expr, self.term(), operator)

        return expr

    def term(self):
        expr = self.unary()

        while self.match(TokenKind.MUL) or self.match(TokenKind.DIV):
            self.symbol_count += 1
            operator = self.next_token().value
            # expr = Arith(expr, self.unary(), operator)
            expr = Expr(expr, self.unary(), operator)

        return expr

    def unary(self):
        if self.match(TokenKind.NOT) or self.match(TokenKind.SUB):
            operator = self.next_token().value
            expr = Unary(operator, self.factor())
        else:
            expr = self.factor()
        return expr

    def factor(self):
        t = self.cur_token()
        if self.match(TokenKind.LPAREN):
            self.expect(TokenKind.LPAREN)
            expr = self.bool_()
            self.expect(TokenKind.RPAREN)
            return expr
        elif self.match(TokenKind.LBRACE):
            return self.block_()
        elif self.is_array():
            name = self.next_token()
            index = self.parse_array_element()
            return Array(name, index)
        elif self.match(TokenKind.STRING):
            t = self.next_token()
            return t
        elif self.match(TokenKind.INTCONST):
            t = self.next_token()
            return t
        elif self.match(TokenKind.ID):
            # 标识符
            return self.parse_identifier()
        else:
            raise Exception

    def parse_identifier(self):
        t = self.cur_token()
        self.expect(TokenKind.ID)
        return t


    def parse_array_element(self):
        array_index = self.parse_array_postfix()
        if not self.is_num(array_index):
            self.symbol_count += 1
        return array_index

    def parse_array_data(self):
        array = list()
        while True:
            t = self.next_token()
            num = t.value
            array.append(num)
            if self.match(TokenKind.COMMA):
                self.expect(',')
            else:
                # }
                break
        return Array_(array)


    def match(self, token_kind):
        t = self.cur_token()
        is_match = t.kind is token_kind
        return is_match

    def is_word(self, word):
        t = self.cur_token()
        if t.value == word:
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
            if t.value == word:
                self.increase_index()
            else:
                log('not match!')
                log('last:  ', self.tokens[self.index-4].value, self.tokens[self.index-3   ].value,
                      self.tokens[self.index-2].value, self.tokens[self.index-1].value)
                log('index: ', self.index, 'len:  ', len(self.tokens))
                log('match:  ', t.value)
                log('expect: ', word)
                raise Exception

        else:
            log('index out of range!')
            log('last:  ', self.tokens[self.index-1].value)
            log('expect: ', word)
            raise Exception

    def match(self, token_kind):
        t = self.cur_token()
        return t.kind is token_kind
