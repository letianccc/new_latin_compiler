
from front_.myenum import *
from front_.util import *
from front_.symbol_system import *
from front_.memory import *
from front_.reg_system import *

class Emit(object):
    """docstring for Emit."""

    def __init__(self, functions):
        super(Emit, self).__init__()
        # TODO: symbol应该为function
        self.functions = functions
        self.code = ''

    def execute(self):
        self.allocate()
        for f in self.functions:
            fe = FunctionEmit(f)
            fe.execute()
            self.emit_code(fe.code)
        self.emit_string()
        self.emit_double()
        if self.code == '':
            return
        else:
            self.code = '//by latin\n\n' + self.code

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
            # 计算call最大使用空间
            max_space = 0
            for node in func.call_nodes:
                s = self.call_space(node)
                if s > max_space:
                    max_space = s

            space += max_space
            func.reverse_space = space
            # 为局部变量分配偏移
            sp = space
            for index, local in enumerate(func.locals):
                local.index = index
                size = local.type.size
                sp -= size
                name = f'{sp}(%esp)'
                local.set_access_name(name)
                # local.offset = sp
            # 为中间变量分配偏移
            for tag in func.tags:
                sp -= tag.type.size
                tag.offset = sp
            # 为函数参数分配偏移
            # +5  要跳过 返回地址，ebp,ebx,esi,edi 寻址到第一个传递过来的值
            offset = 5 * 4
            for p in func.params:
                # p.offset = offset
                name = f'{offset}(%ebp)'
                p.set_access_name(name)
                offset += p.type.size
            # 为call指令参数分配空间

            for node in func.call_nodes:
                offset = 0
                for p in reversed(node.params):
                    p.offset = offset
                    name = f'{offset}(%esp)'
                    p.set_access_name(name)
                    size = p.parameter.type.size
                    offset += size

    def call_space(self, call_node):
        # 计算调用最多需要预留的栈空间
        space = 0
        callee = call_node.call_function
        int_size = TypeSystem.INT.size
        for p in call_node.params:
            psize = p.parameter.type.size
            if callee.is_extern:
                # printf参数占8位或4位
                size = max(int_size, psize)
            else:
                size = psize
            space += size
        return space
        # current = self.function.call_space
        # self.function.call_space = max(space, current)

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
        if ir.match(OperatorKind.CALL):
            self.emit_call(ir)
        elif ir.match(OperatorKind.ASSIGN):
            self.emit_assign(ir)
        elif ir.match(OperatorKind.ADD, OperatorKind.SUB, OperatorKind.MUL, OperatorKind.DIV):
            self.emit_arith(ir)
        elif ir.match(OperatorKind.ADDRESS_OF):
            self.emit_address_of(ir)
        elif ir.match(OperatorKind.INDIRECTION):
            self.emit_indirection(ir)
        elif ir.match(OperatorKind.RETURN):
            self.emit_return(ir)
        elif ir.match(OperatorKind.INDIRECTION_ASSIGN):
            self.emit_indirect_assign(ir)
        elif ir.match(OperatorKind.CAST):
            self.emit_cast(ir)

        else:
            raise Exception

    def emit_indirect_assign(self, ir):
        src = ir.src
        dst = ir.dst
        # dst的类型总是POINTER
        assert dst.type.match(TypeSystem.POINTER)
        eax = RegSystem.reg(RegKind.AX, dst.type.size)
        dx = RegSystem.reg(RegKind.DX, src.type.size)
        self.emit_mov(dst, eax)
        self.emit_mov(src, dx)
        dx_addr = dx.access_name()
        self.emit_mov_value(dx_addr, '(%eax)', dx.type, dst.sub_type())

    def emit_indirection(self, ir):
        # TODO: src的类型未知  可能是short
        dst = ir.destination
        src = ir.operand
        assert src.type.match(TypeSystem.POINTER)
        dst_addr = dst.access_name()
        eax = RegSystem.reg(RegKind.AX, src.type.size)
        self.emit_mov(src, eax)
        pos = '(%eax)'
        target = MemorySystem.new(pos, dst.type)
        self.emit_mov(target, eax)
        self.emit_mov(eax, dst)

    def emit_address_of(self, ir):
        dst = ir.destination
        src = ir.operand
        assert dst.type.match(TypeSystem.POINTER)
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

        if left.type.match(TypeSystem.DOUBLE) or right.type.match(TypeSystem.DOUBLE):
            left_addr = left.access_name()
            right_addr = right.access_name()
            dst_addr = dst.access_name()
            m = {
                OperatorKind.ADD: 'faddl',
                OperatorKind.SUB: 'fsubl',
                OperatorKind.MUL: 'fmull',
                OperatorKind.DIV: 'divl',
            }
            op = m[ir.kind]
            code = f'    fldl\t{left_addr}\n'\
                   f'    {op}\t{right_addr}\n'\
                   f'    fstpl\t{dst_addr}\n'
            self.emit_code(code)
            return
        reg_size = 4
        eax = RegSystem.reg(RegKind.AX, reg_size)
        edx = RegSystem.reg(RegKind.DX, reg_size)
        self.emit_mov(left, eax)
        self.emit_mov(right, edx)
        m = {
            OperatorKind.ADD: 'addl',
            OperatorKind.SUB: 'subl',
            OperatorKind.MUL: 'imull',
            OperatorKind.DIV: 'divl',
        }
        op = m[ir.kind]
        code = f'    {op}\t%edx, %eax\n'
        self.emit_code(code)
        self.emit_mov(eax, dst)

    def emit_call(self, ir):
        self.emit_params(ir)
        function_tag = f'_{ir.function.value}'
        code = f'    call\t{function_tag}\n'
        self.emit_code(code)

    def emit_params(self, ir):
        space = 0
        for p in ir.params:
            dst_type = TypeSystem.max_type(p.type, TypeSystem.INT)
            space += dst_type.size
        offset = space
        for p in ir.params:
            src = p
            dst_type = TypeSystem.max_type(src.type, TypeSystem.INT)
            offset -= dst_type.size
            pos = f'{offset}(%esp)'
            # pos = p.access_name()
            dst = MemorySystem.new(pos, dst_type)
            # ir = AssignIR(dst, src)
            # self.gen_ir(ir)
            if src.type.match(TypeSystem.DOUBLE) or dst.type.match(TypeSystem.DOUBLE):
                self.emit_mov(src, dst)
            else:
                reg_size = 4
                eax = RegSystem.reg(RegKind.AX, reg_size)
                self.emit_mov(src, eax)
                self.emit_mov(eax, dst)
            # offse t += dst_type.size


    def emit_assign(self, ir):
        src = ir.operands[1]
        dst = ir.operands[0]
        if src.type.match(TypeSystem.DOUBLE) or dst.type.match(TypeSystem.DOUBLE):
            self.emit_mov(src, dst)
        else:
            reg_size = 4
            eax = RegSystem.reg(RegKind.AX, reg_size)
            self.emit_mov(src, eax)
            self.emit_mov(eax, dst)

    def emit_return(self, ir):
        reg_size = 4
        src = ir.operand
        eax = RegSystem.reg(RegKind.AX, reg_size)
        self.emit_mov(src, eax)

    def emit_cast(self, ir):
        dst = ir.destination
        src = ir.source
        if SymbolSystem.is_numeric(src):
            self.emit_mov(src, dst)
        else:
            size = dst.type.size
            eax = RegSystem.reg(RegKind.AX, size)
            self.emit_mov(src, eax)
            self.emit_mov(eax, dst)

    def emit_mov(self, source, destination):
        src = source.access_name()
        dst = destination.access_name()
        src_type = source.type
        dst_type = destination.type
        self.emit_mov_value(src, dst, src_type, dst_type)

    def emit_mov_value(self, source_address, destination_address, src_type, dst_type):
        src = source_address
        dst = destination_address

        if src_type.match(TypeSystem.DOUBLE) or dst_type.match(TypeSystem.DOUBLE):
            code = ''
            code += f'    fldl\t{src}\n'
            code += f'    fstpl\t{dst}\n'

        elif src_type.size == 4 and dst_type.size == 4:
            code = f'    movl\t{src}, {dst}\n'
        elif src_type.match(TypeSystem.SHORT) and dst_type.size == 4:
            code = f'    movswl\t{src}, {dst}\n'
        elif dst_type.match(TypeSystem.SHORT):
            if src == '%eax':
                src = '%ax'
            if src == '%edx':
                src = '%dx'
            code = f'    movw\t{src}, {dst}\n'
        else:
            raise Exception
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
    #         OperatorKind.ADDRESS_OF:  f'    leal\t{src1}, %eax\n'
    #                             f'    movl\t%eax, {dst}\n',
    #         OperatorKind.INDIRECTION: f'    movl\t{src1}, %eax\n'
    #                             f'    movl\t(%eax), %eax\n'
    #                             f'    movl\t%eax, {dst}\n',
    #         OperatorKind.ADD:         f'    movl\t{src1}, %eax\n'
    #                             f'    addl\t{src2}, %eax\n'
    #                             f'    movl\t%eax, {dst}\n',
    #         OperatorKind.SUB:         f'    movl\t{src1}, %eax\n'
    #                             f'    subl\t{src2}, %eax\n'
    #                             f'    movl\t%eax, {dst}\n',
    #         OperatorKind.MUL:         f'    movl\t{src1}, %eax\n'
    #                             f'    imull\t{src2}, %eax\n'
    #                             f'    movl\t%eax, {dst}\n',
    #
    #     }
    #     code = m[kind]
    #     self.emit_code(code)
    #
