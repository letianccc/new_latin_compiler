	.file	"hello.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC2:
	.ascii "target 3: %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	fldl	LC0
	fstpl	16(%esp)
	fldl	LC0
	fstpl	24(%esp)
	fldl	16(%esp)
	fldl	24(%esp)
	fucompp
	fnstsw	%ax
	sahf
	jp	L2
	fldl	16(%esp)
	fldl	24(%esp)
	fucompp
	fnstsw	%ax
	sahf
	jne	L2
	fldl	LC1
	fstpl	24(%esp)
L2:
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
	.long	1073217536
	.align 8
LC1:
	.long	0
	.long	1074266112
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
