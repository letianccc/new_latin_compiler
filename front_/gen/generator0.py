from util import *
from AST import *


as_map = {'==' : 'je',
          '!=': 'jne',
          '<' : 'jl',
          '<=': 'jle',
          '>':  'jg',
          '>=': 'jge',
          }
as_reverse_map = {'==' : 'jne',
                  '!=': 'je',
                  '>=' : 'jl',
                  '>': 'jle',
                  '<=':  'jg',
                  '<': 'jge',
                  }

class Function_Gentor:
    ...

class Printf_Gentor:
    def __init__(self, manager, printf_formats):
        self.manager = manager
        self.printf_formats = printf_formats
        self.LC_count = 0
        self.LC_map = dict()
        self.init_LC_map()
        self.init_printf()

    def init_LC_map(self):
        map_ = dict()
        for f in self.printf_formats:
            num = self.LC_count
            map_[f] = '.LC' + str(num)
            self.LC_count += 1
        self.LC_map = map_

    def init_printf(self):
        if len(self.printf_formats) > 0:
            ir = '.section .rodata\n'
            for format_ in self.printf_formats:
                LC_tag = self.LC_tag(format_)
                ir +=  LC_tag + ':\n'\
                    '.string ' + '\"' + \
                    format_.encode("unicode_escape").decode(
                        "utf-8") + '\"' + '\n'
            self.gen_ir(ir)

    def gen_printf(self, node):
        format_ = node.format_
        val = node.value
        ir = ''
        if val:
            addr = self.address(val)
            ir = 'movl ' + addr + ', ' + '%esi' + '\n'
        LC_tag = '$' + self.LC_tag(format_)
        ir += 'movl ' + LC_tag + ', (%esp)\n'\
                   'movl $0, %eax\n'\
                   'call _printf\n'\
                   'movl $0, %eax\n'
        self.gen_ir(ir)

    def address(self, node):
        return self.manager.address(node)

    def LC_tag(self, format_):
        return self.LC_map[format_]

    def gen_ir(self, ir):
        self.manager.gen_ir(ir)

class If_Gentor:
    def __init__(self, manager):
        self.manager = manager

    # jump_style 决定 if false jump 或者 if true jump
    def gen_if(self, node):
        if is_node_type(node.cond, 'Or'):
            then_block = self.new_block()
        else:
            then_block = None
        next_block = self.new_block()
        if node.else_:
            else_block = next_block
            extern_block = self.new_block()
        else:
            extern_block = next_block

        self.gen_cond(node.cond, then_block, next_block)
        self.gen_then(node, then_block, extern_block)
        if node.else_:
            self.gen_else(node, else_block)
        self.gen_block_flag(extern_block)

    def gen_cond(self, node, true_block, false_block):
        jump_style = False
        self.gen_logic(node, true_block, false_block, jump_style)

    def gen_then(self, node, then_block, extern_block):
        if then_block:
            self.gen_block_flag(then_block)
        self.gen(node.then)
        if node.else_:
            self.gen_jump_to_block(extern_block)

    def gen_else(self, node, else_block):
        ir = self.block_flag(else_block)
        self.gen_ir(ir)
        self.gen(node.else_)

    def new_block(self):
        return self.manager.new_block()

    def gen_block_flag(self, block):
        self.manager.gen_block_flag(block)

    def gen(self, node):
        self.manager.gen(node)

    def gen_jump_to_block(self, block):
        self.manager.gen_jump_to_block(block)

    def gen_logic(self, node, true_block, false_block, jump_style):
        self.manager.gen_logic(node, true_block, false_block, jump_style)

    def block_flag(self, block_tag):
        return block_tag + ':' + '\n'

    def gen_ir(self, ir):
        self.manager.gen_ir(ir)

