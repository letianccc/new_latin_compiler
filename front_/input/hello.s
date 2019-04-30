	.file	"hello.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC2:
	.ascii "%f\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	fld1
	fstpl	24(%esp)
	fldl	24(%esp)
	fild	$5
	faddp	%st, %st(1)
	fstpl	16(%esp)
	fldl	16(%esp)
	fstpl	4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	call	_getchar
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
LC1:
	.long	0
	.long	1073741824
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
