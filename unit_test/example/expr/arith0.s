//by latin

    .text
    .globl	_add
_add:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$62, %esp
    movl	$1, %eax
    movw	%ax, 60(%esp)
    movl	$1, %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 40(%esp)
    movl	40(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %eax
    movw	%ax, 58(%esp)
    movswl	60(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movw	%ax, 34(%esp)
    movswl	34(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movw	%ax, 32(%esp)
    movswl	32(%esp), %eax
    movw	%ax, 56(%esp)
    movl	$1, %eax
    movswl	60(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 30(%esp)
    movswl	30(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movw	%ax, 28(%esp)
    movswl	28(%esp), %eax
    movw	%ax, 54(%esp)
    movl	$1, %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movswl	60(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 22(%esp)
    movswl	22(%esp), %eax
    movw	%ax, 52(%esp)
    movswl	60(%esp), %eax
    movswl	60(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 20(%esp)
    movswl	20(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movw	%ax, 18(%esp)
    movswl	18(%esp), %eax
    movw	%ax, 50(%esp)
    movl	$1, %eax
    movswl	60(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 16(%esp)
    movswl	16(%esp), %eax
    movswl	60(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 14(%esp)
    movswl	14(%esp), %eax
    movw	%ax, 48(%esp)
    movswl	60(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	12(%esp), %eax
    movswl	60(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movw	%ax, 46(%esp)
    movswl	60(%esp), %eax
    movswl	60(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movswl	60(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 6(%esp)
    movswl	6(%esp), %eax
    movw	%ax, 44(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	58(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	56(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	54(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	52(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	50(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	48(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	46(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	44(%esp), %eax
    movl	%eax, 4(%esp)
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
    .globl	_sub
_sub:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$62, %esp
    movl	$1, %eax
    movw	%ax, 60(%esp)
    movl	$1, %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 40(%esp)
    movl	40(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %eax
    movw	%ax, 58(%esp)
    movswl	60(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movw	%ax, 34(%esp)
    movswl	34(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movw	%ax, 32(%esp)
    movswl	32(%esp), %eax
    movw	%ax, 56(%esp)
    movl	$1, %eax
    movswl	60(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 30(%esp)
    movswl	30(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movw	%ax, 28(%esp)
    movswl	28(%esp), %eax
    movw	%ax, 54(%esp)
    movl	$1, %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movswl	60(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 22(%esp)
    movswl	22(%esp), %eax
    movw	%ax, 52(%esp)
    movswl	60(%esp), %eax
    movswl	60(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 20(%esp)
    movswl	20(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movw	%ax, 18(%esp)
    movswl	18(%esp), %eax
    movw	%ax, 50(%esp)
    movl	$1, %eax
    movswl	60(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 16(%esp)
    movswl	16(%esp), %eax
    movswl	60(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 14(%esp)
    movswl	14(%esp), %eax
    movw	%ax, 48(%esp)
    movswl	60(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	12(%esp), %eax
    movswl	60(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movw	%ax, 46(%esp)
    movswl	60(%esp), %eax
    movswl	60(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movswl	60(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 6(%esp)
    movswl	6(%esp), %eax
    movw	%ax, 44(%esp)
    movl	$LC9, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	58(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	56(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	54(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	52(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	50(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	48(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	46(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	44(%esp), %eax
    movl	%eax, 4(%esp)
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
    .globl	_add_sub
_add_sub:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$116, %esp
    movl	$1, %eax
    movw	%ax, 114(%esp)
    movl	$1, %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 78(%esp)
    movl	78(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 74(%esp)
    movl	74(%esp), %eax
    movw	%ax, 112(%esp)
    movl	$1, %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 70(%esp)
    movl	70(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 66(%esp)
    movl	66(%esp), %eax
    movw	%ax, 110(%esp)
    movswl	114(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movw	%ax, 64(%esp)
    movswl	64(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movw	%ax, 62(%esp)
    movswl	62(%esp), %eax
    movw	%ax, 108(%esp)
    movl	$1, %eax
    movswl	114(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 60(%esp)
    movswl	60(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movw	%ax, 58(%esp)
    movswl	58(%esp), %eax
    movw	%ax, 106(%esp)
    movl	$1, %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 54(%esp)
    movl	54(%esp), %eax
    movswl	114(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 52(%esp)
    movswl	52(%esp), %eax
    movw	%ax, 104(%esp)
    movswl	114(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movw	%ax, 50(%esp)
    movswl	50(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movw	%ax, 48(%esp)
    movswl	48(%esp), %eax
    movw	%ax, 102(%esp)
    movl	$1, %eax
    movswl	114(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 46(%esp)
    movswl	46(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movw	%ax, 44(%esp)
    movswl	44(%esp), %eax
    movw	%ax, 100(%esp)
    movl	$1, %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 40(%esp)
    movl	40(%esp), %eax
    movswl	114(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 38(%esp)
    movswl	38(%esp), %eax
    movw	%ax, 98(%esp)
    movswl	114(%esp), %eax
    movswl	114(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 36(%esp)
    movswl	36(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movw	%ax, 34(%esp)
    movswl	34(%esp), %eax
    movw	%ax, 96(%esp)
    movl	$1, %eax
    movswl	114(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 32(%esp)
    movswl	32(%esp), %eax
    movswl	114(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 30(%esp)
    movswl	30(%esp), %eax
    movw	%ax, 94(%esp)
    movswl	114(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movw	%ax, 28(%esp)
    movswl	28(%esp), %eax
    movswl	114(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 26(%esp)
    movswl	26(%esp), %eax
    movw	%ax, 92(%esp)
    movswl	114(%esp), %eax
    movswl	114(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 24(%esp)
    movswl	24(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movw	%ax, 22(%esp)
    movswl	22(%esp), %eax
    movw	%ax, 90(%esp)
    movl	$1, %eax
    movswl	114(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 20(%esp)
    movswl	20(%esp), %eax
    movswl	114(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 18(%esp)
    movswl	18(%esp), %eax
    movw	%ax, 88(%esp)
    movswl	114(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movw	%ax, 16(%esp)
    movswl	16(%esp), %eax
    movswl	114(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 14(%esp)
    movswl	14(%esp), %eax
    movw	%ax, 86(%esp)
    movswl	114(%esp), %eax
    movswl	114(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	12(%esp), %eax
    movswl	114(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movw	%ax, 84(%esp)
    movswl	114(%esp), %eax
    movswl	114(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movswl	114(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 6(%esp)
    movswl	6(%esp), %eax
    movw	%ax, 82(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	112(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	110(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	108(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	106(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	104(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	102(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	100(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	98(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	96(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC11, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	94(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC12, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	92(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC13, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	90(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC14, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	88(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC15, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	86(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	84(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC17, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	82(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC18, %eax
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
    subl	$62, %esp
    movl	$2, %eax
    movw	%ax, 60(%esp)
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 40(%esp)
    movl	$2, %eax
    movl	40(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %eax
    movw	%ax, 58(%esp)
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 32(%esp)
    movswl	60(%esp), %eax
    movl	32(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 30(%esp)
    movswl	30(%esp), %eax
    movw	%ax, 56(%esp)
    movswl	60(%esp), %eax
    movl	$2, %edx
    imull	%edx, %eax
    movw	%ax, 28(%esp)
    movl	$2, %eax
    movswl	28(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 26(%esp)
    movswl	26(%esp), %eax
    movw	%ax, 54(%esp)
    movl	$2, %eax
    movswl	60(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 24(%esp)
    movl	$2, %eax
    movswl	24(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 22(%esp)
    movswl	22(%esp), %eax
    movw	%ax, 52(%esp)
    movswl	60(%esp), %eax
    movl	$2, %edx
    imull	%edx, %eax
    movw	%ax, 20(%esp)
    movswl	60(%esp), %eax
    movswl	20(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 18(%esp)
    movswl	18(%esp), %eax
    movw	%ax, 50(%esp)
    movswl	60(%esp), %eax
    movswl	60(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 16(%esp)
    movl	$2, %eax
    movswl	16(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 14(%esp)
    movswl	14(%esp), %eax
    movw	%ax, 48(%esp)
    movl	$2, %eax
    movswl	60(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	60(%esp), %eax
    movswl	12(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movw	%ax, 46(%esp)
    movswl	60(%esp), %eax
    movswl	60(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	60(%esp), %eax
    movswl	8(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 6(%esp)
    movswl	6(%esp), %eax
    movw	%ax, 44(%esp)
    movl	$LC19, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	58(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	56(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	54(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	52(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	50(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	48(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	46(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	44(%esp), %eax
    movl	%eax, 4(%esp)
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
    .globl	_arith
_arith:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$84, %esp
    movl	$2, %eax
    movw	%ax, 82(%esp)
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 64(%esp)
    movl	64(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 60(%esp)
    movl	60(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 56(%esp)
    movl	56(%esp), %eax
    movw	%ax, 80(%esp)
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 52(%esp)
    movl	$2, %eax
    movl	52(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 48(%esp)
    movl	48(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 44(%esp)
    movl	44(%esp), %eax
    movw	%ax, 78(%esp)
    movl	$2, %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 40(%esp)
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 36(%esp)
    movl	40(%esp), %eax
    movl	36(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movw	%ax, 76(%esp)
    movswl	82(%esp), %eax
    movl	$2, %edx
    imull	%edx, %eax
    movw	%ax, 30(%esp)
    movswl	30(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movw	%ax, 28(%esp)
    movswl	28(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movw	%ax, 26(%esp)
    movswl	26(%esp), %eax
    movw	%ax, 74(%esp)
    movl	$2, %eax
    movswl	82(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 24(%esp)
    movl	$2, %eax
    movswl	24(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 22(%esp)
    movswl	22(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movw	%ax, 20(%esp)
    movswl	20(%esp), %eax
    movw	%ax, 72(%esp)
    movl	$2, %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 16(%esp)
    movswl	82(%esp), %eax
    movl	$2, %edx
    imull	%edx, %eax
    movw	%ax, 14(%esp)
    movl	16(%esp), %eax
    movswl	14(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	12(%esp), %eax
    movw	%ax, 70(%esp)
    movswl	82(%esp), %eax
    movswl	82(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	82(%esp), %eax
    movswl	10(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movswl	82(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 6(%esp)
    movswl	6(%esp), %eax
    movw	%ax, 68(%esp)
    movl	$LC20, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	80(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	78(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	76(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	74(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	72(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	70(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	68(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, %eax
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
    call	_add
    call	_sub
    call	_add_sub
    call	_mul
    call	_arith
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"\nadd target: 3\n"
LC1:
    .string	"value1: %d\n"
LC2:
    .string	"value2: %d\n"
LC3:
    .string	"value3: %d\n"
LC4:
    .string	"value4: %d\n"
LC5:
    .string	"value5: %d\n"
LC6:
    .string	"value6: %d\n"
LC7:
    .string	"value7: %d\n"
LC8:
    .string	"value8: %d\n"
LC9:
    .string	"\nsub target: -1\n"
LC10:
    .string	"\nadd and sub target: 1\n"
LC11:
    .string	"value9: %d\n"
LC12:
    .string	"value10: %d\n"
LC13:
    .string	"value11: %d\n"
LC14:
    .string	"value12: %d\n"
LC15:
    .string	"value13: %d\n"
LC16:
    .string	"value14: %d\n"
LC17:
    .string	"value15: %d\n"
LC18:
    .string	"value16: %d\n"
LC19:
    .string	"\nmul target: 8\n"
LC20:
    .string	"\narith target: 8\n"
