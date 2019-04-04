class SymbolSystem(object):
    symbols = None
    @classmethod
    def init(cls):
        cls.symbols = []

SymbolSystem.init()
print(SymbolSystem.symbols)