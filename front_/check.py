
from myenum import *
from mysymbol import *


class CheckSystem(object):
    """docstring for CheckSystem."""

    def __init__(self, function_nodes):
        super(CheckSystem, self).__init__()
        self.functions = function_nodes

    def execute(self):
        return
        for f in self.functions:
            stmts = f.stmts
            self.check(stmts)


    def check(self, node):
        if node is None:
            return
        if self.match(node, NodeKind.SEQ):
            stmt = node.stmt

            if node.next_stmt is not None:
                self.check(node.next_stmt)


    def match(self, node, node_kind):
        return node.kind is node_kind
