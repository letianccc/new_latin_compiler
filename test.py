class T:
    def __init__(self):
        self._value = 1

    @property
    def value(self):
        print('getter')
        return self._value

    @value.setter
    def value(self, value):
        print('setter')
        pass

t = T()
v = t.value
print(v)