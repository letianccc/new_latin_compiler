//by latin

    .text
    .globl	_simple_minus
_simple_minus:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$54, %esp
    movl	$1, %eax
    movl	%eax, 50(%esp)
    movl	50(%esp), %eax
	negl	 %eax
    movl	%eax, 22(%esp)
    movl	22(%esp), %eax
    movl	%eax, 46(%esp)
    movl	$1, %eax
    movw	%ax, 44(%esp)
    movswl	44(%esp), %eax
	negl	 %eax
    movw	%ax, 20(%esp)
    movswl	20(%esp), %eax
    movw	%ax, 42(%esp)
    fldl	FLOAT0
    fstpl	34(%esp)
    fldl	34(%esp)
	fchs
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	26(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	46(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	42(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	26(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_mix_minus
_mix_minus:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$54, %esp
    movl	$1, %eax
    movl	%eax, 50(%esp)
    movl	$1, %eax
    movw	%ax, 48(%esp)
    fldl	FLOAT0
    fstpl	40(%esp)
    movswl	48(%esp), %eax
	negl	 %eax
    movw	%ax, 24(%esp)
    movswl	24(%esp), %eax
    movl	%eax, 36(%esp)
    fldl	40(%esp)
	fchs
    fstpl	16(%esp)
    fldl	16(%esp)
    fnstcw	-4(%esp)
    movzwl	-4(%esp), %eax
    orb	$12, %ah
    movw	%ax, -6(%esp)
    fldcw	-6(%esp)
    fistps	34(%esp)
    fldcw	-4(%esp)
    movl	50(%esp), %eax
	negl	 %eax
    movl	%eax, 12(%esp)
    fildl	12(%esp)
    fstpl	26(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	36(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	34(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	26(%esp)
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
    call	_simple_minus
    call	_mix_minus
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target -1: %d\n"
LC1:
    .string	"target -1.0: %f\n"
FLOAT0:
    .long	0
    .long	1072693248
