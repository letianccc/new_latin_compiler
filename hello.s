	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	%rbp
	movq	%rsp, %rbp
	sub	$16, %rsp
	movq	$1, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jle	.L2
	movq	$3, -4(%rbp)
.L2:
	movq	-4(%rbp), %rax
	movq	%rax, %rsi
	movq	$.LC0, %rdi
	movq	$0, %rax
	call	printf
	movq	$0, %rax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
