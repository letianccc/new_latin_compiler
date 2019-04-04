
from myenum import *



class Emit(object):
    """docstring for Emit."""

    def __init__(self, symbols):
        super(Emit, self).__init__()
        self.symbols = symbols
        self.code = ''

    def execute(self):
        self.start()
        for f in self.symbols:
            fe = FunctionEmit(f)
            fe.execute()
            self.code += fe.code

    def start(self):
        code = '\t//by latin\n\n'
        self.code += code


class FunctionEmit(object):
    """docstring for FunctionEmit."""

    def __init__(self, function):
        super(FunctionEmit, self).__init__()
        self.function = function
        self.func_tag = f'_{function.name}'
        self.code = ''

    def execute(self):
        self.emit_string()
        self.emit_function_header()
        self.push_stack()
        # self.reserve_space()

        for b in self.function.blocks:
            for ir in b.irs:
                self.emit(ir)
        self.pop_stack()

    def reserve_space(self):
        # TODO: 局部变量的空间
        count = self.function.max_actual_param
        size = 4
        space = size * count
        code = f'\tsubl\t${space}, %esp\n'
        self.emit_code(code)


    def emit_string(self):
        strings = []
        for s in self.function.strings:
            if s.allocate is False:
                strings.append(s)
        code = ''
        for s in strings:
            s.allocate = True
            code += f'{s.access_name()[1:]}:\n'\
                    f'\t.string\t{s.value}\n'
        self.emit_code(code)

    def emit_function_header(self):
        code = '\t.text\n'\
        	   f'\t.globl\t{self.func_tag}\n'\
               f'{self.func_tag}:\n'
        self.emit_code(code)

    def push_stack(self):
        code =   '\tpushl\t%ebp\n'\
                '\tpushl\t%ebx\n'\
                '\tpushl\t%esi\n'\
                '\tpushl\t%edi\n'\
                '\tmovl\t%esp, %ebp\n'\
                '\tandl\t$-16, %esp\n'
        self.emit_code(code)

    def pop_stack(self):
        code = ''
        # if self.func_tag == '_main':
        #     code += '\tcall\t_getchar\n'
        code +=  '\tmovl\t%ebp, %esp\n'\
                '\tpopl\t%edi\n'\
                '\tpopl\t%esi\n'\
                '\tpopl\t%ebx\n'\
                '\tpopl\t%ebp\n'\
                '\tret\n'
        self.emit_code(code)


    def emit(self, ir):
        if self.match(ir, IRKind.CALL):
            self.emit_call(ir)

    def emit_call(self, ir):
        ps = ir.params
        size = 4
        for p in ps:
            name = p.access_name()
            offset = size * p.index
            code = f'\tmovl\t{name}, {offset}(%esp)\n'
            self.emit_code(code)

        function_tag = f'_{ir.function.value}'
        code = f'\tcall\t{function_tag}\n'
        self.emit_code(code)

    def emit_code(self, code):
        self.code += code


    def match(self, ir, ir_kind):
        return ir.kind is ir_kind
