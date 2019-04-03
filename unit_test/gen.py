from lexer_ import Lexer
from parser_ import Parser
from generator import Generator, Generator_as
from util import *

i = 0
all_ = True

def test_gen():
    code = '{{{int a;a=2;}}}'
    test_ir = 'L1: t0 = 2\n' \
              'L2: End\n'
    test(code, test_ir)

    code = '{int a;a=-2;int b;b=4;}'
    test_ir = 'L1: t0 = -2\n' \
              'L2: t1 = 4\n' \
              'L3: End\n'
    test(code, test_ir)

    code = '{int a; a=-2; int b; b=4; a = a + a * (2 + 3) - b - a / 4 + b + 5 / (a + 3) + 5;}'
    test_ir = 'L1: t0 = -2\n'          \
              'L2: t1 = 4\n'          \
              'L3: t2 = 2 + 3\n'      \
              'L4: t3 = t0 * t2\n'    \
              'L5: t4 = t0 + t3\n'    \
              'L6: t5 = t4 - t1\n'    \
              'L7: t6 = t0 / 4\n'     \
              'L8: t7 = t5 - t6\n'    \
              'L9: t8 = t7 + t1\n'    \
              'L10: t9 = t0 + 3\n'    \
              'L11: t10 = 5 / t9\n'   \
              'L12: t11 = t8 + t10\n' \
              'L13: t12 = t11 + 5\n'  \
              'L14: t0 = t12\n'       \
              'L15: End\n'
    test(code, test_ir)

    code = '{int a; a=2; int c; c = a < 1;}'
    test_ir = 'L1: t0 = 2\n'        \
              'L2: t2 = t0 < 1\n'   \
              'L3: t1 = t2\n'       \
              'L4: End\n'
    test(code, test_ir)

    code = '{int a; a=2; int c; c = !(a < 1 && a>2);}'
    test_ir = 'L1: t0 = 2\n'        \
              'L2: t2 = t0 < 1\n'   \
              'L3: t3 = t0 > 2\n'   \
              'L4: t4 = t2 && t3\n'   \
              'L5: t1 = !t4\n'       \
              'L6: End\n'
    test(code, test_ir)

    code = '{int a; a=2; int b; b=4; int c; ' \
           'c = a < 1 || b > 2 && a <= 3 || !(a >= 2 || b < 3) && b < 2;}'
    test_ir = 'L1: t0 = 2\n'             \
              'L2: t1 = 4\n'             \
              'L3: t3 = t0 < 1\n'        \
              'L4: t4 = t1 > 2\n'        \
              'L5: t5 = t0 <= 3\n'        \
              'L6: t6 = t4 && t5\n'      \
              'L7: t7 = t3 || t6\n'      \
              'L8: t8 = t0 >= 2\n'        \
              'L9: t9 = t1 < 3\n'        \
              'L10: t10 = t8 || t9\n'    \
              'L11: t11 = t1 < 2\n'      \
              'L12: t12 = !t10 && t11\n'  \
              'L13: t13 = t7 || t12\n'   \
              'L14: t2 = t13\n'          \
              'L15: End\n'
    test(code, test_ir)

    code = '{int a; a=2; int b; b=4; int c; ' \
           'if(a < 1 || b > 2 && a <= 3 || (a >= 2 || b != 3) && b == 2)c=2;else c=3;}'
    test_ir = 'L1: t0 = 2\n'             \
              'L2: t1 = 4\n'             \
              'L3: t3 = t0 < 1\n'        \
              'L4: t4 = t1 > 2\n'        \
              'L5: t5 = t0 <= 3\n'        \
              'L6: t6 = t4 && t5\n'      \
              'L7: t7 = t3 || t6\n'      \
              'L8: t8 = t0 >= 2\n'        \
              'L9: t9 = t1 != 3\n'        \
              'L10: t10 = t8 || t9\n'    \
              'L11: t11 = t1 == 2\n'      \
              'L12: t12 = t10 && t11\n'  \
              'L13: t13 = t7 || t12\n'   \
              'L14: if t13 is false goto L17\n' \
              'L15: t2 = 2\n'                 \
              'L16: goto L18\n'                \
              'L17: t2 = 3\n'                 \
              'L18: End\n'
    test(code, test_ir)

    code = '{int a;a=1;if(a==1)a=2;else a=3;}'
    test_ir =  'L1: t0 = 1\n'                 \
               'L2: t1 = t0 == 1\n'           \
               'L3: if t1 is false goto L6\n' \
               'L4: t0 = 2\n'                 \
               'L5: goto L7\n'                \
               'L6: t0 = 3\n'                 \
               'L7: End\n'
    test(code, test_ir)

    code = '{int a;a=1;if(a==1){a=2;}else{a=3;}}'
    test_ir =  'L1: t0 = 1\n'                 \
               'L2: t1 = t0 == 1\n'           \
               'L3: if t1 is false goto L6\n' \
               'L4: t0 = 2\n'                 \
               'L5: goto L7\n'                \
               'L6: t0 = 3\n'                 \
               'L7: End\n'
    test(code, test_ir)

    code = '{int a;a=1;if(a==1)a=2;}'
    test_ir =  'L1: t0 = 1\n'                 \
               'L2: t1 = t0 == 1\n'           \
               'L3: if t1 is false goto L6\n' \
               'L4: t0 = 2\n'                 \
               'L5: goto L6\n'                \
               'L6: End\n'
    test(code, test_ir)

    code = '{int a;a=1;if(a==1){a=2;}}'
    test_ir =  'L1: t0 = 1\n'                 \
               'L2: t1 = t0 == 1\n'           \
               'L3: if t1 is false goto L6\n' \
               'L4: t0 = 2\n'                 \
               'L5: goto L6\n'                \
               'L6: End\n'
    test(code, test_ir)

    code = '{int a;a=4;while(a>0)a=a-1;}'
    test_ir =  'L1: t0 = 4\n'                 \
               'L2: t1 = t0 > 0\n'           \
               'L3: if t1 is false goto L7\n' \
               'L4: t2 = t0 - 1\n'                 \
               'L5: t0 = t2\n'                 \
               'L6: goto L2\n'                \
               'L7: End\n'
    test(code, test_ir)

    code = '{int a;a=4;while(a>0){a=a-1;}}'
    test_ir =  'L1: t0 = 4\n'                 \
               'L2: t1 = t0 > 0\n'           \
               'L3: if t1 is false goto L7\n' \
               'L4: t2 = t0 - 1\n'                 \
               'L5: t0 = t2\n'                 \
               'L6: goto L2\n'                \
               'L7: End\n'
    test(code, test_ir)

