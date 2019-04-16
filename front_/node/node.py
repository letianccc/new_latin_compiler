

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
        # TODO: 暂时只考虑int const 转 double
        if src.kind is SymbolKind.INTCONST and dst.type.match(TypeSystem.DOUBLE):
            src = src.translate_type(dst.type)
        elif src.kind is SymbolKind.DOUBLECONST and dst.type.match(TypeSystem.INT):
            src = src.translate_type(TypeSystem.INT)
        ir = AssignIR(dst, src)
        self.gen_ir(ir)
