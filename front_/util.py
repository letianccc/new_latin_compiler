
import struct

def decimal_number(float_number):
    # 浮点数字符串转换为十进制表示
    f = float(float_number)
    bytes = struct.pack('<f', f)
    d = struct.unpack('<i', bytes)[0]
    return d

def print_token_names(tokens):
    token_names = [t.name for t in tokens]
    log(token_names)


def is_node_type(node, type_):
    return node.__class__.__name__ == type_

def log(*args, **kwargs):
    print(*args, **kwargs)
