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
    subl	$20, %esp
    movl	$2, %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jne L1
L0:
    movl	$1, %eax
    movl	%eax, 12(%esp)
    jmp L2
L1:
    movl	$0, %eax
    movl	%eax, 12(%esp)
L2:
    movl	16(%esp), %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jne L4
L3:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L5
L4:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L5:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	16(%esp), %eax
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
