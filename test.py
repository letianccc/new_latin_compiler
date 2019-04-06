import struct

f = 1.5
bytes = struct.pack('<d', f)
print(bytes)
d = struct.unpack('<Q', bytes)
print(d)