//by latin

    .text
    .globl	_identity
_identity:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$76, %esp
    movl	$1, %eax
    movl	%eax, 72(%esp)
    movl	$0, %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %eax
    movl	%eax, 68(%esp)
    movl	72(%esp), %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movl	%eax, 64(%esp)
    movl	72(%esp), %eax
	negl	 %eax
    movl	%eax, 28(%esp)
    movl	28(%esp), %eax
    movl	%eax, 60(%esp)
    movl	72(%esp), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 56(%esp)
    movl	72(%esp), %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, 52(%esp)
    movl	72(%esp), %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	%eax, 48(%esp)
    movl	$0, %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	%eax, 44(%esp)
    movl	72(%esp), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 40(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	68(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	64(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    movl	60(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	56(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	52(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	48(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	44(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	40(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_add_constant_folding
_add_constant_folding:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$42, %esp
    movl	$2, %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 38(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    movl	38(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movw	%ax, 36(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    movswl	36(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT2
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	28(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    fldl	28(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_sub_constant_folding
_sub_constant_folding:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$42, %esp
    movl	$2, %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 38(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    movl	38(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movw	%ax, 36(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    movswl	36(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT2
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	28(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    fldl	28(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_mul_constant_folding
_mul_constant_folding:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$42, %esp
    movl	$2, %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 38(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    movl	38(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movw	%ax, 36(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    movswl	36(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT2
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	28(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    fldl	28(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_constant_folding
_constant_folding:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$0, %esp
    call	_add_constant_folding
    call	_sub_constant_folding
    call	_mul_constant_folding
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_reduction
_reduction:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$20, %esp
    movl	$1, %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	16(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 12(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    movl	12(%esp), %eax
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
    call	_constant_folding
    call	_reduction
    call	_identity
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 0 : %d\n"
LC1:
    .string	"target 1 : %d\n"
LC2:
    .string	"target -1: %d\n"
LC3:
    .string	"target 2: %d\n"
LC4:
    .string	"target 2.5: %f\n"
FLOAT0:
    .long	0
    .long	1073217536
FLOAT1:
    .long	0
    .long	1074528256
FLOAT2:
    .long	0
    .long	1074003968
FLOAT3:
    .long	0
    .long	1072693248
