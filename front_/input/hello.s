	.file	"hello.c"
	.text
	.section .rdata,"dr"
LC0:
	.ascii "value: %d\12\0"
	.text
	.globl	_func1
	.def	_func1;	.scl	2;	.type	32;	.endef
_func1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	nop
	leave
	ret
	.section .rdata,"dr"
LC2:
	.ascii "value: %f\12\0"
LC4:
	.ascii "value: None\0"
	.text
	.globl	_func2
	.def	_func2;	.scl	2;	.type	32;	.endef
_func2:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movl	$3, -12(%ebp)
	movl	$2, -16(%ebp)
	movl	$1, -20(%ebp)
	movl	$1, -24(%ebp)
	movl	$3, -28(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$2, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	fldl	LC1
	fstpl	-40(%ebp)
	fldl	-40(%ebp)
	fstpl	4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	fldl	LC3
	fstpl	4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$LC4, (%esp)
	call	_puts
	movl	$5, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	nop
	leave
	ret
	.globl	_func3
	.def	_func3;	.scl	2;	.type	32;	.endef
_func3:
	pushl	%ebp
	movl	%esp, %ebp
	nop
	popl	%ebp
	ret
	.globl	_func4
	.def	_func4;	.scl	2;	.type	32;	.endef
_func4:
	pushl	%ebp
	movl	%esp, %ebp
	nop
	popl	%ebp
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	movl	$3, 44(%esp)
	movl	$2, 40(%esp)
	movl	$1, 36(%esp)
	movl	$1, 32(%esp)
	movl	$3, 28(%esp)
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$2, 24(%esp)
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	fldl	LC1
	fstpl	16(%esp)
	fldl	16(%esp)
	fstpl	4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	fldl	LC3
	fstpl	4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$LC4, (%esp)
	call	_puts
	movl	$5, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	_func1
	movl	$4, 4(%esp)
	movl	$3, (%esp)
	call	_func2
	call	_func3
	movl	$1, (%esp)
	call	_func4
	call	_getchar
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
LC1:
	.long	0
	.long	1074528256
	.align 8
LC3:
	.long	0
	.long	1074921472
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
