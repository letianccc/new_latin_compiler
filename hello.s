	.file	"hello.c"
	.text
	.globl	_func
	.def	_func;	.scl	2;	.type	32;	.endef
_func:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	flds	LC0
	fstps	-4(%ebp)
	flds	LC1
	fstps	-8(%ebp)
	nop
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC5:
	.ascii "aaa%f\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	flds	LC3
	fstps	28(%esp)
	flds	28(%esp)
	fstps	24(%esp)
	flds	LC4
	fstps	20(%esp)
	flds	20(%esp)
	fstps	(%esp)
	call	_func
	flds	20(%esp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	call	_getchar
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 4
LC0:
	.long	1080033280
	.align 4
LC1:
	.long	1083179008
	.align 4
LC3:
	.long	1069547520
	.align 4
LC4:
	.long	1075838976
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
