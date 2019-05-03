	.file	"hello.c"
	.text
	.globl	_sort
	.def	_sort;	.scl	2;	.type	32;	.endef
_sort:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	addl	$4, %eax
	movl	$111, (%eax)
	nop
	popl	%ebp
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "%d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$64, %esp
	call	___main
	movl	$3, 16(%esp)
	movl	$5, 20(%esp)
	movl	$1, 24(%esp)
	movl	$7, 28(%esp)
	movl	$4, 32(%esp)
	movl	$9, 36(%esp)
	movl	$6, 40(%esp)
	movl	$8, 44(%esp)
	movl	$10, 48(%esp)
	movl	$4, 52(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	call	_sort
	movl	$10, 56(%esp)
	movl	$0, 60(%esp)
	jmp	L3
L4:
	movl	60(%esp), %eax
	movl	16(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	addl	$1, 60(%esp)
L3:
	movl	60(%esp), %eax
	cmpl	56(%esp), %eax
	jl	L4
	call	_getchar
	nop
	leave
	ret
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
