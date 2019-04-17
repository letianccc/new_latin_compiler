	.file	"hello.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "target 1: %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$777, 28(%esp)
	movl	$1, 24(%esp)
	movl	$2, 20(%esp)
	movl	$3, 16(%esp)
	movl	24(%esp), %eax
	cmpl	20(%esp), %eax
	jge	L2
	movl	24(%esp), %eax
	cmpl	16(%esp), %eax
	jge	L2
	movl	20(%esp), %eax
	cmpl	16(%esp), %eax
	jge	L2
	movl	$1, %eax
	jmp	L3
L2:
	movl	$0, %eax
L3:
	movl	%eax, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	call	_getchar
	nop
	leave
	ret
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
