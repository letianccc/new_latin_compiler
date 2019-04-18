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
    subl	$34, %esp
    fldl	FLOAT0
    fstpl	26(%esp)
L0:
    fldl	FLOAT1
    fldl	26(%esp)
    fcompp
    fstsw
    sahf
    jae	L2
L1:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	26(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT2
    fldl	26(%esp)
    faddp	%st, %st(1)
    fstpl	16(%esp)
    fldl	16(%esp)
    fstpl	26(%esp)
    jmp L0
L2:
    movl	$0, %eax
    movw	%ax, 24(%esp)
L3:
    movswl	24(%esp), %eax
    movl	$5, %edx
    cmpl	%edx, %eax
    jge L5
L4:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	24(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movswl	24(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movw	%ax, 24(%esp)
    jmp L3
L5:
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"hello %f\n"
FLOAT0:
    .long	0
    .long	0
FLOAT1:
    .long	0
    .long	1074266112
FLOAT2:
    .long	0
    .long	1072693248
