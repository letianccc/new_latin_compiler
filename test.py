a = 'aa\naa'
print(a)
b = f'bb{a}bb'
print(b)
open('test', 'w').write(b)