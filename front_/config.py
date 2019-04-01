from enum import Enum, unique

@unique
class IR_Kind(Enum):
    ASSIGN = 0
    JMP = 1


not_map = {
    '||': '&&',
    '&&': '||',
    '<': '>=',
    '<=': '>',
    '>': '<=',
    '>=': '<',
    '==': '!=',
    '!=': '==',
}

jmp_map = {
    '==': 'je',
    '!=': 'jne',
    '<': 'jl',
    '<=': 'jle',
    '>': 'jg',
    '>=': 'jge',
    None: 'jmp'
}

expr_map = {
    '+': 'add',
    '-': 'sub',
    '*': 'mul',
}
