//by latin

    .text
    .globl	_binary_arith
_binary_arith:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$76, %esp
    fldl	FLOAT0
    fstpl	68(%esp)
    fldl	FLOAT1
    fstpl	60(%esp)
    fldl	68(%esp)
    faddl	60(%esp)
    fstpl	28(%esp)
    fldl	28(%esp)
    fstpl	52(%esp)
    fldl	68(%esp)
    fsubl	60(%esp)
    fstpl	20(%esp)
    fldl	20(%esp)
    fstpl	44(%esp)
    fldl	68(%esp)
    fmull	60(%esp)
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	36(%esp)
    fldl	52(%esp)
    fstpl	4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	44(%esp)
    fstpl	4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	36(%esp)
    fstpl	4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_add
_add:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$276, %esp
    fldl	FLOAT1
    fstpl	268(%esp)
    fldl	FLOAT1
    faddl	FLOAT1
    fstpl	164(%esp)
    fldl	164(%esp)
    faddl	FLOAT1
    fstpl	156(%esp)
    fldl	156(%esp)
    fstpl	260(%esp)
    fldl	268(%esp)
    faddl	FLOAT1
    fstpl	148(%esp)
    fldl	148(%esp)
    faddl	FLOAT1
    fstpl	140(%esp)
    fldl	140(%esp)
    fstpl	252(%esp)
    fldl	FLOAT1
    faddl	268(%esp)
    fstpl	132(%esp)
    fldl	132(%esp)
    faddl	FLOAT1
    fstpl	124(%esp)
    fldl	124(%esp)
    fstpl	244(%esp)
    fldl	FLOAT1
    faddl	FLOAT1
    fstpl	116(%esp)
    fldl	116(%esp)
    faddl	268(%esp)
    fstpl	108(%esp)
    fldl	108(%esp)
    fstpl	236(%esp)
    fldl	268(%esp)
    faddl	268(%esp)
    fstpl	100(%esp)
    fldl	100(%esp)
    faddl	FLOAT1
    fstpl	92(%esp)
    fldl	92(%esp)
    fstpl	228(%esp)
    fldl	FLOAT1
    faddl	268(%esp)
    fstpl	84(%esp)
    fldl	84(%esp)
    faddl	268(%esp)
    fstpl	76(%esp)
    fldl	76(%esp)
    fstpl	220(%esp)
    fldl	268(%esp)
    faddl	FLOAT1
    fstpl	68(%esp)
    fldl	68(%esp)
    faddl	268(%esp)
    fstpl	60(%esp)
    fldl	60(%esp)
    fstpl	212(%esp)
    fldl	268(%esp)
    faddl	268(%esp)
    fstpl	52(%esp)
    fldl	52(%esp)
    faddl	268(%esp)
    fstpl	44(%esp)
    fldl	44(%esp)
    fstpl	204(%esp)
    fldl	FLOAT1
    faddl	FLOAT1
    fstpl	36(%esp)
    fldl	36(%esp)
    fstpl	196(%esp)
    fldl	268(%esp)
    faddl	FLOAT1
    fstpl	28(%esp)
    fldl	28(%esp)
    fstpl	188(%esp)
    fldl	FLOAT1
    faddl	268(%esp)
    fstpl	20(%esp)
    fldl	20(%esp)
    fstpl	180(%esp)
    fldl	268(%esp)
    faddl	268(%esp)
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	172(%esp)
    fldl	260(%esp)
    fstpl	4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	252(%esp)
    fstpl	4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	244(%esp)
    fstpl	4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	236(%esp)
    fstpl	4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	228(%esp)
    fstpl	4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	220(%esp)
    fstpl	4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	212(%esp)
    fstpl	4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	204(%esp)
    fstpl	4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	196(%esp)
    fstpl	4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	188(%esp)
    fstpl	4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	180(%esp)
    fstpl	4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	172(%esp)
    fstpl	4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_sub
_sub:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$292, %esp
    fldl	FLOAT1
    fstpl	284(%esp)
    fldl	FLOAT1
    fstpl	276(%esp)
    fldl	FLOAT1
    fstpl	268(%esp)
    fldl	FLOAT1
    fsubl	FLOAT1
    fstpl	164(%esp)
    fldl	164(%esp)
    fsubl	FLOAT1
    fstpl	156(%esp)
    fldl	156(%esp)
    fstpl	260(%esp)
    fldl	284(%esp)
    fsubl	FLOAT1
    fstpl	148(%esp)
    fldl	148(%esp)
    fsubl	FLOAT1
    fstpl	140(%esp)
    fldl	140(%esp)
    fstpl	252(%esp)
    fldl	FLOAT1
    fsubl	276(%esp)
    fstpl	132(%esp)
    fldl	132(%esp)
    fsubl	FLOAT1
    fstpl	124(%esp)
    fldl	124(%esp)
    fstpl	244(%esp)
    fldl	FLOAT1
    fsubl	FLOAT1
    fstpl	116(%esp)
    fldl	116(%esp)
    fsubl	268(%esp)
    fstpl	108(%esp)
    fldl	108(%esp)
    fstpl	236(%esp)
    fldl	284(%esp)
    fsubl	276(%esp)
    fstpl	100(%esp)
    fldl	100(%esp)
    fsubl	FLOAT1
    fstpl	92(%esp)
    fldl	92(%esp)
    fstpl	228(%esp)
    fldl	FLOAT1
    fsubl	276(%esp)
    fstpl	84(%esp)
    fldl	84(%esp)
    fsubl	268(%esp)
    fstpl	76(%esp)
    fldl	76(%esp)
    fstpl	220(%esp)
    fldl	284(%esp)
    fsubl	FLOAT1
    fstpl	68(%esp)
    fldl	68(%esp)
    fsubl	268(%esp)
    fstpl	60(%esp)
    fldl	60(%esp)
    fstpl	212(%esp)
    fldl	284(%esp)
    fsubl	276(%esp)
    fstpl	52(%esp)
    fldl	52(%esp)
    fsubl	268(%esp)
    fstpl	44(%esp)
    fldl	44(%esp)
    fstpl	204(%esp)
    fldl	FLOAT1
    fsubl	FLOAT1
    fstpl	36(%esp)
    fldl	36(%esp)
    fstpl	196(%esp)
    fldl	284(%esp)
    fsubl	FLOAT1
    fstpl	28(%esp)
    fldl	28(%esp)
    fstpl	188(%esp)
    fldl	FLOAT1
    fsubl	276(%esp)
    fstpl	20(%esp)
    fldl	20(%esp)
    fstpl	180(%esp)
    fldl	284(%esp)
    fsubl	276(%esp)
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	172(%esp)
    fldl	260(%esp)
    fstpl	4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	252(%esp)
    fstpl	4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	244(%esp)
    fstpl	4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	236(%esp)
    fstpl	4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	228(%esp)
    fstpl	4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	220(%esp)
    fstpl	4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	212(%esp)
    fstpl	4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	204(%esp)
    fstpl	4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	196(%esp)
    fstpl	4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	188(%esp)
    fstpl	4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	180(%esp)
    fstpl	4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	172(%esp)
    fstpl	4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_mul
