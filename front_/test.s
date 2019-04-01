.section .rodata
.LC0:
.string "%d\n"
.text
.globl main
.type	main, @function
main:
push %ebp
movl	%esp, %ebp
subl $4, %esp
movl $1, %ecx
movl %ecx, -4(%ebp)
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
