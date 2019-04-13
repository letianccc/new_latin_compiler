	.file	"hello.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$70000, 12(%esp)
	movw	$1, 10(%esp)
	movswl	10(%esp), %edx
	movl	12(%esp), %eax
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	call	_getchar
	nop
	leave
	ret
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_getchar;	.scl	2;	.type	32;	.endef
