//by latin

    .text
    .globl	_func
_func:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$30, %esp
    movl	$70000, %eax
    movl	%eax, 26(%esp)
    leal	26(%esp), %eax
    movl	%eax, 14(%esp)
    movl	14(%esp), %eax
    movl	%eax, 22(%esp)
    movl	26(%esp), %eax
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
    movl	26(%esp), %eax
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
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 4464: %d\n"
LC1:
    .string	"target 14464: %d\n"
