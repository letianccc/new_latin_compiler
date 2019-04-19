from front_.lexer_ import Lexer
from front_.node.AST import *
from front_.myenum import *
from front_.type_system import TypeSystem
# from front_.mysymbol import *
from front_.node.expression_node import *
from front_.token_ import *


class Parser:
    def __init__(self, tokens):
        self.tokens = tokens
        self.index = 0
        self.function = None
        self.init_constructor()
        self.AST = self.parse_functions()
        self.function_nodes = self.AST

    def init_constructor(self):
        self.constructors = {
            TokenKind.BITAND: AddressOfNode,
            TokenKind.MUL: IndirectionNode,
        }

    def parse_functions(self):
        fs = []
        while not self.match(TokenKind.EOF):
            f = self.parse_function()
            fs.append(f)
        self.expect(TokenKind.EOF)
        return fs

    def parse_function(self, type=None, name=None):
        node = FunctionNode()
        # s = FunctionSymbol()
        # node.symbol = s
        self.function = node
        # 返回值  函数名
        self.match(TokenKind.INT)
        t = self.next_token()
        type = TypeSystem.type(t.kind)
        self.match(TokenKind.ID)
        func_ident = self.next_token()
        # 参数
        params = self.parse_parameters(True)

        # s.init(type, func_ident.value, params)
        # SymbolSystem.add(s)
        stmts = self.block_()
        node.statements = stmts
        node.type = type
        node.identifier = func_ident
        node.params = params
        return node

    def block_(self):
        if self.match(TokenKind.LBRACE):
            self.expect(TokenKind.LBRACE)
            if self.match(TokenKind.RBRACE):
                self.expect(TokenKind.RBRACE)
                return []
            # 数组初始化
            # if self.match(TokenKind.INTCONST) or self.match(TokenKind.DOUBLECONST):
            #     block = self.parse_array_data()
            # else:
            #     block = self.parse_statements()
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
        # TODO: 有的直接返回 有的匹配分号  最好重构一下
        if self.match(TokenKind.IF):
            stmt = self.parse_if()
            return stmt
        elif self.match(TokenKind.INT, TokenKind.DOUBLE, TokenKind.SHORT):
            stmt = self.parse_declaration()
        elif self.match(TokenKind.WHILE):
            stmt = self.parse_while()
            return stmt
        elif self.match(TokenKind.LBRACE):
            stmt = self.block_()
        elif self.match(TokenKind.RETURN):
            stmt = self.parse_return()
        else:
            stmt = self.parse_expression()
        self.expect(TokenKind.SEMICOLON)
        return stmt

    def parse_expression(self):
        variable = self.parse_bool()
        # TODO: assign 应该像其他表达式一样用一个循环实现
        if self.match(TokenKind.ASSIGN):
            self.next_token()
            value = self.parse_expression()
            variable.left_value = True
            # self.expect(TokenKind.SEMICOLON)
            return AssignNode(self.function, variable, value)
        return variable

    def parse_declaration(self):
        type = self.next_token()
        node = DeclarationNode(self.function, type)
        while True:
            d = self.parse_declarator_initialer()
            node.add(d)
            if not self.match(TokenKind.COMMA):
                break
            self.next_token()
        return node

    def parse_type(self):
        type = self.next_token()
        d = self.parse_declarator(True)
        n = TypeNode(self.function, type, d)
        return n

    def parse_declarator_initialer(self):
        declarator = self.parse_declarator()
        init = None
        if self.match(TokenKind.ASSIGN):
            self.next_token()
            init = self.parse_expression()
        d = DeclaratorInitializerNode(self.function, declarator, init)
        return d

    def parse_declarator(self, parse_type=False):
        if self.match(TokenKind.MUL):
            self.expect(TokenKind.MUL)
            d = self.parse_declarator()
            d = PointerDeclaratorNode(self.function, d)
        elif self.match(TokenKind.ID):
            if parse_type is True:
                raise Exception
            d = self.parse_identifier()
            if self.match(TokenKind.LBRACKET):
                self.next_token()
                expr = self.parse_expression()
                self.expect(TokenKind.RBRACKET)
                d = ArrayDeclaratorToken(d.value, expr)
            else:
                # TODO: kind可能需要改变
                d = DeclaratorToken(d.value)
        elif parse_type is True:
            return None
        return d

    # def parse_point_declarator(self):
    #     self.expect(TokenKind.MUL)
    #     ident = self.parse_declarator()

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

    def parse_while(self):
        self.expect(TokenKind.WHILE)
        self.expect(TokenKind.LPAREN)
        cond = self.parse_bool()
        self.expect(TokenKind.RPAREN)
        suite = self.block_()
        return WhileNode(self.function, cond, suite)

    def parse_if(self):
        self.expect(TokenKind.IF)
        self.expect(TokenKind.LPAREN)
        cond = self.parse_bool()
        self.expect(TokenKind.RPAREN)
        then_stmts = self.block_()
        if self.match(TokenKind.ELSE):
            self.expect(TokenKind.ELSE)
            else_stmts = self.block_()
        else:
            else_stmts = []
        return IfNode(self.function, cond, then_stmts, else_stmts)

    def parse_parameters(self, parse_formal):
        self.expect(TokenKind.LPAREN)
        params = []
        if self.match(TokenKind.RPAREN):
            self.next_token()
            return params
        self.parse_param(params, parse_formal)
        while self.match(TokenKind.COMMA):
            self.next_token()
            self.parse_param(params, parse_formal)
        self.expect(TokenKind.RPAREN)
        for index, p in enumerate(reversed(params)):
            p.index = index
        return params

    def parse_param(self, parameters, parse_formal):
        if parse_formal is False:
            p = self.parse_expression()
        else:
            t = self.next_token()
            type = TypeSystem.type(t.kind)
            param = self.parse_declarator()
            p = ParameterNode(self.function, type, param)
        parameters.append(p)

    def parse_call(self, variable):
        params = self.parse_parameters(False)
        # self.expect(TokenKind.SEMICOLON)
        f = FunctionToken(variable.value)
        n = CallNode(self.function, f, params)
        self.function.call_nodes.append(n)
        return n

    def parse_return(self):
        self.expect(TokenKind.RETURN)
        expr = self.parse_expression()
        expr = ReturnNode(self.function, expr)
        return expr

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

    def parse_bool(self):
        expr = self.join()
        while self.match(TokenKind.OR):
            self.expect(TokenKind.OR)
            k = OperatorKind.OR
            expr = LogicNode(self.function, k, expr, self.join())
        return expr

    def join(self):
        expr = self.equal()
        while self.match(TokenKind.AND):
            self.expect(TokenKind.AND)
            k = OperatorKind.AND
            expr = LogicNode(self.function, k, expr, self.equal())
        return expr

    def equal(self):
        expr = self.rel()
        while self.match(TokenKind.EQUAL) or self.match(TokenKind.UNEQUAL):
            m = {
                TokenKind.EQUAL: OperatorKind.EQUAL,
                TokenKind.UNEQUAL: OperatorKind.UNEQUAL,
            }
            t = self.cur_token()
            k = m[t.kind]
            self.next_token()
            expr = CompareNode(self.function, k, expr, self.rel())
        return expr

    def rel(self):
        expr = self.expr_()
        while self.match(TokenKind.LESS) or self.match(TokenKind.LESS_EQ) or \
                self.match(TokenKind.GREAT) or self.match(TokenKind.GREAT_EQ):
            m = {
                TokenKind.LESS: OperatorKind.LESS,
                TokenKind.LESS_EQ: OperatorKind.LESS_EQ,
                TokenKind.GREAT: OperatorKind.GREAT,
                TokenKind.GREAT_EQ: OperatorKind.GREAT_EQ,
            }
            t = self.cur_token()
            k = m[t.kind]
            self.next_token()
            expr = CompareNode(self.function, k, expr, self.expr_())
        return expr

    def expr_(self):
        expr = self.term()
        while self.match(TokenKind.ADD) or self.match(TokenKind.SUB):
            m = {
                TokenKind.ADD: OperatorKind.ADD,
                TokenKind.SUB: OperatorKind.SUB,
            }
            t = self.cur_token()
            k = m[t.kind]
            self.next_token()
            expr = ArithNode(self.function, k, expr, self.term())
        return expr

    def term(self):
        expr = self.unary()
        while self.match(TokenKind.MUL) or self.match(TokenKind.DIV):
            m = {
                TokenKind.MUL: OperatorKind.MUL,
                TokenKind.DIV: OperatorKind.DIV,
            }
            t = self.cur_token()
            k = m[t.kind]
            self.next_token()
            expr = ArithNode(self.function, k, expr, self.term())

        return expr

    def unary(self):
        # TODO: + -a  - +a  + +a - -a
        if self.match(TokenKind.NOT) or self.match(TokenKind.SUB) \
            or self.match(TokenKind.BITAND) or self.match(TokenKind.MUL):
            t = self.cur_token()
            self.next_token()
            Class = self.constructors[t.kind]
            expr = Class(self.function, self.unary())
        elif self.match(TokenKind.LPAREN):
            self.next_token()
            t = self.cur_token()
            if not TypeSystem.is_type_prefix(t.kind):
                # TODO:   if (a = 1)  赋值  注意验证
                expr = self.parse_expression()
                self.expect(TokenKind.RPAREN)
            else:
                type = self.parse_type()
                self.expect(TokenKind.RPAREN)
                expr = self.unary()
                expr = CastNode(self.function, type, expr)
        else:
            expr = self.factor()
        return expr

    def factor(self):
        if self.match(TokenKind.LPAREN):
            self.expect(TokenKind.LPAREN)
            expr = self.parse_bool()
            self.expect(TokenKind.RPAREN)
            return expr
        elif self.match(TokenKind.LBRACE):
            return self.block_()
        # elif self.is_array():
        #     name = self.next_token()
        #     index = self.parse_array_element()
        #     return Array(name, index)
        elif self.match(TokenKind.STRING):
            t = self.next_token()
            return t
        elif self.match_number():
            t = self.next_token()
            return t
        elif self.match(TokenKind.ID):
            # 标识符
            expr = self.parse_identifier()
            if self.match(TokenKind.LPAREN):
                expr = self.parse_call(expr)
            elif self.match(TokenKind.LBRACKET):
                self.next_token()
                size = self.parse_expression()
                self.expect(TokenKind.RBRACKET)
                expr = ArrayNode(self.function, expr, size)
            return expr
            # return self.parse_identifier()
        else:
            raise Exception

    def match_number(self):
        r = self.match(TokenKind.INTCONST) \
            or self.match(TokenKind.FLOATCONST) \
            or self.match(TokenKind.DOUBLECONST)
        return r

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

    def match(self, *token_kind):
        t = self.cur_token()
        for k in token_kind:
            if t.kind is k:
                return True
        return False