class Logic_Gentor:
    def __init__(self, manager):
        self.manager = manager

    def gen_logic(self, node, true_block, false_block, jump_style):
        if is_node_type(node, 'Or'):
            self.gen_or(node, true_block, false_block, jump_style)
        elif is_node_type(node, 'And'):
            self.gen_and(node, true_block, false_block, jump_style)
        else:
            target = true_block if jump_style else false_block
            self.gen_cmp(node, target, jump_style)

    # 对于or表达式左边的逻辑判断块，如果为True，则跳转到true_block，如果为False,
    # 则会执行or右边的逻辑判断块。
    # 如果or的左子树以及左子树的右子树为And类，则需要产生新的块标签，表示or右边的逻辑块，
    # 并且将传递给子函数的false_block修改为新的块标签，而不是or的false_block
    # 因为And表达式左边如果为False，会执行跳转语句，跳过And右边的代码块，跳转到or右边的代码块。
    # 因此And使用的false_block应该为or右边的代码块
    # 否则，在表达式为False时，or的左边会顺序执行代码，不需要跳转到false_block，
    # 因此将false_block设置为None。
    # and表达式同理。
    def gen_or(self, node, true_block, false_block, jump_style):
        left_jump_style = True
        right_jump_style = jump_style
        left = node.left
        right_of_left = left.right
        need_new_block = is_node_type(left, 'And') \
                        or is_node_type(right_of_left, 'And')
        if need_new_block:
            right_block = self.new_block()
            self.gen_logic(node.left, true_block, right_block, left_jump_style)
            ir = self.block_flag(right_block)
            self.gen_ir(ir)
        else:
            self.gen_logic(node.left, true_block, None, left_jump_style)
        self.gen_logic(node.right, true_block, false_block, right_jump_style)

    def gen_and(self, node, true_block, false_block, jump_style):
        left_jump_style = False
        right_jump_style = jump_style
        left = node.left
        left_right = left.right
        need_new_block = is_node_type(left, 'Or') \
                        or is_node_type(left_right, 'Or')
        if need_new_block:
            right_block = self.new_block()
            self.gen_logic(node.left, right_block, false_block, left_jump_style)
            ir = self.block_flag(right_block)
            self.gen_ir(ir)
        else:
            self.gen_logic(node.left, None, false_block, left_jump_style)
        self.gen_logic(node.right, true_block, false_block, right_jump_style)

    def gen_cmp(self, node, target_block, jump_style):
        self.gen_cmp_stmt(node)
        self.gen_jump(node.operator, target_block, jump_style)

    def gen_cmp_stmt(self, node):
        left = self.gen_expr(node.left)
        ir = 'movl ' + left + ', ' + '%ecx' + '\n'
        self.gen_ir(ir)
        
        right = self.gen_expr(node.right)
        ir = 'cmpl ' + right + ', ' + '%ecx\n'
        self.gen_ir(ir)

    def gen_jump(self, cmp_operator, target_block, jump_style):
        if jump_style == True:
            jmp_ir = as_map[cmp_operator]
        else:
            jmp_ir = as_reverse_map[cmp_operator]
        ir = jmp_ir + ' ' + target_block + '\n'
        self.gen_ir(ir)

    def new_block(self):
        return self.manager.new_block()

    def gen_expr(self, expr):
        return self.manager.gen_expr(expr)

    def gen_ir(self, ir):
        self.manager.gen_ir(ir)

    def block_flag(self, block_tag):
        return block_tag + ':' + '\n'

class While_Gentor:
    def __init__(self, manager):
        self.manager = manager

    def gen_while(self, node):
        cond = self.new_block()
        if is_node_type(node.cond, 'Or'):
            while_block = self.new_block()
        else:
            while_block = None
        extern = self.new_block()

        self.gen_cond_for_while(node.cond, cond, while_block, extern)
        self.gen_while_block(node, cond, while_block)
        self.gen_block_flag(extern)

    def gen_cond_for_while(self, node, cond_block, while_block, extern_block):
        self.gen_block_flag(cond_block)
        jump_style = False
        self.gen_logic(node, while_block, extern_block, jump_style)

    def gen_while_block(self, node, cond_block, while_block):
        if while_block:
            self.gen_block_flag(while_block)
        self.gen(node.suite)
        self.gen_jump_to_block(cond_block)

    def new_block(self):
        return self.manager.new_block()

    def block_flag(self, block_tag):
        return block_tag + ':' + '\n'

    def gen_ir(self, ir):
        self.manager.gen_ir(ir)

    def gen_logic(self, node, true_block, false_block, jump_style):
        self.manager.gen_logic(node, true_block, false_block, jump_style)

    def gen(self, node):
        self.manager.gen(node)

    def gen_block_flag(self, block):
        self.manager.gen_block_flag(block)

    def gen_jump_to_block(self, block):
        self.manager.gen_jump_to_block(block)

