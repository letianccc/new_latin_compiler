
from front_.util import *
from front_.myenum import *
from front_.type_system import TypeSystem
from front_.symbol_system import *
from front_.ir import *
from front_.reg_system import *
from front_.memory import *
from front_.defind import *

class Node(object):
    """docstring for Node."""

    def __init__(self):
        super(Node, self).__init__()
        self.left_value = False

    def match(self, *kinds):
        for k in kinds:
            if self.kind is k:
                return True
        return False

    def check(self):
        self.function = self.function.symbol

    def gen_ir(self, ir):
        ir.from_node = self.kind
        self.function.gen_ir(ir)

class CallNode(Node):
    def __init__(self, function, call_function, parameters):
        super(CallNode, self).__init__()
        self.function = function
        self.call_function = call_function
        self.params = parameters
        self.kind = NodeKind.CALL

    def check(self, kind, type):
        super().check()
        self.call_function = self.call_function.check(NodeKind.CALL)

        for p in self.params:
            p.check()

        self.allocate_call_space()
        # 分配实参偏移
        self.set_param_offset()
        return self

    def allocate_call_space(self):
        # 计算调用最多需要预留的栈空间
        space = 0
        callee = self.call_function
        int_size = TypeSystem.INT.size
        for p in self.params:
            psize = p.parameter.type.size
            if callee.is_extern:
                # printf参数占8位或4位
                size = max(int_size, psize)
            else:
                size = psize
            space += size
        current = self.function.call_space
        self.function.call_space = max(space, current)


    def check_callee(self):
        if not self.call_function.is_extern:
            if len(self.params) != len(self.call_function.params):
                raise Exception('函数参数数量不匹配')
            # TODO: 检测参数兼容性


    def set_param_offset(self):
        # TODO: 这部分逻辑要移到emit中
        size = 0
        offset = 0
        for p in reversed(self.params):
            p.offset = offset
            size = p.parameter.type.size
            offset += size

    def gen(self):
        for p in self.params:
            p.gen()
        ir = CallIR(self.call_function, self.params)
        self.gen_ir(ir)
        size = self.call_function.type.size
        dst = RegSystem.reg(RegKind.AX, size)
        return dst



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
    def __init__(self, function, kind, type, parameter):
        super(ParameterNode, self).__init__()
        self.function = function
        self.kind = kind
        # 表示实参的变量或常量已经存在，因此有type
        # 表示形参的变量未声明，因此type为None
        self.type = type
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
        s = p.check(self.kind, self.type)
        if s.match(SymbolKind.ID):
            if self.kind is NodeKind.FORMAL_PARAMETER:
                f.add_param(s)
        self.parameter = s

    def gen(self):
        src = self.parameter
        src = src.gen()
        # TODO: 应该在is_extern为True使用max_type， 否则使用callee对应的形参类型
        dst_type = TypeSystem.max_type(src.type, TypeSystem.INT)
        dst = MemorySystem.memory('%esp', self.offset, dst_type)
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

class PointerNode(Node):
    def __init__(self, function, declarator):
        super(PointerNode, self).__init__()
        self.kind = NodeKind.POINRER
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

class AssignNode(Node):
    def __init__(self, function, variable, value):
        super(AssignNode, self).__init__()
        self.variable = variable
        self.value = value
        self.function = function
        self.kind = NodeKind.ASSIGN

    def check(self, kind, type):
        super().check()
        self.variable = self.variable.check(self.kind, None)
        self.value = self.value.check(self.kind, None)
        d = Defind(NodeKind.ASSIGN, self.variable, self.value)
        self.variable.defind = d

    def gen(self):
        if self.variable.match(NodeKind.INDIRECTION):
            dst = self.variable.gen()
            src = self.value.gen()
            dst = dst.defind.src1
            ir = IndirectionAssignIR(dst, src)
            self.gen_ir(ir)
        else:
            dst = self.variable.gen()
            src = self.value.gen()
            ir = AssignIR(dst, src)
            self.gen_ir(ir)


class ReturnNode(Node):
    def __init__(self, function, operand):
        super(ReturnNode, self).__init__()
        self.operand = operand
        self.function = function
        self.kind = NodeKind.RETURN

    def check(self, kind, type):
        super().check()
        self.operand = self.operand.check(kind, type)

    def gen(self):
        src = self.operand.gen()
        type = TypeSystem.INT
        ir = ReturnIR(type, src)
        self.gen_ir(ir)

class IfNode(Node):
    def __init__(self, cond, then_stmts, else_stmts):
        self.cond = cond
        self.then = then_stmts
        self.else_ = else_stmts

class WhileNode(Node):
    def __init__(self, cond, suite):
        self.cond = cond
        self.suite = suite
