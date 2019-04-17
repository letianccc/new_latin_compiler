


from front_.myenum import *
from front_.type_system import *

class Reg(object):
    """docstring for Type."""

    def __init__(self, kind, access_name, size):
        super(Reg, self).__init__()
        self.kind = kind
        self.size = size
        # TODO: type 暂时为short或int
        self.type = TypeSystem.SHORT if size == 2 else TypeSystem.INT
        self.__access_name = access_name

    def match(self, *types):
        for t in types:
            if self.kind is t.kind:
                return True
        return False

    def access_name(self):
        return self.__access_name

    def gen(self):
        return self

class RegSystem(object):
    EAX = Reg(RegKind.AX, '%eax', 4)
    AX = Reg(RegKind.AX, '%ax', 2)
    EDX = Reg(RegKind.DX, '%edx', 4)
    DX = Reg(RegKind.DX, '%dx', 2)

    @classmethod
    def reg(cls, kind, size):
        # 目前size为2返回AX  为0或4返回EAX
        if kind is RegKind.AX:
            r = cls.AX if size == 2 else cls.EAX
        elif kind is RegKind.DX:
            r = cls.DX if size == 2 else cls.EDX
        return r
