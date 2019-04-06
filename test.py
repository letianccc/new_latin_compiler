class T:
    def __init__(self):
        self.__value = 5

    def value():
        doc = "The value property."
        def fget(self):
            print('get')
            return self.__value
        def fset(self, value):
            print('set')
            if value < 0:
                raise Exception('不能小于0')
            self.__value = value
        def fdel(self):
            del self.__value
        return locals()
    value = property(**value())


t = T()
v = t.value
print(v)
t.value = 8
v = t.value()
print(v)