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
    subl	$36, %esp
    movl	$2, 32(%esp)
    movl	$2, %eax
    subl	$1, %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 28(%esp)
    movl	32(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 24(%esp)
    movl	$3, %eax
    subl	32(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 20(%esp)
    movl	$3, %eax
    subl	$1, %eax
    movl	%eax, %eax
    subl	32(%esp), %eax
    movl	%eax, 16(%esp)
    movl	$4, %eax
    subl	32(%esp), %eax
    movl	%eax, %eax
    subl	32(%esp), %eax
    movl	%eax, 12(%esp)
    movl	32(%esp), %eax
    movl	%eax, %eax
    subl	32(%esp), %eax
    movl	%eax, %eax
    subl	32(%esp), %eax
    movl	%eax, 8(%esp)
    movl	28(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    movl	24(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    movl	20(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"value: %d\n"
