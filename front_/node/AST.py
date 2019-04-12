
from front_.util import *
from front_.myenum import *
from front_.symbol_system import *
from front_.memory import *
from front_.node.node import Node
from front_.defind import *



class FunctionNode(Node):
    def __init__(self):
        super(FunctionNode, self).__init__()
        self.kind = NodeKind.FUNCTION
        self.type = None
        self.identifier = None
        self.params = None
        self.symbol = None
        self.statements = None
        self.cur_block = None
        self.blocks = []
        self.code = ''
        self.call_nodes = []

    def check(self):
        SymbolSystem.enter()
        for p in self.params:
            p.check()
        for stmt in self.statements:
            stmt.check(self.kind, self.type)
        SymbolSystem.quit()

    def gen(self):
        if self.statements is None:
            return
        for stmt in self.statements:
            stmt.gen()
        self.symbol.allocate_block_id()

    def emit(self):
        ...

class ParameterNode(Node):
    def __init__(self, function, kind, specifier, parameter):
        super(ParameterNode, self).__init__()
        self.function = function
        self.kind = kind
        # 表示实参的变量或常量已经存在，因此有type
        # 表示形参的变量未声明，因此type为None
        self.specifier = specifier
        self.parameter = parameter
        self.index = None
        self.offset = None

    def check(self):
        super().check()
        f = self.function
        p = self.parameter

        # if p.match(TokenKind.ID):
        #     s = p.check(self.kind, self.type)
        #     if self.kind is NodeKind.FORMAL_PARAMETER:
        #         f.add_param(s)
        # else:
        #     s = p.check(self.kind, self.type)
        s = p.check(self.kind, self.specifier)
        if s.match(SymbolKind.ID):
            if self.kind is NodeKind.FORMAL_PARAMETER:
                f.add_param(s)
        self.parameter = s

    @property
    def type(self):
        return self.parameter.type

    def gen(self):
        src = self.parameter
        src = src.gen()
        # TODO: 应该在is_extern为True使用max_type， 否则使用callee对应的形参类型
        dst_type = TypeSystem.max_type(src.type, TypeSystem.INT)
        pos = f'{self.offset}(%esp)'
        dst = MemorySystem.new(pos, dst_type)
        ir = AssignIR(dst, src)
        self.gen_ir(ir)


    def access_name(self):
        return f'{self.offset}(%esp)'

class DeclarationNode(Node):
    def __init__(self, function, specifier):
        super(DeclarationNode, self).__init__()
        self.function = function
        self.specifier = specifier
        self.declarators = []
        self.kind = NodeKind.DECLARATION

    def add(self, declarator):
        self.declarators.append(declarator)

    def check(self, kind, type):
        super().check()
        self.specifier = TypeSystem.type(self.specifier.kind)
        type = self.specifier
        for d in self.declarators:
            d.check(type)
            self.function.locals.append(d.declarator)

    def gen(self):
        for d in self.declarators:
            d.gen()

class DeclaratorInitializerNode(Node):
    def __init__(self, function, declarator, initializer):
        super(DeclaratorInitializerNode, self).__init__()
        self.kind = NodeKind.DECLARATOR_INITIALIZER
        self.function = function
        self.declarator = declarator
        self.initializer = initializer

    def check(self, identifier_type):
        super().check()
        self.declarator = self.declarator.check(self.kind, identifier_type)
        if self.initializer:
            # TODO: type暂时为None
            self.initializer = self.initializer.check(None, None)
            d = Defind(NodeKind.ASSIGN, self.declarator, self.initializer)
            self.declarator.defind = d

        return self

    def gen(self):
        # TODO: initializer 应该递归gen
        if self.initializer:
            # d = self.declarator.gen()
            src = self.initializer.gen()
            ir = AssignIR(self.declarator, src)
            self.gen_ir(ir)

# class DeclaratorNode(Node):
#     def __init__(self, function, kind):
#         self.kind = NodeKind.DECLARATOR
#         self.function = function
#         self.identifier = identifier
#         self.initializer = initializer

class PointerDeclaratorNode(Node):
    def __init__(self, function, declarator):
        super(PointerDeclaratorNode, self).__init__()
        self.kind = NodeKind.POINTER_DECLARATOR
        self.function = function
        self.declarator = declarator

    def check(self, kind, type):
        d = self.declarator.check(kind, type)
        d.add_parent_type(TypeKind.POINTER, TypeSystem.INT.size)
        self.declarator = d
        return d

    # def gen(self):
    #     # TODO: 声明的指针变量应该不需要gen
    #     return self.declarator


class IfNode(Node):
    def __init__(self, cond, then_stmts, else_stmts):
        self.cond = cond
        self.then = then_stmts
        self.else_ = else_stmts

class WhileNode(Node):
    def __init__(self, cond, suite):
        self.cond = cond
        self.suite = suite
