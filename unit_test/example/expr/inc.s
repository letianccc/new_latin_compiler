//by latin

    .text
    .globl	_main
_main:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$12, %esp
    movl	$0, %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 8(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 1: %d\n"