def test_as():
    code = '{int a;a=2;}'
    test_ir = 'movl $2, %eax\n' \
              'movl %eax, -4(%ebp)\n'
    test1(code, test_ir)

    code = '{int a;a=2;int b; b=4;}'
    test_ir = 'movl $2, %eax\n' \
              'movl %eax, -8(%ebp)\n' \
              'movl $4, %eax\n' \
              'movl %eax, -4(%ebp)\n'
    test1(code, test_ir)

    code = '{int b;b=2;int a[5];a[b]=4;printf("%d\\n",a[2]);}'
    test_ir = '.section .rodata\n' \
              '.LC0:\n'\
              '.string "%d\\n"\n'\
              'subl $32, %esp\n'\
              'movl %fs:40, %eax\n'\
              'movl %eax, -8(%ebp)\n'\
              'xorl %eax, %eax\n'\
              'movl $2, %eax\n'\
              'movl %eax, -32(%ebp)\n'\
              'movl -32(%ebp), %ecx\n'\
              'cltq\n'\
              'movl $4, %eax\n'\
              'movl %eax, -28(%ebp, %edx, 4)\n'\
              'movl -20(%ebp), %esi\n'\
              'movl $.LC0, %edi\n'\
              'movl $0, %eax\n'\
              'call printf\n'\
              'movl $0, %eax\n'\
              'movl -8(%ebp), %edx\n'\
              'xorq %fs:40, %edx\n'\
              'je	.L1\n'\
              'call __stack_chk_fail\n'\
              '.L1:\n'
    # test1(code, test_ir)

    code = '{int b;b=2;int a[5];a[b+1]=4;printf("%d\\n",a[3]);}'
    test_ir = '.section .rodata\n' \
              '.LC0:\n'\
              '.string "%d\\n"\n'\
              'subl $36, %esp\n'\
              'movl %fs:40, %eax\n'\
              'movl %eax, -8(%ebp)\n'\
              'xorl %eax, %eax\n'\
              'movl $2, %eax\n'\
              'movl %eax, -36(%ebp)\n'\
              'movl -36(%ebp), %eax\n'\
              'movl $1, %ecx\n'\
              'addl %ecx, %eax\n'\
              'movl %eax, -12(%ebp)\n'\
              'movl -12(%ebp), %ecx\n'\
              'cltq\n'\
              'movl $4, %eax\n'\
              'movl %eax, -32(%ebp, %edx, 4)\n'\
              'movl -20(%ebp), %esi\n'\
              'movl $.LC0, %edi\n'\
              'movl $0, %eax\n'\
              'call printf\n'\
              'movl $0, %eax\n'\
              'movl -8(%ebp), %edx\n'\
              'xorq %fs:40, %edx\n'\
              'je	.L1\n'\
              'call __stack_chk_fail\n'\
              '.L1:\n'
    # test1(code, test_ir)


    code = '{int a[5]; a[5] = {1,2};' \
           'printf("%d\\n",a[0]);' \
           'printf("%d\\n",a[1]);' \
           'printf("%d\\n",a[2]);' \
           'printf("%d\\n",a[3]);' \
           'printf("%d\\n",a[4]);}'
    test_ir = '.section .rodata\n' \
              '.LC0:\n'\
              '.string "%d\\n"\n'\
              'subl $28, %esp\n'\
              'movl %fs:40, %eax\n'\
              'movl %eax, -8(%ebp)\n'\
              'xorl %eax, %eax\n'\
              'movl $1, -28(%ebp)\n'\
              'movl $2, -24(%ebp)\n'\
              'movl $0, -20(%ebp)\n'\
              'movl $0, -16(%ebp)\n'\
              'movl $0, -12(%ebp)\n'\
              'movl -28(%ebp), %esi\n'\
              'movl $.LC0, %edi\n'\
              'movl $0, %eax\n'\
              'call printf\n'\
              'movl $0, %eax\n'\
              'movl -24(%ebp), %esi\n'\
              'movl $.LC0, %edi\n'\
              'movl $0, %eax\n'\
              'call printf\n'\
              'movl $0, %eax\n'\
              'movl -20(%ebp), %esi\n'\
              'movl $.LC0, %edi\n'\
              'movl $0, %eax\n'\
              'call printf\n'\
              'movl $0, %eax\n'\
              'movl -16(%ebp), %esi\n'\
              'movl $.LC0, %edi\n'\
              'movl $0, %eax\n'\
              'call printf\n'\
              'movl $0, %eax\n'\
              'movl -12(%ebp), %esi\n'\
              'movl $.LC0, %edi\n'\
              'movl $0, %eax\n'\
              'call printf\n'\
              'movl $0, %eax\n'\
              'movl -8(%ebp), %edx\n'\
              'xorq %fs:40, %edx\n'\
              'je	.L1\n'\
              'call __stack_chk_fail\n'\
              '.L1:\n'
    test1(code, test_ir)

    code = '{int a;a=1+2;}'
    test_ir = 'movl $1, %eax\n'\
              'movl $2, %ecx\n'\
              'addl %ecx, %eax\n'\
              'movl %eax, -4(%ebp)\n'\
              'movl -4(%ebp), %eax\n'\
              'movl %eax, -8(%ebp)\n'
    test1(code, test_ir)

    code = '{int a;a=1*2;}'
    test_ir = 'movl $1, %eax\n'\
              'movl $2, %ecx\n'\
              'imull %ecx, %eax\n'\
              'movl %eax, -4(%ebp)\n'\
              'movl -4(%ebp), %eax\n'\
              'movl %eax, -8(%ebp)\n'
    test1(code, test_ir)

    code = '{int a;a=1+2*3;}'
    test_ir = 'movl $2, %eax\n'\
              'movl $3, %ecx\n'\
              'imull %ecx, %eax\n'\
              'movl %eax, -8(%ebp)\n'\
              'movl $1, %eax\n'\
              'movl -8(%ebp), %ecx\n'\
              'addl %ecx, %eax\n'\
              'movl %eax, -4(%ebp)\n'\
              'movl -4(%ebp), %eax\n'\
              'movl %eax, -12(%ebp)\n'
    test1(code, test_ir)

    code = '{int a;a=1+2*3;}'
    test_ir = 'movl $2, %eax\n'\
              'movl $3, %ecx\n'\
              'imull %ecx, %eax\n'\
              'movl %eax, -8(%ebp)\n'\
              'movl $1, %eax\n'\
              'movl -8(%ebp), %ecx\n'\
              'addl %ecx, %eax\n'\
              'movl %eax, -4(%ebp)\n'\
              'movl -4(%ebp), %eax\n'\
              'movl %eax, -12(%ebp)\n'
    test1(code, test_ir)

    # code = '{int a;a=1+2*3-4*2+4*(1+2)+1-2;}'

    code = '{int a;a=1;if(a==1)a=2;}'
    test_ir = 'movl $1, %eax\n'\
              'movl %eax, -4(%ebp)\n' \
              'movl -4(%ebp), %eax\n' \
              'cmpl $1, %eax\n'\
              'jne .L1\n'\
              'movl $2, %eax\n'\
              'movl %eax, -4(%ebp)\n'\
              '.L1:\n'
    test1(code, test_ir)

    code = '{int a;a=1;if(a==1)a=2;else a=3;}'
    test_ir = 'movl $1, %eax\n'\
              'movl %eax, -4(%ebp)\n' \
              'movl -4(%ebp), %eax\n' \
              'cmpl $1, %eax\n'\
              'jne .L1\n'\
              'movl $2, %eax\n'\
              'movl %eax, -4(%ebp)\n'\
              'jmp .L2\n'\
              '.L1:\n'\
              'movl $3, %eax\n'\
              'movl %eax, -4(%ebp)\n'\
              '.L2:\n'
    test1(code, test_ir)

    code = '{int a; a=2; int b; b=4; int c; ' \
           'if(a < 1 || b > 2 && a <= 3 || (a >= 2 || b != 3) && b == 2)c=2;else c=3;}'
    test_ir =   'movl $2, %eax\n'\
                'movl %eax, -12(%ebp)\n'\
                'movl $4, %eax\n'\
                'movl %eax, -8(%ebp)\n' \
                'movl -12(%ebp), %eax\n' \
                'cmpl $1, %eax\n'\
                'jl .L1\n'\
                'movl -8(%ebp), %eax\n'\
                'cmpl $2, %eax\n'\
                'jle .L4\n' \
                'movl -12(%ebp), %eax\n' \
                'cmpl $3, %eax\n'\
                'jle .L1\n'\
                '.L4:\n'\
                'movl -12(%ebp), %eax\n' \
                'cmpl $2, %eax\n' \
                'jge .L5\n'\
                'movl -8(%ebp), %eax\n' \
                'cmpl $3, %eax\n' \
                'je .L2\n'\
                '.L5:\n'\
                'movl -8(%ebp), %eax\n' \
                'cmpl $2, %eax\n' \
                'jne .L2\n'\
                '.L1:\n'\
                'movl $2, %eax\n'\
                'movl %eax, -4(%ebp)\n'\
                'jmp .L3\n'\
                '.L2:\n'\
                'movl $3, %eax\n'\
                'movl %eax, -4(%ebp)\n'\
                '.L3:\n'
    test1(code, test_ir)

    code = '{int a;a=2;printf("%d\\n",a);}'
    test_ir = '.section .rodata\n' \
              '.LC0:\n'\
              '.string "%d\\n"\n'\
              'movl $2, %eax\n'\
              'movl %eax, -4(%ebp)\n'\
              'movl -4(%ebp), %esi\n'\
              'movl $.LC0, %edi\n'\
              'movl $0, %eax\n'\
              'call printf\n'\
              'movl $0, %eax\n'
    test1(code, test_ir)

    code = '{int x[5]; x[0]=2; x[1]=4;' \
           'if(x[0] < 1 || x[1] > 2 && x[0] <= 3 || (x[0] >= 2 || x[1] != 3) && x[1] == 2)x[2]=2;else x[2]=3;' \
           'printf("%d\\n", x[2]);}'
    test_ir = '.section .rodata\n' \
              '.LC0:\n'\
              '.string "%d\\n"\n'\
              'subl $28, %esp\n'\
              'movl %fs:40, %eax\n'\
              'movl %eax, -8(%ebp)\n'\
              'xorl %eax, %eax\n'\
              'movl $2, %eax\n'\
              'movl %eax, -28(%ebp)\n'\
              'movl $4, %eax\n'\
              'movl %eax, -24(%ebp)\n'\
              'movl -28(%ebp), %eax\n' \
              'cmpl $1, %eax\n' \
              'jl .L1\n'\
              'movl -24(%ebp), %eax\n' \
              'cmpl $2, %eax\n' \
              'jle .L4\n'\
              'movl -28(%ebp), %eax\n' \
              'cmpl $3, %eax\n' \
              'jle .L1\n'\
              '.L4:\n'\
              'movl -28(%ebp), %eax\n' \
              'cmpl $2, %eax\n' \
              'jge .L5\n'\
              'movl -24(%ebp), %eax\n' \
              'cmpl $3, %eax\n' \
              'je .L2\n'\
              '.L5:\n'\
              'movl -24(%ebp), %eax\n' \
              'cmpl $2, %eax\n' \
              'jne .L2\n'\
              '.L1:\n'\
              'movl $2, %eax\n'\
              'movl %eax, -20(%ebp)\n'\
              'jmp .L3\n'\
              '.L2:\n'\
              'movl $3, %eax\n'\
              'movl %eax, -20(%ebp)\n'\
              '.L3:\n'\
              'movl -20(%ebp), %esi\n'\
              'movl $.LC0, %edi\n'\
              'movl $0, %eax\n'\
              'call printf\n'\
              'movl $0, %eax\n'\
              'movl -8(%ebp), %edx\n'\
              'xorq %fs:40, %edx\n'\
              'je	.L6\n'\
              'call __stack_chk_fail\n'\
              '.L6:\n'
    test1(code, test_ir)

    code = '{int a;a=1;int b;b=1;' \
           'while(a<5){b=b+2;a=a+1;}' \
           'printf("%d\\n",b);}'
    test_ir = '.section .rodata\n' \
              '.LC0:\n'\
              '.string "%d\\n"\n'\
              'movl $1, %eax\n'\
              'movl %eax, -16(%ebp)\n'\
              'movl $1, %eax\n'\
              'movl %eax, -12(%ebp)\n'\
              '.L1:\n'\
              'movl -16(%ebp), %eax\n' \
              'cmpl $5, %eax\n' \
              'jge .L2\n'\
              'movl -12(%ebp), %eax\n'\
              'movl $2, %ecx\n'\
              'addl %ecx, %eax\n'\
              'movl %eax, -8(%ebp)\n'\
              'movl -8(%ebp), %eax\n'\
              'movl %eax, -12(%ebp)\n'\
              'movl -16(%ebp), %eax\n'\
              'movl $1, %ecx\n'\
              'addl %ecx, %eax\n'\
              'movl %eax, -4(%ebp)\n'\
              'movl -4(%ebp), %eax\n'\
              'movl %eax, -16(%ebp)\n'\
              'jmp .L1\n'\
              '.L2:\n' \
              'movl -12(%ebp), %esi\n' \
              'movl $.LC0, %edi\n' \
              'movl $0, %eax\n' \
              'call printf\n' \
              'movl $0, %eax\n'
    test1(code, test_ir)

    code = '{int a;a=0;int b;b=0;int c;c=0;' \
           'while(a<5){' \
           'while(b<5){' \
           'c=c+1;' \
           'b=b+1;' \
           '}' \
           'a=a+1;' \
           'b=0;' \
           '}' \
           'printf("%d\\n",c);}'
    test_ir =   '.section .rodata\n'\
                '.LC0:\n'\
                '.string "%d\\n"\n'\
                'movl $0, %eax\n'\
                'movl %eax, -24(%ebp)\n'\
                'movl $0, %eax\n'\
                'movl %eax, -20(%ebp)\n'\
                'movl $0, %eax\n'\
                'movl %eax, -16(%ebp)\n'\
                '.L1:\n'\
                'movl -24(%ebp), %eax\n' \
                'cmpl $5, %eax\n' \
                'jge .L2\n'\
                '.L3:\n'\
                'movl -20(%ebp), %eax\n' \
                'cmpl $5, %eax\n' \
                'jge .L4\n'\
                'movl -16(%ebp), %eax\n'\
                'movl $1, %ecx\n'\
                'addl %ecx, %eax\n'\
                'movl %eax, -12(%ebp)\n'\
                'movl -12(%ebp), %eax\n'\
                'movl %eax, -16(%ebp)\n'\
                'movl -20(%ebp), %eax\n'\
                'movl $1, %ecx\n'\
                'addl %ecx, %eax\n'\
                'movl %eax, -8(%ebp)\n'\
                'movl -8(%ebp), %eax\n'\
                'movl %eax, -20(%ebp)\n'\
                'jmp .L3\n'\
                '.L4:\n'\
                'movl -24(%ebp), %eax\n'\
                'movl $1, %ecx\n'\
                'addl %ecx, %eax\n'\
                'movl %eax, -4(%ebp)\n'\
                'movl -4(%ebp), %eax\n'\
                'movl %eax, -24(%ebp)\n'\
                'movl $0, %eax\n'\
                'movl %eax, -20(%ebp)\n'\
                'jmp .L1\n'\
                '.L2:\n'\
                'movl -16(%ebp), %esi\n'\
                'movl $.LC0, %edi\n'\
                'movl $0, %eax\n'\
                'call printf\n'\
                'movl $0, %eax\n'
    test1(code, test_ir)



