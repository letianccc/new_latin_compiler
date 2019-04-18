//by latin

    .text
    .globl	_func
_func:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$0, %esp
    fldl	FLOAT0
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_func1
_func1:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$0, %esp
    fldl	FLOAT1
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_func2
_func2:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$4, %esp
    movl	$1, %eax
    movl	%eax, 0(%esp)
    fildl	0(%esp)
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_func3
_func3:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$8, %esp
    fldl	FLOAT0
    fstpl	0(%esp)
    fldl	0(%esp)
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
    subl	$44, %esp
    call	_func
    fstpl	36(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	36(%esp)
    fstpl	4(%esp)
    call	_printf
    call	_func1
    fstpl	28(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	28(%esp)
    fstpl	4(%esp)
    call	_printf
    call	_func2
    fstpl	20(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	20(%esp)
    fstpl	4(%esp)
    call	_printf
    call	_func3
    fstpl	12(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	12(%esp)
    fstpl	4(%esp)
    call	_printf
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 1.1: %f\n"
LC1:
    .string	"target 1: %f\n"
FLOAT0:
    .long	-1717986918
    .long	1072798105
FLOAT1:
    .long	0
    .long	1072693248
