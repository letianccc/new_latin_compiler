	.file	"hello.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC2:
	.ascii "target 1: %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	fld1
	fstpl	32(%esp)
	fldl	LC1
	fstpl	24(%esp)
	movl	$777, 44(%esp)
	fldl	32(%esp)
	fldl	24(%esp)
	fcompp 
	fnstsw	%ax
	sahf
	jbe	L6
	movl	$1, 44(%esp)
	jmp	L4
L6:
	movl	$0, 44(%esp)
L4:
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
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
