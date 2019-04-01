from lexer_ import Lexer
from parser_ import Parser
from generator import Generator, Generator_as
from util import *
from gen.gen import *


def assert_ir(code, ir):
    lexer = Lexer(code)
    lexer.scan()
    tokens = lexer.tokens
    # print_token_names(tokens)
    parser = Parser(tokens)
    gen = NewGen(parser)
    emit = Emit(gen)
    assert ir == emit.code

code = '{int a;a=1;if(a!=1){a=2;}else{a=3;}printf("%d\\n", a);}'
ir = '''.section .rodata
.LC0:
.string "%d\\n"
.text
.globl main
.type	main, @function
main:
push %ebp
movl	%esp, %ebp
subl $4, %esp


.B0:
movl $1, %eax
movl %eax, -4(%ebp)
movl -4(%ebp), %eax
cmpl $1, %eax
je .B2
.B1:
movl $2, %eax
movl %eax, -4(%ebp)
jmp .B3
.B2:
movl $3, %eax
movl %eax, -4(%ebp)
.B3:
movl -4(%ebp), %esi
movl $.LC0, %edi
movl $0, %eax
call printf
movl $0, %eax


leave
ret
.size	main, .-main
.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.6) 5.4.0 20160609"
.section	.note.GNU-stack,"",@progbits
'''
assert_ir(code, ir)
