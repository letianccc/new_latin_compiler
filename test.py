class Type:
    types = None
    @classmethod
    def add_type(cls, key, value):
        cls.types[key] = value

    @classmethod
    def init(cls, types):
        cls.types = types


ts = {1:'a', 2:'b'}
print(Type.types)
Type.init(ts)