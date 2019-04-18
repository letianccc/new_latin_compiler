	.file	"hello.c"
	.text
	.globl	_func
	.def	_func;	.scl	2;	.type	32;	.endef
_func:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	fldl	LC0
	fstpl	-8(%ebp)
	fldl	-8(%ebp)
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC2:
	.ascii "target 1: %f\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	call	_func
	fstpl	24(%esp)
	fldl	24(%esp)
	fstpl	4(%esp)
	movl	$LC2, (%esp)
	call	_printf
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
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
