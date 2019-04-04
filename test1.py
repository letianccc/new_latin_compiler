class T:
    id = 0
    def __init__(self):
        self.value = T.id
        T.id += 1

import time
s = time.time()
array = [T() for i in range(1000000)]
for e in reversed(array):
# for e in array:
    ...
    # print(e.value, end=' ')
e = time.time()
print()
print(e - s)
import os
import psutil
process = psutil.Process(os.getpid())
print((process.memory_info()[0]/1024)/2014)

# 1.37 109