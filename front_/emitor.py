
from front_.myenum import *
from front_.util import *
from front_.symbol_system import *

class Emit(object):
    """docstring for Emit."""

    def __init__(self, symbols):
        super(Emit, self).__init__()
        self.symbols = symbols
        self.code = ''

    def execute(self):
        self.allocate()
        self.start()
        for f in self.symbols:
            fe = FunctionEmit(f)
            fe.execute()
            self.emit_code(fe.code)
        self.emit_double()

    def  allocate(self):
        # double
        # TODO: 待重构
        doubles = SymbolSystem.double_constants()
        for index, f in enumerate(doubles):
            addr = f'FLOAT{index}'
            f.access_name = addr


    def start(self):
        code = '//by latin\n\n'
        self.emit_code(code)

    def emit_double(self):
        doubles = SymbolSystem.double_constants()
        code = ''
        for f in doubles:
            code += f'{f.access_name}:\n'
            d1, d2 = decimal_from_double(f.value)
            code += f'    .long\t{d1}\n'
            code += f'    .long\t{d2}\n'
            self.emit_code(code)

    def emit_code(self, code):
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
        # size = 4
        code = ''

        # TODO: 这部分逻辑要移到别的地方
        size = 0
        for p in reversed(ps):
            # src = p.access_name
            offset = size * p.index
            p.offset = offset
            size = p.parameter.type.size


        for p in ps:
            # size = p.parameter.type.size
            src = p.access_name
            # offset = size * p.index

            # 不能把内存move到内存，需要寄存器过渡
            target = f'{p.offset}(%esp)'
            if p.parameter.type.kind is TypeKind.DOUBLE:
                code += f'    fldl\t{src}\n'
                code += f'    fstpl\t{target}\n'
                self.emit_code(code)
                continue


            if p.parameter.kind is SymbolKind.ID:
                if p.parameter.type.kind is TypeKind.DOUBLE:
                    code += f'    fldl\t{src}\n'
                    code += f'    fstpl\t{target}\n'
                    self.emit_code(code)
                    continue
                code = f'    movl\t{src}, %eax\n'
                self.emit_code(code)
                src = '%eax'
            code = f'    movl\t{src}, {target}\n'
            self.emit_code(code)

        function_tag = f'_{ir.function.value}'
        code = f'    call\t{function_tag}\n'
        self.emit_code(code)

    def emit_assign(self, ir):
        dst = ir.operands[0]
        src1 = ir.operands[1]
        code = ''
        dst_addr = dst.access_name
        src_addr = src1.access_name
        if src1.kind is SymbolKind.DOUBLECONST:
            code += f'    fldl\t{src_addr}\n'
            code += f'    fstpl\t{dst_addr}\n'
            self.emit_code(code)
            return

        if src1.kind is SymbolKind.ID:
            if src1.type.kind is TypeKind.DOUBLE:
                code += f'    fldl\t{src_addr}\n'
                code += f'    fstpl\t{dst_addr}\n'
                self.emit_code(code)
                return
            code += f'    movl\t{src_addr}, %eax\n'
            src_addr = '%eax'
        code += f'    movl\t{src_addr}, {dst_addr}\n'
        self.emit_code(code)

    def reserve_space(self):
        # TODO: 局部变量的空间
        s = self.function
        # count = len(s.locals) + self.function.max_actual_param

        space = 0
        for local in s.locals:
            space += local.type.size
        # count = len(s.locals)
        # size = 4
        # space = count * size
        space += self.function.call_space
        code = f'    subl\t${space}, %esp\n'
        self.emit_code(code)
        # 分配地址
        sp = space
        for index, local in enumerate(s.locals):
            local.index = index
            size = local.type.size
            local.offset = sp - (index + 1) * size
        for p in self.function.params:
            # +5  要跳过 返回地址，ebp,ebx,esi,edi 寻址到第一个传递过来的值
            p.offset = (p.index + 5) * p.type.size

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

    def access_name(self, symbol):
        if symbol.kind is SymbolKind.DOUBLECONST:
            ...

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