def test1(code, test_ir):
    if all_:
        lexer = Lexer(code)
        lexer.scan()
        tokens = lexer.tokens
        # print_token_names(tokens)
        parser = Parser(tokens)
        gen = Generator_as(parser)
        gen.gen_test_ir()
        ir = gen.ir
        try:
            assert(ir == test_ir)
        except:
            log(code)
            min_ = min(len(ir), len(test_ir))
            for x in range(min_):
                if ir[x] != test_ir[x]:
                    log("differed!  ", ir[x], "expect  ", test_ir[x])
                    for y in range(30):
                        index = x + y
                        if index < len(ir):
                            log(ir[index], end='')
                        else:
                            break
                    log("\n")
                    log("expect: ")
                    for y in range(30):
                        index = x + y
                        if index < len(ir):
                            log(test_ir[index], end='')
                        else:
                            break
                    break
            log("\n")
            log(ir)
        # assert (gen.ir == test_ir)
    else:
        global i
        i += 1
        if i == 10:
            lexer = Lexer(code)
            lexer.scan()
            tokens = lexer.tokens
            print_token_names(tokens)
            parser = Parser(tokens)
            gen = Generator_as(parser)
            gen.gen_test_ir()
            ir = gen.ir
            assert(ir == test_ir)



def test(code, test_ir):
    if all_:
        lexer = Lexer(code)
        lexer.scan()
        tokens = lexer.tokens
        # print_token_names(tokens)
        parser = Parser(tokens)
        ast = parser.AST
        gen = Generator(ast)
        assert(gen.ir == test_ir)
    else:
        global i
        i += 1
        if i == 4:
            lexer = Lexer(code)
            lexer.scan()
            tokens = lexer.tokens
            print_token_names(tokens)
            parser = Parser(tokens)
            ast = parser.AST
            gen = Generator(ast)
            assert(gen.ir == test_ir)




# test_gen()
# test_as()
