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
    subl	$84, %esp
    movl	$1, %eax
    movw	%ax, 82(%esp)
    movl	$1, %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 62(%esp)
    movl	62(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 58(%esp)
    movl	58(%esp), %eax
    movw	%ax, 80(%esp)
    movswl	82(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 54(%esp)
    movl	54(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 50(%esp)
    movl	50(%esp), %eax
    movw	%ax, 78(%esp)
    movl	$1, %eax
    movswl	82(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 46(%esp)
    movl	46(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 42(%esp)
    movl	42(%esp), %eax
    movw	%ax, 76(%esp)
    movl	$1, %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 38(%esp)
    movl	38(%esp), %eax
    movswl	82(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 34(%esp)
    movl	34(%esp), %eax
    movw	%ax, 74(%esp)
    movswl	82(%esp), %eax
    movswl	82(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 32(%esp)
    movswl	32(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 28(%esp)
    movl	28(%esp), %eax
    movw	%ax, 72(%esp)
    movl	$1, %eax
    movswl	82(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movswl	82(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movw	%ax, 70(%esp)
    movswl	82(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movswl	82(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movw	%ax, 68(%esp)
    movswl	82(%esp), %eax
    movswl	82(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movswl	82(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movw	%ax, 66(%esp)
    movl	$LC0, %eax
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
    movswl	66(%esp), %eax
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
    subl	$84, %esp
    movl	$1, %eax
    movw	%ax, 82(%esp)
    movl	$1, %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 62(%esp)
    movl	62(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 58(%esp)
    movl	58(%esp), %eax
    movw	%ax, 80(%esp)
    movswl	82(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 54(%esp)
    movl	54(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 50(%esp)
    movl	50(%esp), %eax
    movw	%ax, 78(%esp)
    movl	$1, %eax
    movswl	82(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 46(%esp)
    movl	46(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 42(%esp)
    movl	42(%esp), %eax
    movw	%ax, 76(%esp)
    movl	$1, %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 38(%esp)
    movl	38(%esp), %eax
    movswl	82(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 34(%esp)
    movl	34(%esp), %eax
    movw	%ax, 74(%esp)
    movswl	82(%esp), %eax
    movswl	82(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 32(%esp)
    movswl	32(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 28(%esp)
    movl	28(%esp), %eax
    movw	%ax, 72(%esp)
    movl	$1, %eax
    movswl	82(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movswl	82(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movw	%ax, 70(%esp)
    movswl	82(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movswl	82(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movw	%ax, 68(%esp)
    movswl	82(%esp), %eax
    movswl	82(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movswl	82(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movw	%ax, 66(%esp)
    movl	$LC9, %eax
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
    movswl	66(%esp), %eax
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
    subl	$158, %esp
    movl	$1, %eax
    movw	%ax, 156(%esp)
    movl	$1, %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 120(%esp)
    movl	120(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 116(%esp)
    movl	116(%esp), %eax
    movw	%ax, 154(%esp)
    movl	$1, %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 112(%esp)
    movl	112(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 108(%esp)
    movl	108(%esp), %eax
    movw	%ax, 152(%esp)
    movswl	156(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 104(%esp)
    movl	104(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 100(%esp)
    movl	100(%esp), %eax
    movw	%ax, 150(%esp)
    movl	$1, %eax
    movswl	156(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 96(%esp)
    movl	96(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 92(%esp)
    movl	92(%esp), %eax
    movw	%ax, 148(%esp)
    movl	$1, %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 88(%esp)
    movl	88(%esp), %eax
    movswl	156(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 84(%esp)
    movl	84(%esp), %eax
    movw	%ax, 146(%esp)
    movswl	156(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 80(%esp)
    movl	80(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 76(%esp)
    movl	76(%esp), %eax
    movw	%ax, 144(%esp)
    movl	$1, %eax
    movswl	156(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 72(%esp)
    movl	72(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 68(%esp)
    movl	68(%esp), %eax
    movw	%ax, 142(%esp)
    movl	$1, %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 64(%esp)
    movl	64(%esp), %eax
    movswl	156(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 60(%esp)
    movl	60(%esp), %eax
    movw	%ax, 140(%esp)
    movswl	156(%esp), %eax
    movswl	156(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 58(%esp)
    movswl	58(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 54(%esp)
    movl	54(%esp), %eax
    movw	%ax, 138(%esp)
    movl	$1, %eax
    movswl	156(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 50(%esp)
    movl	50(%esp), %eax
    movswl	156(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 46(%esp)
    movl	46(%esp), %eax
    movw	%ax, 136(%esp)
    movswl	156(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 42(%esp)
    movl	42(%esp), %eax
    movswl	156(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 38(%esp)
    movl	38(%esp), %eax
    movw	%ax, 134(%esp)
    movswl	156(%esp), %eax
    movswl	156(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 36(%esp)
    movswl	36(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movw	%ax, 132(%esp)
    movl	$1, %eax
    movswl	156(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 28(%esp)
    movl	28(%esp), %eax
    movswl	156(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movw	%ax, 130(%esp)
    movswl	156(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movswl	156(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movw	%ax, 128(%esp)
    movswl	156(%esp), %eax
    movswl	156(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 14(%esp)
    movswl	14(%esp), %eax
    movswl	156(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	12(%esp), %eax
    movw	%ax, 126(%esp)
    movswl	156(%esp), %eax
    movswl	156(%esp), %edx
    subl	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movswl	156(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movw	%ax, 124(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	154(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	152(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	150(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	148(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	146(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	144(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	142(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	140(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	138(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC11, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	136(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC12, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	134(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC13, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	132(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC14, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	130(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC15, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	128(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	126(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC17, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	124(%esp), %eax
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
    subl	$84, %esp
    movl	$2, %eax
    movw	%ax, 82(%esp)
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 62(%esp)
    movl	$2, %eax
    movl	62(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 58(%esp)
    movl	58(%esp), %eax
    movw	%ax, 80(%esp)
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 54(%esp)
    movswl	82(%esp), %eax
    movl	54(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 50(%esp)
    movl	50(%esp), %eax
    movw	%ax, 78(%esp)
    movswl	82(%esp), %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 46(%esp)
    movl	$2, %eax
    movl	46(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 42(%esp)
    movl	42(%esp), %eax
    movw	%ax, 76(%esp)
    movl	$2, %eax
    movswl	82(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 38(%esp)
    movl	$2, %eax
    movl	38(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 34(%esp)
    movl	34(%esp), %eax
    movw	%ax, 74(%esp)
    movswl	82(%esp), %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 30(%esp)
    movswl	82(%esp), %eax
    movl	30(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 26(%esp)
    movl	26(%esp), %eax
    movw	%ax, 72(%esp)
    movswl	82(%esp), %eax
    movswl	82(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 24(%esp)
    movl	$2, %eax
    movswl	24(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movw	%ax, 70(%esp)
    movl	$2, %eax
    movswl	82(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 16(%esp)
    movswl	82(%esp), %eax
    movl	16(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movw	%ax, 68(%esp)
    movswl	82(%esp), %eax
    movswl	82(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	82(%esp), %eax
    movswl	10(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movw	%ax, 66(%esp)
    movl	$LC19, %eax
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
    movswl	66(%esp), %eax
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
    subl	$102, %esp
    movl	$2, %eax
    movw	%ax, 100(%esp)
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 82(%esp)
    movl	82(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 78(%esp)
    movl	78(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 74(%esp)
    movl	74(%esp), %eax
    movw	%ax, 98(%esp)
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 70(%esp)
    movl	$2, %eax
    movl	70(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 66(%esp)
    movl	66(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 62(%esp)
    movl	62(%esp), %eax
    movw	%ax, 96(%esp)
    movl	$2, %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 58(%esp)
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 54(%esp)
    movl	58(%esp), %eax
    movl	54(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 50(%esp)
    movl	50(%esp), %eax
    movw	%ax, 94(%esp)
    movswl	100(%esp), %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 46(%esp)
    movl	46(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 42(%esp)
    movl	42(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 38(%esp)
    movl	38(%esp), %eax
    movw	%ax, 92(%esp)
    movl	$2, %eax
    movswl	100(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 34(%esp)
    movl	$2, %eax
    movl	34(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 30(%esp)
    movl	30(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 26(%esp)
    movl	26(%esp), %eax
    movw	%ax, 90(%esp)
    movl	$2, %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 22(%esp)
    movswl	100(%esp), %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 18(%esp)
    movl	22(%esp), %eax
    movl	18(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 14(%esp)
    movl	14(%esp), %eax
    movw	%ax, 88(%esp)
    movswl	100(%esp), %eax
    movswl	100(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	100(%esp), %eax
    movswl	12(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movswl	100(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movw	%ax, 86(%esp)
    movl	$LC20, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	98(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	96(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	94(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	92(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	90(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	88(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	86(%esp), %eax
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
