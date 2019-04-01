

# temp 类型是'TMP'  data是对应的token 名字是tX
class Token(object):
    def __init__(self, name=None, type_=None, data=None):
        self.name = name
        self.type_ = type_
        self.data = data
        self.kind = None

    def emit(self, emiter):
        if self.type_ == 'number':
            return '$' + self.name
        raise Exception
