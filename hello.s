
LC0:
	.ascii "%d\12\0"
	.text
	.globl	_main
    
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$1, 28(%esp)
	call	_func
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	call	_getchar
	movl	$3, %eax
	leave
	ret
	.globl	_func
_func:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$1, -4(%ebp)
	nop
	leave
	ret
    