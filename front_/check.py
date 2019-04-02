
from myenum import *
from mysymbol import *


class CheckSystem(object):
    """docstring for CheckSystem."""

    def __init__(self, function_nodes):
        super(CheckSystem, self).__init__()
        self.functions = function_nodes

    def execute(self):
        for f in self.functions:
            stmts = f.stmts
            self.check(stmts)


    def check(self, node):
        if self.match(node, NodeKind.SEQ):
            stmt = node.stmt
            if self.match(stmt, NodeKind.CALL):
                s = SymbolSystem.find_symbol(stmt.name)
                if s is None:
                    raise Exception
                stmt.function = s
            self.check(node.next_stmt)


    def match(self, node, node_kind):
        return node.kind is node_kind
