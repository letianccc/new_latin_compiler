	.file	"hello.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
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
	fstpl	40(%esp)
	fldl	40(%esp)
	fnstcw	30(%esp)
	movzwl	30(%esp), %eax
	orb	$12, %ah
	movw	%ax, 28(%esp)
	fldcw	28(%esp)
	fistpl	36(%esp)
	fldcw	30(%esp)
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	call	_getchar
	nop
	leave
	ret
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
