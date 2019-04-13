	.file	"hello.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
	.ascii "target -1.1: %f\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	fldl	LC0
	fstpl	40(%esp)
	fldl	LC0
	fstpl	32(%esp)
	fldl	LC0
	fstpl	24(%esp)
	fldl	40(%esp)
	faddl	32(%esp)
	fldl	24(%esp)
	faddp	%st, %st(1)
	fstpl	16(%esp)
	fldl	16(%esp)
	fstpl	4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	call	_getchar
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
LC0:
	.long	-1717986918
	.long	1072798105
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
