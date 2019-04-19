	.file	"hello.c"
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	movl	$1, 44(%esp)
	leal	4(%esp), %edx
	movl	$0, %eax
	movl	$10, %ecx
	movl	%edx, %edi
	rep stosl
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	44(%esp), %eax
	addl	$1, %eax
	movl	%eax, 8(%esp)
	call	_getchar
	nop
	movl	-4(%ebp), %edi
	leave
	ret
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_getchar;	.scl	2;	.type	32;	.endef
