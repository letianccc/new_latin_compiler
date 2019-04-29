//by latin

    .text
    .globl	_swap1
_swap1:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$2, %esp
    movswl	20(%ebp), %eax
    movw	%ax, 0(%esp)
    movswl	22(%ebp), %eax
    movw	%ax, 20(%ebp)
    movswl	0(%esp), %eax
    movw	%ax, 22(%ebp)
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_swap2
_swap2:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$18, %esp
    movl	20(%ebp), %eax
    movl	(%eax), %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movw	%ax, 16(%esp)
    movl	20(%ebp), %eax
    movl	(%eax), %eax
    movl	%eax, 8(%esp)
    movl	24(%ebp), %eax
    movl	(%eax), %eax
    movl	%eax, 4(%esp)
    movl	20(%ebp), %eax
    movl	4(%esp), %edx
    movl	%edx, (%eax)
    movl	24(%ebp), %eax
    movl	(%eax), %eax
    movl	%eax, 0(%esp)
    movl	24(%ebp), %eax
    movw	16(%esp), %dx
    movswl	%dx, (%eax)
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_swap
_swap:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$20, %esp
    movl	$70000, %eax
    movw	%ax, 18(%esp)
    movl	$80000, %eax
    movw	%ax, 16(%esp)
    movswl	18(%esp), %eax
    movl	%eax, 0(%esp)
    movswl	16(%esp), %eax
    movl	%eax, 4(%esp)
    call	_swap1
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	18(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movswl	16(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    leal	18(%esp), %eax
    movl	%eax, 12(%esp)
    leal	16(%esp), %eax
    movl	%eax, 8(%esp)
    movl	12(%esp), %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_swap2
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movswl	18(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	16(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_func1
_func1:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$12, %esp
    movl	20(%ebp), %eax
    movl	(%eax), %eax
    movl	%eax, 8(%esp)
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
    .globl	_pass_pointer
_pass_pointer:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$14, %esp
    movl	$70000, %eax
    movw	%ax, 12(%esp)
    leal	12(%esp), %eax
    movl	%eax, 4(%esp)
    movl	4(%esp), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 0(%esp)
    call	_func1
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
    subl	$58, %esp
    movl	$70000, %eax
    movw	%ax, 56(%esp)
    leal	56(%esp), %eax
    movl	%eax, 44(%esp)
    movl	44(%esp), %eax
    movl	%eax, 52(%esp)
    leal	52(%esp), %eax
    movl	%eax, 40(%esp)
    movl	40(%esp), %eax
    movl	%eax, 48(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	56(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	52(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 36(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	36(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	48(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 28(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	28(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	48(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 20(%esp)
    movl	24(%esp), %eax
    movl	$80000, %edx
    movl	%edx, (%eax)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movswl	56(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	52(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 16(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	48(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 8(%esp)
    movl	$LC1, %eax
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
    .globl	_func
_func:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$34, %esp
    movl	$70000, %eax
    movw	%ax, 32(%esp)
    leal	32(%esp), %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, 28(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	32(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 16(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$80000, %eax
    movl	%eax, 24(%esp)
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 12(%esp)
    movl	28(%esp), %eax
    movl	24(%esp), %edx
    movl	%edx, (%eax)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movswl	32(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 8(%esp)
    movl	$LC1, %eax
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
    call	_func
    call	_pass_pointer
    call	_swap
    call	_mul_indirect_assign
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 4464\t: %d\n"
LC1:
    .string	"target 14464\t: %d\n"
