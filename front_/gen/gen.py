
from ..AST import *
from ..token import Token
from ..config import *

class NewGen:
    def __init__(self, parser):
        self.ast = parser.AST
        self.printf_formats = parser.printf_formats
        self.LC_count = 0
        self.blocks = [Block()]
        self.blockId = 0
        self.symbol_table = list()
        self.symbol_map = dict()
        self.symbol_count = 0
        self.gen(self.ast)

    def gen(self, node):
        if is_node_type(node, 'Seq'):
            self.gen(node.stmt)
            self.gen(node.next_stmt)
        elif is_node_type(node, 'Decl'):
            self.gen_decl(node)
        elif is_node_type(node, 'Assign'):
            self.gen_assign(node)
        elif is_node_type(node, 'If'):
            self.gen_if(node)
        elif is_node_type(node, 'While'):
            self.gen_while(node)
        elif node is None:
            return None
        elif is_node_type(node, 'Printf'):
            self.gen_printf(node)
        else:
            raise Exception

    def gen_printf(self, node):
        ir = PrintIR()
        ir.format = node.format_
        # ir.value = node.value
        ir.value = self.symbol_map[node.value.name]
        self.gen_ir(ir)

    def gen_while(self, node):
        if not self.is_new_block():
            self.push_block(Block())
        cond_block = self.cur_block()
        true_block = Block()
        next_block = Block()
        self.gen_branch(node.cond, true_block, next_block)
        self.push_block(true_block)
        self.gen(node.suite)
        self.gen_goto(cond_block)
        self.push_block(next_block)



    def is_new_block(self):
        b = self.cur_block()
        return len(b.irs) == 0

    def gen_if(self, node):
        if node.else_ is None:
            true_block = Block()
            next_block = Block()
            self.gen_branch(node.cond, true_block, next_block)
            self.push_block(true_block)
            self.gen(node.then)
            self.push_block(next_block)
        else:
            true_block = Block()
            false_block = Block()
            next_block = Block()
            self.gen_branch(node.cond, true_block, false_block)
            self.push_block(true_block)
            self.gen(node.then)
            self.gen_goto(next_block)
            self.push_block(false_block)
            self.gen(node.else_)
            self.push_block(next_block)

    # if a:
    #   true_block
    # false_block
    def gen_branch(self, expr, true_block, false_block):
        self.translate_not(expr)

        if expr.operator == '||':
            right_block = Block()
            self.gen_branch(expr.left, true_block, right_block)
            self.push_block(right_block)
            self.gen_branch(expr.right, true_block, false_block)
        elif expr.operator == '&&':
            right_block = Block()
            self.gen_branch(self.translate_not(expr.left), false_block, right_block)
            self.push_block(right_block)
            self.gen_branch(expr.right, true_block, false_block)
        else:
            left = self.gen_expr(expr.left)
            right = self.gen_expr(expr.right)
            self.gen_expr_inst('branch', expr.operator, left, right, false_block)

    def gen_expr_inst(self, kind, operator, left_tmp, right_tmp, jump_block):
        ir = BranchIR()
        ir.kind = kind
        ir.op = operator
        ir.operands[0] = left_tmp
        ir.operands[1] = right_tmp
        ir.target = jump_block
        self.gen_ir(ir)

    def gen_goto(self, target):
        self.gen_expr_inst('branch', None, None, None, target)


    def translate_not(self, expr):
        if not is_node_type(expr, 'Expr'):
            return
        op = not_map.get(expr.operator)
        if op is not None:
            expr.operator = op
        self.translate_not(expr.left)
        self.translate_not(expr.right)




    def push_block(self, block):
        self.blocks.append(block)

    def gen_decl(self, node):
        token = node.variable
        name = token.name
        self.symbol_table.append(name)
        t = self.new_temp()
        self.symbol_map[name] = t

    def new_temp(self):
        t = Symbol()
        t.kind = 'TMP'
        t.index = self.symbol_count
        self.symbol_count += 1

        return t

    def gen_assign(self, node):
        name = node.variable.name
        left = self.symbol_map[name]
        right = self.gen_expr(node.value)
        ir = AssignIR()
        ir.kind = node.__class__.__name__
        ir.operands[0] = left
        ir.operands[1] = right
        self.gen_ir(ir)

    def gen_ir(self, ir):
        b = self.cur_block()
        b.irs.append(ir)

    def cur_block(self):
        return self.blocks[-1]

    def gen_expr(self, node):
        if is_node_type(node, 'Token'):
            if node.type_ == 'number':
                s = Symbol()
                s.kind = 'number'
                s.token = node
                return s
            elif node.type_ == 'identifier':
                t = self.symbol_map[node.name]
                return t
        elif is_node_type(node, 'Arith') or \
                is_node_type(node, 'And') or \
                is_node_type(node, 'Or') or \
                is_node_type(node, 'Rel') or \
                is_node_type(node, 'Equal') or \
                is_node_type(node, 'Expr'):
            left = self.gen_expr(node.left)
            right = self.gen_expr(node.right)
            tmp = self.new_temp()
            ir = ExprIR()
            ir.op = node.operator
            ir.result = tmp
            ir.left = left
            ir.right = right

            self.gen_ir(ir)

            # t = 't' + str(self.symbol_count)
            # line = 'L' + str(self.line_count) + ': '
            # ir = line + t + ' = ' + left + ' ' + node.operator + ' ' + right + '\n'
            # self.ir += ir
            # self.symbol_count += 1
            # self.line_count += 1
            return tmp
        elif is_node_type(node, 'Unary'):
            raise Exception
            return node.operator + self.gen_expr(node.operand)


