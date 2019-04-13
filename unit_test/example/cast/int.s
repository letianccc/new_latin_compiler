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
    subl	$26, %esp
    movl	$50000, %eax
    movl	%eax, 22(%esp)
    movl	$20000, %eax
    movw	%ax, 20(%esp)
    movswl	20(%esp), %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	22(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 70000: %d\n"
