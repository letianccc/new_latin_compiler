

from front_.myenum import *






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
        self.function = self.function.symbol

    def gen_ir(self, ir):
        ir.from_node = self.kind
        self.function.gen_ir(ir)
