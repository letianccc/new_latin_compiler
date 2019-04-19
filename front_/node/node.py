

from front_.myenum import *
from front_.util import *
from front_.type_system import *
from front_.ir import *
from front_.symbol_system import *
from front_.reg_system import *





class Node(object):
    """docstring for Node."""
    __constructor = None


    @classmethod
    def constructor(cls, kind):
        c = cls.__constructor[kind]
        return c

    def __init__(self):
        super(Node, self).__init__()
        self.left_value = False

    def match(self, *kinds):
        for k in kinds:
            if self.kind is k:
                return True
        return False

    def check(self):
        # if getattr(self.function, 'symbol') is None:
        #     ...
        # log(self.function.identifier.value)
        self.function = self.function.symbol

    def gen(self):
        return self

    def gen_ir(self, ir):
        ir.from_node = self.kind
        self.function.gen_ir(ir)

    def gen_assign_core(self, destination, source):
        src = source
        dst = destination
        src, dst = self.translate_type(dst.type, src, dst)
        ir = AssignIR(dst, src)
        self.gen_ir(ir)

    def translate_type(self, type, symbol1, symbol2=None):
        s1 = symbol1
        s2 = symbol2
        if s1.kind is SymbolKind.INTCONST or s1.kind is SymbolKind.DOUBLECONST:
            s1 = s1.translate_type(type)
        if s2 is None:
            return s1
        if s2.kind is SymbolKind.INTCONST or s2.kind is SymbolKind.DOUBLECONST:
            s2 = s2.translate_type(type)
        return s1, s2

    def branch_template(self, condition_closure, then_closure, else_closure):
        then_block = Block()
        next_block = Block()
        if else_closure is None:
            condition_closure(then_block, next_block)

            self.function.change_block(then_block)
            then_closure()
            self.function.add_block(then_block)
        else:
            else_block = Block()
            condition_closure(then_block, else_block)
            self.function.change_block(then_block)
            then_closure()
            self.gen_jump(next_block)
            self.function.change_block(else_block)
            else_closure()
            self.function.add_block(then_block)
            self.function.add_block(else_block)
        self.function.add_block(next_block)
        self.function.change_block(next_block)

    def gen_jump(self, block):
        ir = JumpIR(block)
        self.gen_ir(ir)

    def gen_assign(self, destination, source):
        if destination.match(NodeKind.ARRAY):
            src = source.gen()
            dst = destination
            index = dst.index_expression.gen()
            self.gen_assign_core(RegSystem.ECX, index)
        else:
            dst = destination.gen()
            src = source.gen()
        if destination.match(NodeKind.INDIRECTION):
            dst = dst.defind.src1
            ir = IndirectionAssignIR(dst, src)
            self.gen_ir(ir)
        else:
            self.gen_assign_core(dst, src)

    def gen_assign_core_node(self, destination, source):
        src = source
        dst = destination
        # TODO: 判断要重构
        if not src.match(NodeKind.BOOLEAN):
            self.gen_assign(dst, src)
        else:
            self.gen_bool_assign(dst, src)

    def gen_bool_assign(self, destination, source):
        dst = destination
        src = source
        def cond_closure(true_block, false_block):
            cond = src.not_node()
            cond.gen(false_block, true_block)

        def then_closure():
            s1 = SymbolSystem.find_symbol(SymbolKind.INTCONST, '1')
            self.gen_assign(dst, s1)

        def else_closure():
            s0 = SymbolSystem.find_symbol(SymbolKind.INTCONST, '0')
            self.gen_assign(dst, s0)

        self.branch_template(cond_closure, then_closure, else_closure)
