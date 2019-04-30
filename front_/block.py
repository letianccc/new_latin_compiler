
from front_.myenum import *


class Block:
    id = 0
    # id_pool = 0
    def __init__(self, name=None):
        # self.statements = stmts
        # self.id = Block.id_pool
        # Block.id_pool += 1
        self.irs = []
        self.symbol = None
        # self.index = None
        if name is None:
            self.kind = BlockKind.GENERAL
            self.id = Block.id
            Block.id += 1
            self.__access_name = None
        else:
            self.kind = BlockKind.FUNCTION
            self.id = -1
            self.__access_name = name

    def add_ir(self, ir):
        self.irs.append(ir)

    def access_name(self):
        return self.__access_name

    def set_access_name(self, access_name):
        self.__access_name = access_name

    def name(self):
        if self.id == -1:
            return self.access_name()
        return f'B{str(self.id)}'