_mul:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$292, %esp
    fldl	FLOAT1
    fstpl	284(%esp)
    fldl	FLOAT1
    fstpl	276(%esp)
    fldl	FLOAT1
    fstpl	268(%esp)
    fldl	FLOAT1
    fmull	FLOAT1
    fstpl	164(%esp)
    fldl	FLOAT1
    fmull	164(%esp)
    fstpl	156(%esp)
    fldl	156(%esp)
    fstpl	260(%esp)
    fldl	FLOAT1
    fmull	FLOAT1
    fstpl	148(%esp)
    fldl	284(%esp)
    fmull	148(%esp)
    fstpl	140(%esp)
    fldl	140(%esp)
    fstpl	252(%esp)
    fldl	276(%esp)
    fmull	FLOAT1
    fstpl	132(%esp)
    fldl	FLOAT1
    fmull	132(%esp)
    fstpl	124(%esp)
    fldl	124(%esp)
    fstpl	244(%esp)
    fldl	FLOAT1
    fmull	268(%esp)
    fstpl	116(%esp)
    fldl	FLOAT1
    fmull	116(%esp)
    fstpl	108(%esp)
    fldl	108(%esp)
    fstpl	236(%esp)
    fldl	276(%esp)
    fmull	FLOAT1
    fstpl	100(%esp)
    fldl	284(%esp)
    fmull	100(%esp)
    fstpl	92(%esp)
    fldl	92(%esp)
    fstpl	228(%esp)
    fldl	276(%esp)
    fmull	268(%esp)
    fstpl	84(%esp)
    fldl	FLOAT1
    fmull	84(%esp)
    fstpl	76(%esp)
    fldl	76(%esp)
    fstpl	220(%esp)
    fldl	FLOAT1
    fmull	268(%esp)
    fstpl	68(%esp)
    fldl	284(%esp)
    fmull	68(%esp)
    fstpl	60(%esp)
    fldl	60(%esp)
    fstpl	212(%esp)
    fldl	276(%esp)
    fmull	268(%esp)
    fstpl	52(%esp)
    fldl	284(%esp)
    fmull	52(%esp)
    fstpl	44(%esp)
    fldl	44(%esp)
    fstpl	204(%esp)
    fldl	FLOAT1
    fmull	FLOAT1
    fstpl	36(%esp)
    fldl	36(%esp)
    fstpl	196(%esp)
    fldl	284(%esp)
    fmull	FLOAT1
    fstpl	28(%esp)
    fldl	28(%esp)
    fstpl	188(%esp)
    fldl	FLOAT1
    fmull	276(%esp)
    fstpl	20(%esp)
    fldl	20(%esp)
    fstpl	180(%esp)
    fldl	284(%esp)
    fmull	276(%esp)
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	172(%esp)
    fldl	260(%esp)
    fstpl	4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	252(%esp)
    fstpl	4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	244(%esp)
    fstpl	4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	236(%esp)
    fstpl	4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	228(%esp)
    fstpl	4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	220(%esp)
    fstpl	4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	212(%esp)
    fstpl	4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	204(%esp)
    fstpl	4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	196(%esp)
    fstpl	4(%esp)
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	188(%esp)
    fstpl	4(%esp)
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	180(%esp)
    fstpl	4(%esp)
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	172(%esp)
    fstpl	4(%esp)
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
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
    call	_binary_arith
    call	_add
    call	_sub
    call	_mul
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 2.3: %f\n"
LC1:
    .string	"target 0.1: %f\n"
LC2:
    .string	"target 1.32: %f\n"
LC3:
    .string	"target 3.3: %f\n"
LC4:
    .string	"target 2.2: %f\n"
LC5:
    .string	"target -1.1: %f\n"
LC6:
    .string	"target 0: %f\n"
LC7:
    .string	"target 1.331: %f\n"
LC8:
    .string	"target 1.21: %f\n"
FLOAT0:
    .long	858993459
    .long	1072902963
FLOAT1:
    .long	-1717986918
    .long	1072798105
