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
    subl	$42, %esp
    movl	$0, %eax
    movl	%eax, 38(%esp)
L0:
    movl	38(%esp), %eax
    movl	$5, %edx
    cmpl	%edx, %eax
    jge L2
L1:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	38(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	38(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 38(%esp)
    jmp L0
L2:
    fldl	FLOAT0
    fstpl	30(%esp)
L3:
    fldl	FLOAT1
    fldl	30(%esp)
    fcompp
    fstsw
    sahf
    jae	L5
L4:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	30(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT2
    fldl	30(%esp)
    faddp	%st, %st(1)
    fstpl	16(%esp)
    fldl	16(%esp)
    fstpl	30(%esp)
    jmp L3
L5:
    movl	$0, %eax
    movw	%ax, 28(%esp)
L6:
    movswl	28(%esp), %eax
    movl	$5, %edx
    cmpl	%edx, %eax
    jge L8
L7:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	28(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movswl	28(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movw	%ax, 28(%esp)
    jmp L6
L8:
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"hello %d\n"
LC1:
    .string	"hello %f\n"
FLOAT0:
    .long	0
    .long	0
FLOAT1:
    .long	0
    .long	1075052544
FLOAT2:
    .long	0
    .long	1072693248
