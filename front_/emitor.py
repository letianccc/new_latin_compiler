
from front_.myenum import *
from front_.util import *
from front_.symbol_system import *

class Emit(object):
    """docstring for Emit."""

    def __init__(self, functions):
        super(Emit, self).__init__()
        # TODO: symbol应该为function
        self.functions = functions
        self.code = ''

    def execute(self):
        self.allocate()
        self.start()
        for f in self.functions:
            fe = FunctionEmit(f)
            fe.execute()
            self.emit_code(fe.code)
        self.emit_string()
        self.emit_double()

    def emit_string(self):
        code = ''
        for s in SymbolSystem.strings.symbols:
            # TODO: addr 和 access_name 应该分开
            tag = s.access_name()[1:]
            code += f'{tag}:\n'\
                    f'    .string\t{s.value}\n'
        self.emit_code(code)

    def allocate(self):
        self.allocate_float()
        self.allocate_stack()

    def allocate_float(self):
        # TODO: 待重构
        doubles = SymbolSystem.double_constants()
        for index, d in enumerate(doubles):
            addr = f'FLOAT{index}'
            d.set_access_name(addr)

    def allocate_stack(self):
        # TODO: type.size 待重构
        for func in self.functions:
            # 计算预留空间
            space = 0

            for local in func.locals:
                space += local.type.size
            for tag in func.tags:
                space += tag.type.size
            space += func.call_space
            func.reverse_space = space
            # 为局部变量分配偏移
            sp = space
            for index, local in enumerate(func.locals):
                local.index = index
                size = local.type.size
                sp -= size
                local.offset = sp
            # 为中间变量分配偏移
            for tag in func.tags:
                sp -= tag.type.size
                tag.offset = sp
            # 为函数参数分配偏移
            # +5  要跳过 返回地址，ebp,ebx,esi,edi 寻址到第一个传递过来的值
            offset = 5 * 4
            for p in func.params:
                p.offset = offset
                offset += p.type.size


    def start(self):
        code = '//by latin\n\n'
        self.emit_code(code)

    def emit_double(self):
        doubles = SymbolSystem.double_constants()

        for f in doubles:
            code = ''
            code += f'{f.access_name()}:\n'
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
        self.emit_function_header()
        self.push_stack()
        self.reserve_space()

        for b in self.function.blocks:
            for ir in b.irs:
                self.emit(ir)
        self.pop_stack()

    def emit(self, ir):
        if ir.match(IRKind.CALL):
            self.emit_call(ir)
        elif ir.match(IRKind.ASSIGN):
            self.emit_assign(ir)
        elif ir.match(IRKind.ADD, IRKind.SUB, IRKind.MUL, IRKind.DIV):
            self.emit_arith(ir)
        elif ir.match(IRKind.ADDRESS_OF):
            self.emit_address_of(ir)
        elif ir.match(IRKind.INDIRECTION):
            self.emit_indirection(ir)
        else:
            raise Exception

    def emit_indirection(self, ir):
        dst = ir.destination
        src = ir.operand
        dst_addr = dst.access_name()
        self.emit_load(src, '%eax')
        code = ''
        code += f'    movl\t(%eax), %eax\n'
        code += f'    movl\t%eax, {dst_addr}\n'
        self.emit_code(code)

    def emit_address_of(self, ir):
        dst = ir.destination
        src = ir.operand
        src_addr = src.access_name()
        dst_addr = dst.access_name()
        code = ''
        code += f'    leal\t{src_addr}, %eax\n'
        code += f'    movl\t%eax, {dst_addr}\n'
        self.emit_code(code)

    def emit_arith(self, ir):
        dst = ir.destination
        left = ir.left
        right = ir.right
        dst_addr = dst.access_name()
        right_addr = right.access_name()
        self.emit_load(left, '%eax')
        m = {
            IRKind.ADD: 'addl',
            IRKind.SUB: 'subl',
            IRKind.MUL: 'imull',
            IRKind.DIV: 'divl',
        }
        op = m[ir.kind]
        # TODO: 加一步检测  减少使用eax的指令
        code = ''
        code += f'    {op}\t{right_addr}, %eax\n'
        code += f'    movl\t%eax, {dst_addr}\n'
        self.emit_code(code)

    def emit_call(self, ir):
        # 生成实参分配空间代码
        self.emit_param(ir)
        function_tag = f'_{ir.function.value}'
        code = f'    call\t{function_tag}\n'
        self.emit_code(code)

    def emit_param(self, ir):
        for p in ir.params:
            dst_addr = f'{p.offset}(%esp)'
            self.emit_load(p.parameter, dst_addr)

    def emit_assign(self, ir):
        src = ir.operands[1]
        dst = ir.operands[0]
        dst_addr = dst.access_name()
        self.emit_load(src, dst_addr)

    def emit_load(self, source, destination_addr):
        code = ''
        src_addr = source.access_name()
        dst_addr = destination_addr
        if source.type.match(TypeKind.DOUBLE):
            code += f'    fldl\t{src_addr}\n'
            code += f'    fstpl\t{dst_addr}\n'
        else:
            if source.match(SymbolKind.ID, SymbolKind.TAG):
                code += f'    movl\t{src_addr}, %eax\n'
                src_addr = '%eax'
            code += f'    movl\t{src_addr}, {dst_addr}\n'
        self.emit_code(code)

    def reserve_space(self):
        space = self.function.reverse_space
        code = f'    subl\t${space}, %esp\n'
        self.emit_code(code)
        return

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

    # def emit_template(self, kind, destination, source1, source2=None):
    #     dst = destination.access_name()
    #     src1 = source1.access_name()
    #     src2 = None
    #     if source2 is not None:
    #         src2 = source2.access_name()
    #     m = {
    #         IRKind.ADDRESS_OF:  f'    leal\t{src1}, %eax\n'
    #                             f'    movl\t%eax, {dst}\n',
    #         IRKind.INDIRECTION: f'    movl\t{src1}, %eax\n'
    #                             f'    movl\t(%eax), %eax\n'
    #                             f'    movl\t%eax, {dst}\n',
    #         IRKind.ADD:         f'    movl\t{src1}, %eax\n'
    #                             f'    addl\t{src2}, %eax\n'
    #                             f'    movl\t%eax, {dst}\n',
    #         IRKind.SUB:         f'    movl\t{src1}, %eax\n'
    #                             f'    subl\t{src2}, %eax\n'
    #                             f'    movl\t%eax, {dst}\n',
    #         IRKind.MUL:         f'    movl\t{src1}, %eax\n'
    #                             f'    imull\t{src2}, %eax\n'
    #                             f'    movl\t%eax, {dst}\n',
    #
    #     }
    #     code = m[kind]
    #     self.emit_code(code)
    #
