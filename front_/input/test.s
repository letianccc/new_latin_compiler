//by latin

    .text
    .globl	_other_compare
_other_compare:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$0, %esp
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
    subl	$12, %esp
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jle L2
L0:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L2
L1:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L3
L2:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L3:
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
