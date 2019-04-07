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
    subl	$52, %esp
    fldl	FLOAT0
    fstpl	44(%esp)
    fldl	FLOAT1
    fstpl	36(%esp)
    fldl	FLOAT2
    fstpl	28(%esp)
    fldl	FLOAT2
    fstpl	20(%esp)
    fldl	FLOAT1
    fstpl	12(%esp)
    fldl	FLOAT0
    fstpl	4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    fldl	28(%esp)
    fstpl	20(%esp)
    fldl	36(%esp)
    fstpl	12(%esp)
    fldl	44(%esp)
    fstpl	4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    fldl	28(%esp)
    fstpl	20(%esp)
    fldl	36(%esp)
    fstpl	12(%esp)
    fldl	FLOAT0
    fstpl	4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    fldl	28(%esp)
    fstpl	20(%esp)
    fldl	FLOAT1
    fstpl	12(%esp)
    fldl	44(%esp)
    fstpl	4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    fldl	FLOAT2
    fstpl	20(%esp)
    fldl	36(%esp)
    fstpl	12(%esp)
    fldl	44(%esp)
    fstpl	4(%esp)
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
    .string	"value: %f, %f, %f\n"
FLOAT0:
    .long	0
    .long	1073217536
FLOAT1:
    .long	0
    .long	1074003968
FLOAT2:
    .long	0
    .long	1074528256
