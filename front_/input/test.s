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
    subl	$52, %esp
    leal	12(%esp), %edx
    movl	$0, %eax
    movl	$10, %ecx
    movl	%edx, %edi
    rep	stosl
    movl	$1, %eax
    movl	%eax, %ecx
    movl	12(%esp, %ecx, 4), %eax
    movl	%eax, 8(%esp)
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
    .string	"target 0: %d\n"
