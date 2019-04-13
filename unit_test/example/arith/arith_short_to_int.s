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
    movl	$30000, %eax
    movw	%ax, 82(%esp)
    movl	$30000, %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movl	%eax, 62(%esp)
    movl	62(%esp), %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movl	%eax, 58(%esp)
    movl	58(%esp), %eax
    movw	%ax, 80(%esp)
    movswl	82(%esp), %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movl	%eax, 54(%esp)
    movl	54(%esp), %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movl	%eax, 50(%esp)
    movl	50(%esp), %eax
    movw	%ax, 78(%esp)
    movl	$30000, %eax
    movswl	82(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 46(%esp)
    movl	46(%esp), %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movl	%eax, 42(%esp)
    movl	42(%esp), %eax
    movw	%ax, 76(%esp)
    movl	$30000, %eax
    movl	$30000, %edx
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
    movl	$30000, %edx
    addl	%edx, %eax
    movl	%eax, 28(%esp)
    movl	28(%esp), %eax
    movw	%ax, 72(%esp)
    movl	$30000, %eax
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
    movl	$30000, %edx
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
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	76(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	74(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	72(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	70(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	68(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	66(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
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
    movl	$200, %eax
    movw	%ax, 82(%esp)
    movl	$200, %eax
    movl	$200, %edx
    imull	%edx, %eax
    movl	%eax, 62(%esp)
    movl	$200, %eax
    movl	62(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 58(%esp)
    movl	58(%esp), %eax
    movw	%ax, 80(%esp)
    movl	$200, %eax
    movl	$200, %edx
    imull	%edx, %eax
    movl	%eax, 54(%esp)
    movswl	82(%esp), %eax
    movl	54(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 50(%esp)
    movl	50(%esp), %eax
    movw	%ax, 78(%esp)
    movswl	82(%esp), %eax
    movl	$200, %edx
    imull	%edx, %eax
    movl	%eax, 46(%esp)
    movl	$200, %eax
    movl	46(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 42(%esp)
    movl	42(%esp), %eax
    movw	%ax, 76(%esp)
    movl	$200, %eax
    movswl	82(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 38(%esp)
    movl	$200, %eax
    movl	38(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 34(%esp)
    movl	34(%esp), %eax
    movw	%ax, 74(%esp)
    movswl	82(%esp), %eax
    movl	$200, %edx
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
    movl	$200, %eax
    movswl	24(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movw	%ax, 70(%esp)
    movl	$200, %eax
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
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	80(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	78(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	76(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	74(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	72(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	70(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	68(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	66(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
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
    movl	$300, %eax
    movw	%ax, 100(%esp)
    movl	$300, %eax
    movl	$300, %edx
    imull	%edx, %eax
    movl	%eax, 82(%esp)
    movl	82(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 78(%esp)
    movl	78(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 74(%esp)
    movl	74(%esp), %eax
    movw	%ax, 98(%esp)
    movl	$300, %eax
    movl	$300, %edx
    imull	%edx, %eax
    movl	%eax, 70(%esp)
    movl	$300, %eax
    movl	70(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 66(%esp)
    movl	66(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 62(%esp)
    movl	62(%esp), %eax
    movw	%ax, 96(%esp)
    movl	$300, %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 58(%esp)
    movl	$300, %eax
    movl	$300, %edx
    imull	%edx, %eax
    movl	%eax, 54(%esp)
    movl	58(%esp), %eax
    movl	54(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 50(%esp)
    movl	50(%esp), %eax
    movw	%ax, 94(%esp)
    movswl	100(%esp), %eax
    movl	$300, %edx
    imull	%edx, %eax
    movl	%eax, 46(%esp)
    movl	46(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 42(%esp)
    movl	42(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 38(%esp)
    movl	38(%esp), %eax
    movw	%ax, 92(%esp)
    movl	$300, %eax
    movswl	100(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 34(%esp)
    movl	$300, %eax
    movl	34(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 30(%esp)
    movl	30(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 26(%esp)
    movl	26(%esp), %eax
    movw	%ax, 90(%esp)
    movl	$300, %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 22(%esp)
    movswl	100(%esp), %eax
    movl	$300, %edx
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
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	98(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	96(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	94(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	92(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	90(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	88(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	86(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
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
    .string	"\nadd target\n"
LC1:
    .string	"24464: %d\n"
LC2:
    .string	"\nmul target\n"
LC3:
    .string	"4608: %d\n"
LC4:
    .string	"\narith target\n"
LC5:
    .string	"25064: %d\n"
