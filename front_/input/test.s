//by latin

    .text
    .globl	_constant_folding
_constant_folding:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$38, %esp
    movl	$2, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, 34(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	34(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movw	%ax, 32(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	32(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 12(%esp)
    fildl	12(%esp)
    fstpl	24(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	24(%esp)
    fstpl	4(%esp)
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
    call	_constant_folding
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 2: %d\n"
LC1:
    .string	"target 2: %f\n"
