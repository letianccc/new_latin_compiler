	.file	"hello.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	movl	$7, 44(%esp)
	fldl	LC0
	fstpl	32(%esp)
	movl	$7, 28(%esp)
	movl	$7, 24(%esp)
	movl	44(%esp), %eax
	cmpl	28(%esp), %eax
	jne	L2
	movl	44(%esp), %eax
	cmpl	24(%esp), %eax
	jne	L2
	movl	28(%esp), %eax
	cmpl	24(%esp), %eax
	jne	L2
	movl	$1, 12(%esp)
	jmp	L3
L2:
	movl	$0, 12(%esp)
L3:
	fildl	12(%esp)
	fstpl	16(%esp)
	call	_getchar
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
LC0:
	.long	0
	.long	1075576832
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_getchar;	.scl	2;	.type	32;	.endef
