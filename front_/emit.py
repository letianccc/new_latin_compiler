
from myenum import *



class Emit(object):
    """docstring for Emit."""

    def __init__(self, symbols):
        super(Emit, self).__init__()
        self.symbols = symbols
        self.code = ''

    def execute(self):
        for f in self.symbols:
            fe = FunctionEmit(f)
            fe.execute()
            self.code += fe.code

class FunctionEmit(object):
    """docstring for FunctionEmit."""

    def __init__(self, function):
        super(FunctionEmit, self).__init__()
        self.function = function
        self.func_tag = f'_{function.name}'
        self.code = ''

    def execute(self):
        code = '\t.text\n'\
        	   f'\t.globl\t{self.func_tag}\n'\
               f'{self.func_tag}:\n'
        code +=   '\tpushl\t%ebp\n'\
                '\tpushl\t%ebx\n'\
                '\tpushl\t%esi\n'\
                '\tpushl\t%edi\n'\
                '\tmovl\t%esp, %ebp\n'\
                '\tandl\t$-16, %esp\n'
        self.emit_code(code)
        for b in self.function.blocks:
            for ir in b.irs:
                self.emit(ir)
        code = ''
        if self.func_tag == '_main':
            code += '\tcall\t_getchar\n'
        code +=  '\tmovl\t%ebp, %esp\n'\
                '\tpopl\t%edi\n'\
                '\tpopl\t%esi\n'\
                '\tpopl\t%ebx\n'\
                '\tpopl\t%ebp\n'\
                '\tret\n'
        self.emit_code(code)

    def emit(self, ir):
        if self.match(ir, IRKind.CALL):
            # TODO: 处理参数
            function_tag = f'_{ir.function.name}'
            code = f'\tcall\t{function_tag}\n'
            self.emit_code(code)

    def emit_code(self, code):
        self.code += code


    def match(self, ir, ir_kind):
        return ir.kind is ir_kind
