
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
        stmts = self.statements
        for index, stmt in enumerate(self.statements):
            stmts[index] = stmt.check()
        SymbolSystem.quit()
        return self

    def gen(self):
        # if self.statements is None:
        #     return
        for stmt in self.statements:
            stmt.gen()
        # TODO: 应该放到emit中
        # self.symbol.allocate_block_id()

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
        self.parameter = self.parameter.check(self.specifier)
        self.function.add_param(self.parameter)
        return self

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
        return self

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
            d = Defind(OperatorKind.ASSIGN, self.declarator, self.initializer)
            self.declarator.defind = d

        return self

    def gen(self):
        # TODO: initializer 应该递归gen
        if self.initializer:
            dst = self.declarator
            src = self.initializer
            self.gen_assign_core_node(dst, src)

class ArrayInitializerNode(Node):
    def __init__(self, function, declarator, initializer):
        super(ArrayInitializerNode, self).__init__()
        self.kind = NodeKind.DECLARATOR_INITIALIZER
        self.function = function
        self.declarator = declarator
        self.initializer = initializer

    def check(self, identifier_type):
        super().check()
        self.declarator = self.declarator.check(identifier_type)
        initer = self.initializer
        if initer is not None:
            for index, e in enumerate(initer):
                e = e.check()
                initer[index] = e
                d = Defind(OperatorKind.ASSIGN, self.declarator, e)
                self.declarator.defind = d
        return self

    def gen(self):
        values = []
        if self.initializer is not None:
            for value in self.initializer:
                v = value.gen()
                values.append(v)
        ir = ArrayInitialIR(self.declarator, values)
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
            self.declarator = self.declarator.check(type)
            return self.declarator
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
    def __init__(self, function, cond, then_stmts, else_stmts):
        self.function = function
        self.cond = cond
        self.then_stmts = then_stmts
        self.else_stmts = else_stmts
        self.kind = NodeKind.IF

    def check(self):
        super().check()
        SymbolSystem.enter()
        self.cond = self.cond.check()

        stmts = self.then_stmts
        for index, stmt in enumerate(self.then_stmts):
            stmts[index] = stmt.check()

        SymbolSystem.quit()
        SymbolSystem.enter()
        stmts = self.else_stmts
        for index, stmt in enumerate(self.else_stmts):
            stmts[index] = stmt.check()
        SymbolSystem.quit()
        return self

    def gen(self):
        def cond_closure(true_block, false_block):
            cond = self.cond.not_node()
            cond.gen(false_block, true_block)

        def then_closure():
            for stmt in self.then_stmts:
                stmt.gen()

        else_closure = None
        if len(self.else_stmts) != 0:
            def else_closure():
                for stmt in self.else_stmts:
                    stmt.gen()

        self.branch_template(cond_closure, then_closure, else_closure)

class WhileNode(Node):
    def __init__(self, function, cond, suite):
        self.cond = cond
        self.suite = suite
        self.function = function
        self.kind = NodeKind.WHILE

    def check(self):
        super().check()
        SymbolSystem.enter()
        self.cond = self.cond.check()
        for index, stmt in enumerate(self.suite):
            self.suite[index] = stmt.check()
        SymbolSystem.quit()
        return self

    def gen(self):
        cond_block = Block()
        suite_block = Block()
        next_block = Block()

        self.function.change_block(cond_block)
        cond = self.cond.not_node()
        cond.gen(next_block, suite_block)

        self.function.change_block(suite_block)
        for stmt in self.suite:
            stmt.gen()
        self.gen_jump(cond_block)

        self.function.add_block(cond_block)
        self.function.add_block(suite_block)
        self.function.add_block(next_block)
        self.function.change_block(next_block)

class ForNode(Node):
    def __init__(self, function, initialer, condition, iterator, suite):
        self.function = function
        self.kind = NodeKind.FOR
        self.initialer = initialer
        self.condition = condition
        self.iterator = iterator
        self.suite = suite

    def check(self):
        super().check()
        SymbolSystem.enter()
        self.initialer = self.initialer.check()
        self.condition = self.condition.check()
        for index, stmt in enumerate(self.iterator):
            self.iterator[index] = stmt.check()
        for index, stmt in enumerate(self.suite):
            self.suite[index] = stmt.check()
        SymbolSystem.quit()
        return self

    def gen(self):
        self.initialer.gen()

        cond_block = Block()
        suite_block = Block()
        next_block = Block()
        # 先add 不然在stmt gen过程中  会先插入其他块
        self.function.add_block(cond_block)
        self.function.add_block(suite_block)

        self.function.change_block(cond_block)
        cond = self.condition.not_node()
        cond.gen(next_block, suite_block)

        self.function.change_block(suite_block)
        for stmt in self.suite:
            stmt.gen()
        for stmt in self.iterator:
            stmt.gen()
        self.gen_jump(cond_block)

        self.function.add_block(next_block)
        self.function.change_block(next_block)