class Assign_Gentor:
    def __init__(self, manager):
        self.manager = manager


    def gen_assign(self, node):
        if not is_node_type(node.value, 'Array_'):
            self.assign_variable(node)
        else:
            # 右边是列表实例，进行数组的初始化
            self.init_array(node)

    def assign_variable(self, assign_node):
        var = assign_node.variable
        val = assign_node.value
        val = self.gen_expr(val)
        # 加减乘除返回%eax
        ir = 'movl ' + val + ', ' + '%ecx' + '\n'
        self.gen_ir(ir)
        var_addr = self.address(var)
        ir = 'movl ' + '%ecx' + ', ' + var_addr + '\n'
        self.gen_ir(ir)

    def init_array(self, assign_node):
        array = assign_node.variable
        list_ = assign_node.value
        array_size = int(array.index.name)
        array_name = array.variable.name
        list_ = list_.array
        list_size = len(list_)
        for index in range(array_size):
            addr = self.array_address(array_name, index)
            if index < list_size:
                value = '$' + list_[index]
            else:
                value = '$0'
            ir = 'movl ' + value + ', ' + addr + '\n'
            self.gen_ir(ir)

    def array_address(self, array_name, array_index):
        return self.manager.array_address(array_name, array_index)

    def gen_expr(self, expr):
        return self.manager.gen_expr(expr)

    def gen_ir(self, ir):
        self.manager.gen_ir(ir)

    def address(self, node):
        return self.manager.address(node)

class Expr_Gentor:
    def __init__(self, manager):
        self.manager = manager

    def gen_expr(self, node):
        if is_node_type(node, 'Token'):
            if node.type_ == 'number':
                return '$' + node.name
            elif node.type_ == 'identifier':
                return self.address(node)
        elif is_node_type(node, 'Array'):
            return self.address(node)
        elif is_node_type(node, 'Arith'):
            return self.gen_arith(node)
        elif is_node_type(node, 'Unary'):
            return node.operator + self.gen_expr(node.operand)

    def gen_arith(self, node):
        left = self.gen_expr(node.left)
        right = self.gen_expr(node.right)
        ir1 = 'movl ' + left + ', ' + '%eax\n'
        # ir2 = 'movl ' + right + ', ' + '%ecx\n'

        op = node.operator
        if op == '+':
            op_as = 'addl'
        elif op == '-':
            op_as = 'subl'
        elif op == '*':
            op_as = 'imull'
        elif op == '/':
            op_as = 'idivl'
        # 除法暂时未实现
        # if op == '/':
        #     ir1 = 'movl ' + left + ', ' + '%eax\n'
        #     ir2 = 'cltd\n'
        #     ir3 = 'idivl ' + right + '\n'
        # else:
        ir3 = op_as + ' ' + right + ', %eax\n'


        addr = self.next_tmp_addr()
        ir4 = 'movl %eax, ' + addr + '\n'
        ir = ir1  + ir3 + ir4
        self.gen_ir(ir)
        return addr

    def gen_ir(self, ir):
        self.manager.gen_ir(ir)

    def next_tmp_addr(self):
        return self.manager.next_tmp_addr()

    def address(self, node):
        return self.manager.address(node)

