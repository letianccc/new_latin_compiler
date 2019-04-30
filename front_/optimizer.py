

from front_.common_expression import *


class Optimizer(object):
    """docstring for Optimizer."""

    def __init__(self, functions):
        super(Optimizer, self).__init__()
        self.functions = functions

    def execute(self):
        for f in self.functions:
            for b in f.blocks:
                irs = []
                for ir in b.irs:
                    ir = ir.optimize()
                    irs.append(ir)
                b.irs = irs
                common_expression.clear()
