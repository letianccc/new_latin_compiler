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
    fldl	FLOAT0
    fstpl	20(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	20(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT0
    fstpl	12(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	12(%esp)
    fstpl	4(%esp)
    call	_printf
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 1: %f\n"
FLOAT0:
    .long	0
    .long	1072693248
