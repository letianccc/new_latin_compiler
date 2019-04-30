
from front_.myenum import *


class Block:
    id = 0
    # id_pool = 0
    def __init__(self, kind=BlockKind.GENERAL):
        # self.statements = stmts
        # self.id = Block.id_pool
        # Block.id_pool += 1
        self.irs = []
        self.kind = kind
        self.symbol = None
        # self.index = None
        self.__access_name = None
        self.id = 0
        Block.id += 1

    def add_ir(self, ir):
        self.irs.append(ir)

    def access_name(self):
        return self.__access_name

    def set_access_name(self, access_name):
        self.__access_name = access_name

    def name(self):
        return f'B{str(self.id)}'