class Symbol_Manager:
    def __init__(self, manager, symbols, symbol_count, ident_count, has_array):
        self.manager = manager
        self.has_array = has_array
        self.symbols = symbols
        self.symbol_map = dict()
        self.symbol_count = symbol_count
        self.ident_count = ident_count
        self.index = self.symbol_count
        self.tmp_count = self.tmp_symbol_start_index()
        self.init_symbol_map()

    def init_symbol_map(self):
        map_ = dict()
        index = self.ident_start_index()
        for s in self.symbols:
            if is_node_type(s, 'Array'):
                array_name = s.variable.name
                array_amount = int(s.index.name)
                map_[array_name] = index
                index -= array_amount
            else:
                var = s.name
                map_[var] = index
                index -= 1
        self.symbol_map = map_

    def gen_reserve_memory(self):
        if self.has_array:
            c = self.symbol_count + 2
        else:
            c = self.symbol_count
        space = '$' + str(c * 4)
        ir = 'subl ' + space + ', %esp' + '\n'
        self.gen_ir(ir)

    def tmp_symbol_start_index(self):
        tmp_count = self.symbol_count - self.ident_count
        if self.has_array:
            return tmp_count + 2
        else:
            return tmp_count

    def ident_start_index(self):
        if self.has_array:
            return self.symbol_count + 2
        else:
            return self.symbol_count

    def array_address(self, array_name, array_index):
        index = self.symbol_map[array_name]
        index -= array_index
        return self.address_by_index(index)

    def address_by_index(self, index):
        return '-' + str(index * 4) + '(%ebp)'

    def address(self, identifier):
        ident = identifier
        if is_node_type(ident, 'Array'):
            name = ident.variable.name
            index = ident.index
            if self.is_num(index):
                index = int(index.name)
            else:
                # var_index = self.symbol_map[index]
                # var_addr = self.address_by_index(var_index)
                var_addr = self.gen_expr(index)
                ir = 'movl ' + var_addr + ', %ecx\n'
                ir += 'cltq\n'
                self.gen_ir(ir)
                array = self.symbol_map[name]
                addr = '-' + str(array*4) + '(%ebp, %ecx, 4)'
                return addr
            array_sym_id = self.symbol_map[name]
            ident_id = array_sym_id - index
            addr = self.address_by_index(ident_id)
        else:
            n = ident.name
            index = self.symbol_map[n]
            addr = self.address_by_index(index)
        return addr

    def gen_ir(self, ir):
        self.manager.gen_ir(ir)

    def next_tmp_addr(self):
        index = self.tmp_count
        self.tmp_count -= 1
        addr = self.address_by_index(index)
        return addr

    def is_num(self, node):
        if is_node_type(node, 'Token'):
            if node.type_ == 'number':
                return True
        return False

    def gen_expr(self, expr):
        return self.manager.gen_expr(expr)

