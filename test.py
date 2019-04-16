class T:
    targets = [1, 2]
    @property
    @classmethod
    def value(cls):
        return cls.targets

    @classmethod
    def add(cls, value):
        cls.targets.append(value)
T.add(333)
print(T.value)