//by latin

    .text
    .globl	_sub
_sub:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$674, %esp
    fldl	FLOAT0
    fstpl	666(%esp)
    movl	$1, %eax
    movl	%eax, 662(%esp)
    fldl	666(%esp)
    fldl	FLOAT2
    fsubp	%st, %st(1)
    fstpl	412(%esp)
    fldl	412(%esp)
    fstpl	654(%esp)
    fldl	FLOAT2
    fldl	666(%esp)
    fsubp	%st, %st(1)
    fstpl	404(%esp)
    fldl	404(%esp)
    fstpl	646(%esp)
    fldl	666(%esp)
    fildl	662(%esp)
    fsubp	%st, %st(1)
    fstpl	396(%esp)
    fldl	396(%esp)
    fstpl	638(%esp)
    fildl	662(%esp)
    fldl	666(%esp)
    fsubp	%st, %st(1)
    fstpl	388(%esp)
    fldl	388(%esp)
    fstpl	630(%esp)
    fldl	FLOAT3
    fstpl	380(%esp)
    fldl	380(%esp)
    fstpl	622(%esp)
    fldl	FLOAT4
    fstpl	372(%esp)
    fldl	372(%esp)
    fstpl	614(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	654(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	638(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	646(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	630(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    fldl	622(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    fldl	614(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT5
    fstpl	364(%esp)
    fldl	FLOAT2
    fldl	364(%esp)
    fsubp	%st, %st(1)
    fstpl	356(%esp)
    fldl	356(%esp)
    fstpl	606(%esp)
    fldl	FLOAT6
    fstpl	348(%esp)
    fldl	FLOAT2
    fldl	348(%esp)
    fsubp	%st, %st(1)
    fstpl	340(%esp)
    fldl	340(%esp)
    fstpl	598(%esp)
    movl	$0, %eax
    movl	%eax, 336(%esp)
    fldl	FLOAT0
    fildl	336(%esp)
    fsubp	%st, %st(1)
    fstpl	328(%esp)
    fldl	328(%esp)
    fstpl	590(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    fldl	606(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	598(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	590(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT4
    fstpl	320(%esp)
    fldl	FLOAT2
    fldl	320(%esp)
    fsubp	%st, %st(1)
    fstpl	312(%esp)
    fldl	312(%esp)
    fstpl	582(%esp)
    fldl	FLOAT3
    fstpl	304(%esp)
    fldl	FLOAT2
    fldl	304(%esp)
    fsubp	%st, %st(1)
    fstpl	296(%esp)
    fldl	296(%esp)
    fstpl	574(%esp)
    movl	$0, %eax
    movl	%eax, 292(%esp)
    fldl	FLOAT1
    fildl	292(%esp)
    fsubp	%st, %st(1)
    fstpl	284(%esp)
    fldl	284(%esp)
    fstpl	566(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    fldl	582(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    fldl	574(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    fldl	566(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT7
    fstpl	276(%esp)
    fldl	FLOAT2
    fldl	276(%esp)
    fsubp	%st, %st(1)
    fstpl	268(%esp)
    fldl	268(%esp)
    fstpl	558(%esp)
    fldl	FLOAT6
    fstpl	260(%esp)
    fldl	FLOAT1
    fldl	260(%esp)
    fsubp	%st, %st(1)
    fstpl	252(%esp)
    fldl	252(%esp)
    fstpl	550(%esp)
    fldl	FLOAT5
    fstpl	244(%esp)
    fldl	FLOAT1
    fldl	244(%esp)
    fsubp	%st, %st(1)
    fstpl	236(%esp)
    fldl	236(%esp)
    fstpl	542(%esp)
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	558(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC9, %eax
    movl	%eax, 0(%esp)
    fldl	550(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	542(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT8
    fstpl	228(%esp)
    fldl	FLOAT2
    fldl	228(%esp)
    fsubp	%st, %st(1)
    fstpl	220(%esp)
    fldl	220(%esp)
    fstpl	534(%esp)
    fldl	FLOAT3
    fstpl	212(%esp)
    fldl	FLOAT1
    fldl	212(%esp)
    fsubp	%st, %st(1)
    fstpl	204(%esp)
    fldl	204(%esp)
    fstpl	526(%esp)
    fldl	FLOAT4
    fstpl	196(%esp)
    fldl	FLOAT1
    fldl	196(%esp)
    fsubp	%st, %st(1)
    fstpl	188(%esp)
    fldl	188(%esp)
    fstpl	518(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    fldl	534(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC11, %eax
    movl	%eax, 0(%esp)
    fldl	526(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    fldl	518(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT1
    fildl	662(%esp)
    fsubp	%st, %st(1)
    fstpl	180(%esp)
    fldl	FLOAT2
    fldl	180(%esp)
    fsubp	%st, %st(1)
    fstpl	172(%esp)
    fldl	172(%esp)
    fstpl	510(%esp)
    fldl	FLOAT3
    fstpl	164(%esp)
    fildl	662(%esp)
    fldl	164(%esp)
    fsubp	%st, %st(1)
    fstpl	156(%esp)
    fldl	156(%esp)
    fstpl	502(%esp)
    movl	$1, %eax
    movl	662(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 152(%esp)
    fldl	FLOAT1
    fildl	152(%esp)
    fsubp	%st, %st(1)
    fstpl	144(%esp)
    fldl	144(%esp)
    fstpl	494(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    fldl	510(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    fldl	502(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    fldl	494(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	396(%esp)
    fstpl	136(%esp)
    fldl	FLOAT2
    fldl	136(%esp)
    fsubp	%st, %st(1)
    fstpl	128(%esp)
    fldl	128(%esp)
    fstpl	486(%esp)
    fldl	412(%esp)
    fstpl	120(%esp)
    fildl	662(%esp)
    fldl	120(%esp)
    fsubp	%st, %st(1)
    fstpl	112(%esp)
    fldl	112(%esp)
    fstpl	478(%esp)
    movl	152(%esp), %eax
    movl	%eax, 108(%esp)
    fldl	666(%esp)
    fildl	108(%esp)
    fsubp	%st, %st(1)
    fstpl	100(%esp)
    fldl	100(%esp)
    fstpl	470(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	486(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	478(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	470(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$1, %eax
    movw	%ax, 468(%esp)
    fldl	666(%esp)
    filds	468(%esp)
    fsubp	%st, %st(1)
    fstpl	92(%esp)
    fldl	FLOAT2
    fldl	92(%esp)
    fsubp	%st, %st(1)
    fstpl	84(%esp)
    fldl	84(%esp)
    fstpl	460(%esp)
    fldl	412(%esp)
    fstpl	76(%esp)
    filds	468(%esp)
    fldl	76(%esp)
    fsubp	%st, %st(1)
    fstpl	68(%esp)
    fldl	68(%esp)
    fstpl	452(%esp)
    movl	$1, %eax
    movswl	468(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 64(%esp)
    fldl	666(%esp)
    fildl	64(%esp)
    fsubp	%st, %st(1)
    fstpl	56(%esp)
    fldl	56(%esp)
    fstpl	444(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	460(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	452(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	444(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	92(%esp)
    fstpl	48(%esp)
    fildl	662(%esp)
    fldl	48(%esp)
    fsubp	%st, %st(1)
    fstpl	40(%esp)
    fldl	40(%esp)
    fstpl	436(%esp)
    fldl	396(%esp)
    fstpl	32(%esp)
    filds	468(%esp)
    fldl	32(%esp)
    fsubp	%st, %st(1)
    fstpl	24(%esp)
    fldl	24(%esp)
    fstpl	428(%esp)
    movl	662(%esp), %eax
    movswl	468(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 20(%esp)
    fldl	666(%esp)
    fildl	20(%esp)
    fsubp	%st, %st(1)
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	420(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	436(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	428(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	420(%esp)
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
    call	_sub
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target -2.1: %f\n"
LC1:
    .string	"target 2.1 : %f\n"
LC2:
    .string	"target -0.1: %f\n"
LC3:
    .string	"target 0.1 : %f\n"
LC4:
    .string	"target 1.1 : %f\n"
LC5:
    .string	"target -3.1: %f\n"
LC6:
    .string	"target -0.9: %f\n"
LC7:
    .string	"target -1.1: %f\n"
LC8:
    .string	"target 1   : %f\n"
LC9:
    .string	"target -3.2: %f\n"
LC10:
    .string	"target -1  : %f\n"
LC11:
    .string	"target -1.2: %f\n"
FLOAT0:
    .long	-858993459
    .long	1074318540
FLOAT1:
    .long	-1717986918
    .long	1072798105
FLOAT2:
    .long	0
    .long	1072693248
FLOAT3:
    .long	-1717986912
    .long	-1078355559
FLOAT4:
    .long	-1717986912
    .long	1069128089
FLOAT5:
    .long	-858993459
    .long	1073794252
FLOAT6:
    .long	-858993459
    .long	-1073689396
FLOAT7:
    .long	0
    .long	1073741824
FLOAT8:
    .long	0
    .long	0
