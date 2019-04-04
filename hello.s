	.file	"hello.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "hello\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$1, 28(%esp)
	cmpl	$2, 28(%esp)
	jle	L2
	movl	$3, 24(%esp)
L2:
	movl	$LC0, (%esp)
	call	_puts
	call	_getchar
	movl	$0, %eax
	leave
	ret
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
