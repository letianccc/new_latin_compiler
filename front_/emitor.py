
from front_.myenum import *



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
        code = '//by latin\n\n'
        self.code += code


class FunctionEmit(object):
    """docstring for FunctionEmit."""

    def __init__(self, function):
        super(FunctionEmit, self).__init__()
        self.function = function
        self.func_tag = f'_{function.value}'
        self.code = ''

    def execute(self):
        self.emit_string()
        self.emit_function_header()
        self.push_stack()
        self.reserve_space()

        for b in self.function.blocks:
            for ir in b.irs:
                self.emit(ir)
        self.pop_stack()

    def emit(self, ir):
        if self.match(ir, IRKind.CALL):
            self.emit_call(ir)
        elif self.match(ir, IRKind.ASSIGN):
            self.emit_assign(ir)

    def emit_call(self, ir):
        ps = ir.params
        size = 4
        code = ''
        for p in ps:
            src = p.access_name
            offset = size * p.index
            # 不能把内存move到内存，需要寄存器过渡
            target = f'{offset}(%esp)'
            if p.parameter.kind is SymbolKind.ID:
                code += f'    movl\t{src}, %eax\n'
                src = '%eax'
            code += f'    movl\t{src}, {target}\n'

        function_tag = f'_{ir.function.value}'
        code += f'    call\t{function_tag}\n'
        self.emit_code(code)

    def emit_assign(self, ir):
        dst = ir.operands[0]
        src1 = ir.operands[1]
        code = ''
        dst_addr = dst.access_name
        src_addr = src1.access_name
        if src1.kind is SymbolKind.ID:
            code += f'    movl\t{src_addr}, %eax\n'
            src_addr = '%eax'
        code += f'    movl\t{src_addr}, {dst_addr}\n'
        self.emit_code(code)

    def reserve_space(self):
        # TODO: 局部变量的空间
        s = self.function
        count = len(s.locals) + self.function.max_actual_param
        size = 4
        space = count * size
        sp = space - size
        for index, local in enumerate(s.locals):
            local.index = index
            local.offset = sp - index * size
        for p in self.function.params:
            # +5  要跳过 返回地址，ebp,ebx,esi,edi 寻址到第一个传递过来的值
            p.offset = (p.index + 5) * size
        code = f'    subl\t${space}, %esp\n'
        self.emit_code(code)

    def emit_string(self):
        strings = []
        for s in self.function.strings:
            if s.allocate is False:
                strings.append(s)
        code = ''
        for s in strings:
            s.allocate = True
            code += f'{s.access_name[1:]}:\n'\
                    f'    .string\t{s.value}\n'
        self.emit_code(code)

    def emit_function_header(self):
        code = '    .text\n'\
        	   f'    .globl\t{self.func_tag}\n'\
               f'{self.func_tag}:\n'
        self.emit_code(code)

    def push_stack(self):
        code =   '    pushl\t%ebp\n'\
                '    pushl\t%ebx\n'\
                '    pushl\t%esi\n'\
                '    pushl\t%edi\n'\
                '    movl\t%esp, %ebp\n'\
                '    andl\t$-16, %esp\n'
        self.emit_code(code)

    def pop_stack(self):
        code = ''
        # if self.func_tag == '_main':
        #     code += '    call\t_getchar\n'
        code +=  '    movl\t%ebp, %esp\n'\
                '    popl\t%edi\n'\
                '    popl\t%esi\n'\
                '    popl\t%ebx\n'\
                '    popl\t%ebp\n'\
                '    ret\n'
        self.emit_code(code)

    def emit_code(self, code):
        self.code += code

    def match(self, ir, ir_kind):
        return ir.kind is ir_kind
