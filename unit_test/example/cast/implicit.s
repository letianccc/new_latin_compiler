//by latin

    .text
    .globl	_interger_to_double
_interger_to_double:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$66, %esp
    fldl	FLOAT1
    fstpl	58(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	58(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT1
    fstpl	50(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	50(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$1, %eax
    movl	%eax, 46(%esp)
    fildl	46(%esp)
    fstpl	38(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	38(%esp)
    fstpl	4(%esp)
    call	_printf
    fildl	46(%esp)
    fstpl	30(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	30(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$1, %eax
    movw	%ax, 28(%esp)
    filds	28(%esp)
    fstpl	20(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	20(%esp)
    fstpl	4(%esp)
    call	_printf
    filds	28(%esp)
    fstpl	12(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	12(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_double_to_integer
_double_to_integer:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$40, %esp
    movl	$1, %eax
    movl	%eax, 36(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	36(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movl	%eax, 32(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	32(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT0
    fnstcw	-4(%esp)
    movzwl	-4(%esp), %eax
    orb	$12, %ah
    movw	%ax, -6(%esp)
    fldcw	-6(%esp)
    fistps	30(%esp)
    fldcw	-4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movswl	30(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT0
    fnstcw	-4(%esp)
    movzwl	-4(%esp), %eax
    orb	$12, %ah
    movw	%ax, -6(%esp)
    fldcw	-6(%esp)
    fistps	28(%esp)
    fldcw	-4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movswl	28(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT0
    fstpl	20(%esp)
    fldl	20(%esp)
    fnstcw	-4(%esp)
    movzwl	-4(%esp), %eax
    orb	$12, %ah
    movw	%ax, -6(%esp)
    fldcw	-6(%esp)
    fistpl	16(%esp)
    fldcw	-4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	20(%esp)
    fnstcw	-4(%esp)
    movzwl	-4(%esp), %eax
    orb	$12, %ah
    movw	%ax, -6(%esp)
    fldcw	-6(%esp)
    fistpl	12(%esp)
    fldcw	-4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	20(%esp)
    fnstcw	-4(%esp)
    movzwl	-4(%esp), %eax
    orb	$12, %ah
    movw	%ax, -6(%esp)
    fldcw	-6(%esp)
    fistps	10(%esp)
    fldcw	-4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movswl	10(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	20(%esp)
    fnstcw	-4(%esp)
    movzwl	-4(%esp), %eax
    orb	$12, %ah
    movw	%ax, -6(%esp)
    fldcw	-6(%esp)
    fistps	8(%esp)
    fldcw	-4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movswl	8(%esp), %eax
    movl	%eax, 4(%esp)
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
    call	_interger_to_double
    call	_double_to_integer
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 1: %f\n"
LC1:
    .string	"target 1: %d\n"
FLOAT0:
    .long	0
    .long	1073217536
FLOAT1:
    .long	0
    .long	1072693248
