



class Memory(object):
    """docstring for Memory."""

    def __init__(self, reg, offset, type):
        super(Memory, self).__init__()
        self.reg = reg
        self.offset = offset
        self.type = type

    def access_name(self):
        s = f'{self.offset}({self.reg})'
        return s


class MemorySystem(object):
    """docstring for MemorySystem."""

    def __init__(self):
        super(MemorySystem, self).__init__()

    @classmethod
    def memory(cls, reg, offset, type):
        m = Memory(reg, offset, type)
        return m
