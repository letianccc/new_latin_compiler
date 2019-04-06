class T:
    v = 0
    @classmethod
    def init(cls):
        cls.v = 1

    @classmethod
    @property
    def value(cls):
        return 1

print(T.v)
T.init()
print(T.v)
print(T.value)