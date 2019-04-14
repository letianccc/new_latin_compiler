
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
            stmt.check()
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
    def __init__(self, function, specifier, parameter):
        super(ParameterNode, self).__init__()
        self.kind = NodeKind.FORMAL_PARAMETER
        self.specifier = specifier
        self.function = function
        self.parameter = parameter

    def check(self):
        super().check()
        s = self.parameter.check(self.specifier)
        self.parameter = s
        self.function.add_param(s)

    def gen(self):
        p = self.parameter.gen()
        return p

class DeclarationNode(Node):
    def __init__(self, function, specifier):
        super(DeclarationNode, self).__init__()
        self.function = function
        self.specifier = specifier
        self.declarators = []
        self.kind = NodeKind.DECLARATION

    def add(self, declarator):
        self.declarators.append(declarator)

    def check(self):
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
        self.declarator = self.declarator.check(identifier_type)
        if self.initializer:
            # TODO: type暂时为None
            self.initializer = self.initializer.check()
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

class PointerDeclaratorNode(Node):
    def __init__(self, function, declarator):
        super(PointerDeclaratorNode, self).__init__()
        self.kind = NodeKind.POINTER_DECLARATOR
        self.function = function
        self.declarator = declarator

    def check(self, type):
        type = TypeSystem.pointer(type)
        if self.declarator is not None:
            d = self.declarator.check(type)
            self.declarator = d
            return d
        else:
            # TODO: 这部分逻辑最好用另一个类实现
            return type

class TypeNode(Node):
    def __init__(self, function, specifier, declarator):
        super(TypeNode, self).__init__()
        self.function = function
        self.specifier = specifier
        self.declarator = declarator
        self.kind = NodeKind.TYPE

    def check(self):
        super().check()
        self.specifier = TypeSystem.type(self.specifier.kind)
        type = self.specifier
        # int * 类型  返回Pointer类型
        if self.declarator is not None:
            type = self.declarator.check(type)
        return type

    def gen(self):
        for d in self.declarators:
            d.gen()


class IfNode(Node):
    def __init__(self, cond, then_stmts, else_stmts):
        self.cond = cond
        self.then = then_stmts
        self.else_ = else_stmts

class WhileNode(Node):
    def __init__(self, cond, suite):
        self.cond = cond
        self.suite = suite
