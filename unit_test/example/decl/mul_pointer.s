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
    subl	$40, %esp
    movl	$7, %eax
    movl	%eax, 36(%esp)
    leal	36(%esp), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 32(%esp)
    leal	32(%esp), %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, 28(%esp)
    movl	32(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"*p == 7    : %d\n"
LC1:
    .string	"**pp == 7  : %d\n"