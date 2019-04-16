import struct
def decimal_from_double(double_number):
    # double字符串转换为十进制表示
    n = float(double_number)
    bs = struct.pack('d', n)
    decimal1 = struct.unpack('i', bs[:4])[0]
    decimal2 = struct.unpack('i', bs[4:])[0]
    return (decimal1, decimal2)

n = 1.5
n1 = decimal_from_double(n)
print(n1)
