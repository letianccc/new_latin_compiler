	//by latin

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
LC0:
	.string	"hello\n"
	.text
	.globl	_main
_main:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	andl	$-16, %esp
	movl	$1, (%esp)
	call	_func
	movl	$LC0, (%esp)
	call	_printf
	call	_getchar
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	popl	%ebp
	ret
