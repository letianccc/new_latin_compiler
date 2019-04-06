class T:
    def __init__(self):
        self.__v = 0

    @property
    def value(self):
        print('T get')
        return self.__v

    @value.setter
    def value(self, value):
        print('T set')
        self.__v = value

class Child(T):
    @property
    def value(self):
        print('cHILD get')
        return super().value

t = Child()
print(t.value)
t.value = 5
print(t.value)

# print(t.__v)