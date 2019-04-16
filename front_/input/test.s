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
    subl	$16, %esp
    fldl	FLOAT0
    fstpl	8(%esp)
    fldl	FLOAT1
    fstpl	0(%esp)
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
FLOAT0:
    .long	0
    .long	1073217536
FLOAT1:
    .long	0
    .long	1073217536
