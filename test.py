class T:
    def __init__(self):
        self.value = 1

    def add(self):
        self.value += 5

class P(T):
    def add(self):
        super().add()
        self.value += 3

p = P()
print(p.value)
p.add()
print(p.value)
