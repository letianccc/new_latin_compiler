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
    cmpl	$2, %eax
    jne L1
L0:
    movl	$3, %eax
    movl	%eax, 20(%esp)
L1:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	20(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movl	%eax, 16(%esp)
    cmpl	$1, 16(%esp)
    jne L3
L2:
    movl	$3, %eax
    movl	%eax, 16(%esp)
L3:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movl	%eax, 12(%esp)
    cmpl	$1, 12(%esp)
    jne L5
L4:
    movl	$3, %eax
    movl	%eax, 12(%esp)
L5:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movw	%ax, 10(%esp)
    cmpw	$1, 10(%esp)
    jne L7
L6:
    movl	$3, %eax
    movw	%ax, 10(%esp)
L7:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movswl	10(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movw	%ax, 8(%esp)
    cmpw	$1, 8(%esp)
    jne L9
L8:
    movl	$3, %eax
    movw	%ax, 8(%esp)
L9:
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
    jne L11
L10:
    movl	$3, %eax
    movl	%eax, 24(%esp)
L11:
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
    jne L13
L12:
    movl	$3, %eax
    movw	%ax, 20(%esp)
L13:
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
    jne L15
L14:
    movl	$3, %eax
    movw	%ax, 14(%esp)
L15:
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
    jne L17
L16:
    movl	$3, %eax
    movl	%eax, 8(%esp)
L17:
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
    jne	L19
L18:
    fldl	FLOAT1
    fstpl	44(%esp)
L19:
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
    jne	L21
L20:
    fldl	FLOAT1
    fstpl	36(%esp)
L21:
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
    jne	L23
L22:
    fldl	FLOAT1
    fstpl	28(%esp)
L23:
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
    jne	L25
L24:
    fldl	FLOAT1
    fstpl	20(%esp)
L25:
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
    .string	"target 3: %d\n"
LC1:
    .string	"target 3.5: %f\n"
FLOAT0:
    .long	0
    .long	1073217536
FLOAT1:
    .long	0
    .long	1074528256