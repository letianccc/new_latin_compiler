	.file	"hello.c"
	.text
	.globl	_func
	.def	_func;	.scl	2;	.type	32;	.endef
_func:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$11, %eax
	popl	%ebp
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	andl	$-16, %esp
	subl	$64, %esp
	call	___main
	leal	12(%esp), %edx
	movl	$0, %eax
	movl	$10, %ecx
	movl	%edx, %edi
	rep stosl
	movl	$1, 60(%esp)
	movl	$1, 56(%esp)
	movl	$1, 52(%esp)
	movl	60(%esp), %edx
	movl	56(%esp), %eax
	addl	%edx, %eax
	movl	60(%esp), %ecx
	movl	56(%esp), %edx
	addl	%edx, %ecx
	movl	52(%esp), %edx
	addl	%ecx, %edx
	movl	12(%esp,%eax,4), %eax
	movl	%eax, 12(%esp,%edx,4)
	call	_getchar
	nop
	movl	-4(%ebp), %edi
	leave
	ret
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_getchar;	.scl	2;	.type	32;	.endef