class Emit:
    def __init__(self, gener):
        self.blocks = gener.blocks
        self.symbol_count = gener.symbol_count
        self.LC_map = dict()
        self.printf_formats = gener.printf_formats
        self.LC_count = 0
        self.code = ''
        self.sp_offset = -gener.symbol_count * 4
        self.init()
        self.emit()

    def init(self):
        self.init_LC_map()


    def emit(self):
        if len(self.printf_formats) > 0:
            self.init_printf()
        self.init_as()
        self.emit_reserve_memory()
        # if self.has_array:
        #     self.gen_array_start()
        self.emit_as('\n\n')
        self.emit_blocks()
        self.emit_as('\n\n')
        # if self.has_array:
        #     self.array_end()
        self.emit_end()

    def emit_cmp(self, target, other):
        self.movl(self.address(target.index), '%eax')
        code = 'cmp {other}, {target}\n'.format(other=other.emit(self), target='%eax')
        self.emit_as(code)

    def emit_jmp(self, operator, target):
        jmp_kind = jmp_map[operator]
        code = '{jmp} .B{target}\n'.format(jmp=jmp_kind, target=target.id)
        self.emit_as(code)

    def emit_expr(self, operator, left, right, result):
        self.movl(self.address(left), '%eax')
        op = expr_map[operator]

        code = '{op} {right}, %eax\n'.format(op=op, right=right.emit(self))
        self.emit_as(code)
        self.movl('%eax', self.address(result))

    def emit_end(self):
        ir = 'leave\n'\
           'ret\n'\
           '.size	main, .-main\n'\
           '.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.6) 5.4.0 20160609"\n'\
           '.section	.note.GNU-stack,"",@progbits\n'
        self.emit_as(ir)

    def emit_reserve_memory(self):
        # if self.has_array:
        #     c = self.symbol_count + 2
        # else:
        #     c = self.symbol_count
        c = self.symbol_count
        space = '$' + str(c * 4)
        ir = 'subl ' + space + ', %esp' + '\n'
        self.emit_as(ir)

    def init_printf(self):
        ir = '.section .rodata\n'
        for format_ in self.printf_formats:
            LC_tag = self.LC_tag(format_)
            ir +=  LC_tag + ':\n'\
                '.string ' + '\"' + format_ + '\"' + '\n'
        self.emit_as(ir)

    def LC_tag(self, format_):
        return self.LC_map[format_]

    def init_LC_map(self):
        map_ = dict()
        for f in self.printf_formats:
            num = self.LC_count
            map_[f] = '.LC' + str(num)
            self.LC_count += 1
        self.LC_map = map_

    def init_as(self):
        ir = '.text\n'\
                  '.globl main\n'\
                  ''\
                  'main:\n'\
                  'push %ebp\n'\
                  'movl	%esp, %ebp\n'
        self.emit_as(ir)

    def emit_blocks(self):
        while len(self.blocks) > 0:
            b = self.get_block()
            code = '.B{block}:\n'.format(block=b.id)
            self.emit_as(code)
            for ir in b.irs:
                # log(ir)
                ir.emit(self)

    def movl(self, src, dst):
        code = 'movl {src}, {dst}\n'.format(src=src, dst=dst)
        self.emit_as(code)

    def emit_as(self, code):
        self.code += code

    def address(self, symbol):
        if type(symbol) == int:
            index = symbol
        elif symbol.kind == 'number':
            index = int(symbol.token.name)
        else:
            index = symbol.index

        o = self.sp_offset + index * 4
        a = '{offset}(%ebp)'.format(offset=o)
        return a





    def get_block(self):
        return self.blocks.pop(0)
