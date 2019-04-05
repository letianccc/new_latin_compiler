//by latin

LC0:
    .string	"aaa%d\n"
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
    movl	$7, 16(%esp)
    movl	$4, 12(%esp)
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    movl	$2, 4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
