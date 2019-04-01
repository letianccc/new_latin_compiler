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
push %rbp
movq	%rsp, %rbp
sub $4, %rsp


.B0:
movq $1, %rax
movq %rax, -4(%rbp)
movq -4(%rbp), %rax
cmpl $1, %rax
je .B2
.B1:
movq $2, %rax
movq %rax, -4(%rbp)
jmp .B3
.B2:
movq $3, %rax
movq %rax, -4(%rbp)
.B3:
movq -4(%rbp), %rsi
movq $.LC0, %rdi
movq $0, %rax
call printf
movq $0, %rax


leave
ret
.size	main, .-main
.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.6) 5.4.0 20160609"
.section	.note.GNU-stack,"",@progbits
'''
assert_ir(code, ir)
