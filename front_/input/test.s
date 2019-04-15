//by latin

    .text
    .globl	_num_cmp
_num_cmp:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$12, %esp
    movl	$1, %eax
    movl	%eax, 8(%esp)
L0:
    movl	$3, %eax
    movl	%eax, 8(%esp)
    jmp L2
L1:
    movl	$4, %eax
    movl	%eax, 8(%esp)
    movl	$2, %eax
    cmpl	$3, %eax
    je L1
    movl	$4, %eax
    movl	%eax, 8(%esp)
L2:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
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
    subl	$0, %esp
    call	_num_cmp
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 4: %d\n"
