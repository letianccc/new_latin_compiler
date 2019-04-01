.section .rodata
.LC0:
.string "%d\n"
.text
.globl main
.type	main, @function
main:
push %rbp
movq	%rsp, %rbp
sub $4, %rsp
movq $1, %rcx
movq %rcx, -4(%rbp)
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
