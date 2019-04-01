	.file	"hello.c"
	.text
	.section .rdata,"dr"
LC0:
	.ascii "aaa\0"
LC1:
	.ascii "bb\0"
	.text
	.globl	_func
	.def	_func;	.scl	2;	.type	32;	.endef
_func:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_printf
	movl	$LC1, (%esp)
	call	_printf
	nop
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC2:
	.ascii "hello\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp
	call	_func
	movl	$LC2, (%esp)
	call	_puts
	call	_getchar
	nop
	leave
	ret
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
