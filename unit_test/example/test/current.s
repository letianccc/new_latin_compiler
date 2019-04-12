//by latin

    .text
    .globl	_pass_pointer
_pass_pointer:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$12, %esp
    movl	20(%ebp), %eax
    movl	%eax, %eax
    movl	(%eax), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_mul_indirect_assign
_mul_indirect_assign:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$60, %esp
    movl	$1, %eax
    movl	%eax, 56(%esp)
    leal	56(%esp), %eax
    movl	%eax, 44(%esp)
    movl	44(%esp), %eax
    movl	%eax, 52(%esp)
    leal	52(%esp), %eax
    movl	%eax, 40(%esp)
    movl	40(%esp), %eax
    movl	%eax, 48(%esp)
    movl	56(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	52(%esp), %eax
    movl	%eax, %eax
    movl	(%eax), %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	48(%esp), %eax
    movl	%eax, %eax
    movl	(%eax), %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movl	%eax, %eax
    movl	(%eax), %eax
    movl	%eax, 28(%esp)
    movl	28(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	48(%esp), %eax
    movl	%eax, %eax
    movl	(%eax), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, %eax
    movl	(%eax), %eax
    movl	%eax, 20(%esp)
    movl	24(%esp), %eax
    movl	$2, %edx
    movl	%edx, (%eax)
    movl	56(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	52(%esp), %eax
    movl	%eax, %eax
    movl	(%eax), %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	48(%esp), %eax
    movl	%eax, %eax
    movl	(%eax), %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	%eax, %eax
    movl	(%eax), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
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
    subl	$16, %esp
    movl	$1, %eax
    movl	%eax, 12(%esp)
    leal	12(%esp), %eax
    movl	%eax, 4(%esp)
    movl	4(%esp), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 0(%esp)
    call	_pass_pointer
    call	_mul_indirect_assign
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 1: %d\n"
LC1:
    .string	"target 2: %d\n"
