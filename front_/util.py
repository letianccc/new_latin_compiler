
import struct

def decimal_from_float(float_number):
    # float字符串转换为十进制表示
    f = float(float_number)
    bytes = struct.pack('<f', f)
    d = struct.unpack('<i', bytes)[0]
    return d

def decimal_from_double(double_number):
    # double字符串转换为十进制表示
    n = float(double_number)
    bs = struct.pack('d', n)
    decimal1 = struct.unpack('i', bs[:4])[0]
    decimal2 = struct.unpack('i', bs[4:])[0]
    return (decimal1, decimal2)


def print_token_names(tokens):
    token_names = [t.name for t in tokens]
    log(token_names)


def is_node_type(node, type_):
    return node.__class__.__name__ == type_

def log(*args, **kwargs):
    print(*args, **kwargs)
