import re
v = 'aa\n\n\n\n'
s = v.encode("unicode_escape").decode("utf-8")
print(s)