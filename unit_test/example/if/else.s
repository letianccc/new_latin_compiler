//by latin

    .text
    .globl	_num_cmp
_num_cmp:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$24, %esp
    movl	$1, %eax
    movl	%eax, 20(%esp)
    movl	$2, %eax
    cmpl	$3, %eax
    jne L1
L0:
    movl	$3, %eax
    movl	%eax, 20(%esp)
    jmp L2
L1:
    movl	$4, %eax
    movl	%eax, 20(%esp)
L2:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	20(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movl	%eax, 16(%esp)
    cmpl	$1, 16(%esp)
    je L4
L3:
    movl	$3, %eax
    movl	%eax, 16(%esp)
    jmp L5
L4:
    movl	$4, %eax
    movl	%eax, 16(%esp)
L5:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movl	%eax, 12(%esp)
    cmpl	$1, 12(%esp)
    je L7
L6:
    movl	$3, %eax
    movl	%eax, 12(%esp)
    jmp L8
L7:
    movl	$4, %eax
    movl	%eax, 12(%esp)
L8:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movw	%ax, 10(%esp)
    cmpw	$1, 10(%esp)
    je L10
L9:
    movl	$3, %eax
    movw	%ax, 10(%esp)
    jmp L11
L10:
    movl	$4, %eax
    movw	%ax, 10(%esp)
L11:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	10(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movw	%ax, 8(%esp)
    cmpw	$1, 8(%esp)
    je L13
L12:
    movl	$3, %eax
    movw	%ax, 8(%esp)
    jmp L14
L13:
    movl	$4, %eax
    movw	%ax, 8(%esp)
L14:
    movl	$LC0, %eax
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
    .globl	_var_cmp
_var_cmp:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$32, %esp
    movl	$1, %eax
    movl	%eax, 28(%esp)
    movl	$1, %eax
    movl	%eax, 24(%esp)
    movl	28(%esp), %eax
    cmpl	%eax, 24(%esp)
    je L16
L15:
    movl	$3, %eax
    movl	%eax, 24(%esp)
    jmp L17
L16:
    movl	$4, %eax
    movl	%eax, 24(%esp)
L17:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	24(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movw	%ax, 22(%esp)
    movl	$1, %eax
    movw	%ax, 20(%esp)
    movzwl	22(%esp), %eax
    cmpw	%ax, 20(%esp)
    je L19
L18:
    movl	$3, %eax
    movw	%ax, 20(%esp)
    jmp L20
L19:
    movl	$4, %eax
    movw	%ax, 20(%esp)
L20:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	20(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movl	%eax, 16(%esp)
    movl	$1, %eax
    movw	%ax, 14(%esp)
    movswl	14(%esp), %eax
    cmpl	%eax, 16(%esp)
    je L22
L21:
    movl	$3, %eax
    movw	%ax, 14(%esp)
    jmp L23
L22:
    movl	$4, %eax
    movw	%ax, 14(%esp)
L23:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	14(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movw	%ax, 12(%esp)
    movl	$1, %eax
    movl	%eax, 8(%esp)
    movswl	12(%esp), %eax
    cmpl	%eax, 8(%esp)
    je L25
L24:
    movl	$3, %eax
    movl	%eax, 8(%esp)
    jmp L26
L25:
    movl	$4, %eax
    movl	%eax, 8(%esp)
L26:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_double_cmp
_double_cmp:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$52, %esp
    fldl	FLOAT0
    fstpl	44(%esp)
    fldl	44(%esp)
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    je	L28
L27:
    fldl	FLOAT1
    fstpl	44(%esp)
    jmp L29
L28:
    fldl	FLOAT2
    fstpl	44(%esp)
L29:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	44(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT0
    fstpl	36(%esp)
    fldl	FLOAT0
    fldl	36(%esp)
    fcompp
    fstsw
    sahf
    je	L31
L30:
    fldl	FLOAT1
    fstpl	36(%esp)
    jmp L32
L31:
    fldl	FLOAT2
    fstpl	36(%esp)
L32:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	36(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT0
    fstpl	28(%esp)
    fldl	28(%esp)
    fldl	28(%esp)
    fcompp
    fstsw
    sahf
    je	L34
L33:
    fldl	FLOAT1
    fstpl	28(%esp)
    jmp L35
L34:
    fldl	FLOAT2
    fstpl	28(%esp)
L35:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	28(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT0
    fstpl	20(%esp)
    fldl	FLOAT0
    fstpl	12(%esp)
    fldl	20(%esp)
    fldl	12(%esp)
    fcompp
    fstsw
    sahf
    je	L37
L36:
    fldl	FLOAT1
    fstpl	20(%esp)
    jmp L38
L37:
    fldl	FLOAT2
    fstpl	20(%esp)
L38:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	20(%esp)
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
    call	_num_cmp
    call	_var_cmp
    call	_double_cmp
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 4: %d\n"
LC1:
    .string	"target 4.5: %f\n"
FLOAT0:
    .long	0
    .long	1073217536
FLOAT1:
    .long	0
    .long	1074528256
FLOAT2:
    .long	0
    .long	1074921472
