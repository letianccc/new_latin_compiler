import struct


def decimal_from_double(double_number):
    # 浮点数字符串转换为十进制表示
    n = float(double_number)
    bs = struct.pack('d', n)
    decimal1 = struct.unpack('i', bs[:4])[0]
    decimal2 = struct.unpack('i', bs[4:])[0]
    return (decimal1, decimal2)
d = decimal_from_double('1.5')
print(d)