//by latin

    .text
    .globl	_const_compare
_const_compare:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$16, %esp
    fldl	FLOAT1
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    je	L1
L0:
    movl	$2, %eax
    movl	%eax, 12(%esp)
    jmp L2
L1:
    movl	$3, %eax
    movl	%eax, 12(%esp)
L2:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT0
    fldl	FLOAT1
    fcompp
    fstsw
    sahf
    je	L4
L3:
    movl	$2, %eax
    movl	%eax, 8(%esp)
    jmp L5
L4:
    movl	$3, %eax
    movl	%eax, 8(%esp)
L5:
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
    .globl	_main
_main:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$0, %esp
    call	_const_compare
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 2: %d\n"
FLOAT0:
    .long	-1717986918
    .long	1072798105
FLOAT1:
    .long	0
    .long	1073741824
