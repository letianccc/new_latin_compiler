//by latin

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
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	38(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movw	%ax, 36(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	36(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT2
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	28(%esp)
    movl	$LC1, %eax
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
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	38(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movw	%ax, 36(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	36(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT2
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	28(%esp)
    movl	$LC1, %eax
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
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	38(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movw	%ax, 36(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	36(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT2
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	28(%esp)
    movl	$LC1, %eax
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
