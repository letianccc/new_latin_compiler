	//by latin

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
	movl	$LC0, (%esp)
	call	_printf
	call	_getchar
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	popl	%ebp
	ret
