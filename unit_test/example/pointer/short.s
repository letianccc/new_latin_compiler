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
    subl	$10, %esp
    movl	20(%ebp), %eax
    movswl	(%eax), %eax
    movw	%ax, 6(%esp)
    movswl	6(%esp), %eax
    movw	%ax, 8(%esp)
    movl	20(%ebp), %eax
    movswl	(%eax), %eax
    movw	%ax, 4(%esp)
    movl	24(%ebp), %eax
    movswl	(%eax), %eax
    movw	%ax, 2(%esp)
    movl	20(%ebp), %eax
    movw	2(%esp), %dx
    movw	%dx, (%eax)
    movl	24(%ebp), %eax
    movswl	(%eax), %eax
    movw	%ax, 0(%esp)
    movl	24(%ebp), %eax
    movw	8(%esp), %dx
    movw	%dx, (%eax)
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
    movswl	16(%esp), %eax
    movl	%eax, 2(%esp)
    movswl	18(%esp), %eax
    movl	%eax, 0(%esp)
    call	_swap1
    movswl	18(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	16(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    leal	16(%esp), %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    leal	18(%esp), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 0(%esp)
    call	_swap2
    movswl	18(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	16(%esp), %eax
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
    .globl	_func1
_func1:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$10, %esp
    movl	20(%ebp), %eax
    movswl	(%eax), %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
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
    subl	$48, %esp
    movl	$70000, %eax
    movw	%ax, 46(%esp)
    leal	46(%esp), %eax
    movl	%eax, 34(%esp)
    movl	34(%esp), %eax
    movl	%eax, 42(%esp)
    leal	42(%esp), %eax
    movl	%eax, 30(%esp)
    movl	30(%esp), %eax
    movl	%eax, 38(%esp)
    movswl	46(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	42(%esp), %eax
    movswl	(%eax), %eax
    movw	%ax, 28(%esp)
    movswl	28(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	38(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movswl	(%eax), %eax
    movw	%ax, 22(%esp)
    movswl	22(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	38(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 18(%esp)
    movl	18(%esp), %eax
    movswl	(%eax), %eax
    movw	%ax, 16(%esp)
    movl	18(%esp), %eax
    movl	$80000, %edx
    movw	%dx, (%eax)
    movswl	46(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	42(%esp), %eax
    movswl	(%eax), %eax
    movw	%ax, 14(%esp)
    movswl	14(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	38(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 10(%esp)
    movl	10(%esp), %eax
    movswl	(%eax), %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
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
    .globl	_func
_func:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$28, %esp
    movl	$70000, %eax
    movw	%ax, 26(%esp)
    leal	26(%esp), %eax
    movl	%eax, 14(%esp)
    movl	14(%esp), %eax
    movl	%eax, 22(%esp)
    movswl	26(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	22(%esp), %eax
    movswl	(%eax), %eax
    movw	%ax, 12(%esp)
    movswl	12(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	$80000, %eax
    movl	%eax, 18(%esp)
    movl	22(%esp), %eax
    movswl	(%eax), %eax
    movw	%ax, 10(%esp)
    movl	22(%esp), %eax
    movl	18(%esp), %edx
    movw	%dx, (%eax)
    movswl	26(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	22(%esp), %eax
    movswl	(%eax), %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
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
