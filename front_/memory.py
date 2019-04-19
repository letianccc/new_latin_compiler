

from front_.myenum import *
from front_.symbol_system import *


class Memory(Symbol):
    """docstring for Memory."""

    def __init__(self, access_name, type):
        super(Memory, self).__init__()
        self.__access_name = access_name
        self.type = type
        self.kind = SymbolKind.MEMORY

    def access_name(self):
        return self.__access_name


class MemorySystem(object):
    """docstring for MemorySystem."""

    def __init__(self):
        super(MemorySystem, self).__init__()

    @classmethod
    def new(cls, access_name, type):
        m = Memory(access_name, type)
        return m
