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
    subl	$16, %esp
    movl	$2, %eax
    movl	%eax, 12(%esp)
    movl	$2, %eax
    movl	%eax, 8(%esp)
    movl	12(%esp), %eax
    cmpl	$2, %eax
    jne L1
L0:
    movl	$3, %eax
    movl	%eax, 8(%esp)
L1:
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
    .string	"target 4: %d\n"
