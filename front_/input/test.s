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
    subl	$28, %esp
    movl	$1, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 20(%esp)
    movl	$2, 16(%esp)
    movl	20(%esp), %eax
    movl	%eax, 12(%esp)
    movl	$3, 8(%esp)
    movl	24(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    movl	20(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, 0(%esp)
    call	_printf
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, 0(%esp)
    call	_printf
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, 0(%esp)
    call	_printf
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, 0(%esp)
    call	_printf
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"a: %d\n"
LC1:
    .string	"b: %d\n"
LC2:
    .string	"d: %d\n"
LC3:
    .string	"c: %d\n"
LC4:
    .string	"e: %d\n"
