

from front_.myenum import *
from front_.util import *
from front_.type_system import *
from front_.ir import *





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

    def gen_ir(self, ir):
        ir.from_node = self.kind
        self.function.gen_ir(ir)

    def gen_assign(self, destination, source):
        src = source.gen()
        dst = destination.gen()
        src, dst = self.translate_type(dst.type, src, dst)
        ir = AssignIR(dst, src)
        self.gen_ir(ir)

    def translate_type(self, type, symbol1, symbol2=None):
        s1 = symbol1
        s2 = symbol2
        if s1.kind is SymbolKind.INTCONST or s1.kind is SymbolKind.DOUBLECONST:
            s1 = s1.translate_type(type)
        if s2.kind is SymbolKind.INTCONST or s2.kind is SymbolKind.DOUBLECONST:
            s2 = s2.translate_type(type)
        return s1, s2