class Generator_as1:
    def __init__(self, parser):
        self.ir = ''

        self.ast = parser.AST
        self.has_array = parser.has_array
        # self.has_printf = parser.has_printf
        # self.symbol_map = dict()

        # self.symbols = parser.symbols
        # self.printf_formats = parser.printf_formats
        # self.LC_count = 0
        # self.symbol_count = parser.symbol_count
        # self.ident_count = parser.ident_count
        # self.index = self.symbol_count
        # self.tmp_count = self.tmp_symbol_start_index()

        # self.line_count = 1
        self.block_count = 1
        # self.init_map()

        self.symbol_manager = Symbol_Manager(self, parser.symbols, parser.symbol_count, parser.ident_count, parser.has_array)
        self.expr_gentor = Expr_Gentor(self)
        self.printf_gentor = Printf_Gentor(self, parser.printf_formats)
        self.logic_gentor = Logic_Gentor(self)
        self.if_gentor = If_Gentor(self)
        self.While_gentor = While_Gentor(self)
        self.assign_gentor = Assign_Gentor(self)

    def gen(self, node):
        if type(node) is FunctionNode:
            ir = f'.text\n.global _{node.name.name}\n_{node.name.name}:\n'
            ir +=   'pushl %ebp\n'\
                    'pushl %ebx\n'\
                    'pushl %esi\n'\
                    'pushl %edi\n'\
                    'movl %esp, %ebp\n'

            if node.param is not None:
                raise Exception
            self.gen_ir(ir)
            self.gen(node.stmts)
            ir = ''
            if node.name.name == 'main':
                ir += 'call _getchar\n'
            ir +=   'movl %ebp, %esp\n'\
                    'popl %edi\n'\
                	'popl %esi\n'\
                	'popl %ebx\n'\
                	'popl %ebp\n'\
                    'ret\n'

            self.gen_ir(ir)
        elif type(node) is CallNode:
            ir = f'call _{node.function.name}\n'
            self.gen_ir(ir)

        if is_node_type(node, 'Seq'):
            self.gen(node.stmt)
            self.gen(node.next_stmt)
        elif is_node_type(node, 'DeclNode'):
            self.gen_decl(node)
        elif is_node_type(node, 'Assign'):
            gentor = self.assign_gentor
            gentor.gen_assign(node)
        elif is_node_type(node, 'If'):
            gentor = self.if_gentor
            gentor.gen_if(node)
        elif is_node_type(node, 'While'):
            gentor = self.While_gentor
            gentor.gen_while(node)
        elif is_node_type(node, 'Printf'):
            gentor = self.printf_gentor
            gentor.gen_printf(node)
        elif node is None:
            return None

    def gen_expr(self, node):
        return self.expr_gentor.gen_expr(node)

    def gen_logic(self, node, true_block, false_block, jump_style):
        self.logic_gentor.gen_logic(node, true_block, false_block, jump_style)

    def gen_decl(self, node):
        pass

    def array_address(self, array_name, array_index):
        return self.symbol_manager.array_address(array_name, array_index)

    def gen_ir(self, ir):
        self.ir += ir


    def gen_test_ir(self):
        self.symbol_manager.gen_reserve_memory()
        if self.has_array:
            self.gen_array_start()
        self.gen(self.ast)
        if self.has_array:
            self.array_end()

    def gen_executable_ir(self):
        funcs = self.ast
        for f in funcs:
            if self.has_array:
                self.gen_array_start()
            self.gen(f)
            if self.has_array:
                self.array_end()
        # self.init_ir()
        # self.symbol_manager.gen_reserve_memory()
        # if self.has_array:
        #     self.gen_array_start()
        # self.gen(self.ast)
        # if self.has_array:
        #     self.array_end()
        # self.gen_end()

    def init_ir(self):
        ir = '.text\n'\
                  '.globl _main\n'\
                  ''\
                  '_main:\n'\
                  'push %ebp\n'\
                  'movl	%esp, %ebp\n'
        ir = '.text\n'\
            '.globl _main\n'\
            ''\
            '_main:\n'\
            'push %ebp\n'\
            'movl	%esp, %ebp\n'
        self.gen_ir(ir)

    def gen_array_start(self):
        ir = 'movl %fs:40, %eax\n'\
        	 'movl %eax, -8(%ebp)\n'\
        	 'xorl %eax, %eax\n'
        self.gen_ir(ir)

    def array_end(self):
        block = self.new_block()
        flag = self.block_flag(block)
        ir = 'movl -8(%ebp), %edx\n'\
        	 'xorq %fs:40, %edx\n'\
         	 'je	' + block + '\n'\
        	 'call __stack_chk_fail\n' + \
             flag
        self.gen_ir(ir)

    def gen_end(self):
        ir = 'call _getchar\nleave\n'\
           'ret\n'\

        self.gen_ir(ir)

    def gen_block_flag(self, block_tag):
        ir = self.block_flag(block_tag)
        self.gen_ir(ir)

    def gen_jump_to_block(self, block_tag):
        ir = 'jmp ' + block_tag + '\n'
        self.gen_ir(ir)

    def next_tmp_addr(self):
        return self.symbol_manager.next_tmp_addr()

    def address(self, node):
        return self.symbol_manager.address(node)

    def new_block(self):
        c = self.block_count
        self.block_count += 1
        block_tag = '.L' + str(c)
        return block_tag

    def block_flag(self, block_tag):
        return block_tag + ':' + '\n'
