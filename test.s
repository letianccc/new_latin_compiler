	.text
	.globl	_func
_func:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	andl	$-16, %esp
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	popl	%ebp
	ret
	.text
	.globl	_main
_main:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	andl	$-16, %esp
	call	_func
	call	_getchar
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	popl	%ebp
	ret
