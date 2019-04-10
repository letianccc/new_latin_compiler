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
    subl	$64, %esp
    movl	$30000, %eax
    movw	%ax, 62(%esp)
    movl	$30000, %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movl	%eax, 42(%esp)
    movl	42(%esp), %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movl	%eax, 38(%esp)
    movl	38(%esp), %eax
    movw	%ax, 60(%esp)
    movswl	62(%esp), %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movw	%ax, 36(%esp)
    movswl	36(%esp), %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movw	%ax, 34(%esp)
    movswl	34(%esp), %eax
    movw	%ax, 58(%esp)
    movl	$30000, %eax
    movswl	62(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 32(%esp)
    movswl	32(%esp), %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movw	%ax, 30(%esp)
    movswl	30(%esp), %eax
    movw	%ax, 56(%esp)
    movl	$30000, %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movl	%eax, 26(%esp)
    movl	26(%esp), %eax
    movswl	62(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 24(%esp)
    movswl	24(%esp), %eax
    movw	%ax, 54(%esp)
    movswl	62(%esp), %eax
    movswl	62(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 22(%esp)
    movswl	22(%esp), %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movw	%ax, 20(%esp)
    movswl	20(%esp), %eax
    movw	%ax, 52(%esp)
    movl	$30000, %eax
    movswl	62(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 18(%esp)
    movswl	18(%esp), %eax
    movswl	62(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 16(%esp)
    movswl	16(%esp), %eax
    movw	%ax, 50(%esp)
    movswl	62(%esp), %eax
    movl	$30000, %edx
    addl	%edx, %eax
    movw	%ax, 14(%esp)
    movswl	14(%esp), %eax
    movswl	62(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	12(%esp), %eax
    movw	%ax, 48(%esp)
    movswl	62(%esp), %eax
    movswl	62(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movswl	62(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movw	%ax, 46(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	60(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	58(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	56(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	54(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	52(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	50(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	48(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	46(%esp), %eax
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
    .globl	_mul
_mul:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$64, %esp
    movl	$200, %eax
    movw	%ax, 62(%esp)
    movl	$200, %eax
    movl	$200, %edx
    imull	%edx, %eax
    movl	%eax, 42(%esp)
    movl	$200, %eax
    movl	42(%esp), %edx
    imull	%edx, %eax
    movl	%eax, 38(%esp)
    movl	38(%esp), %eax
    movw	%ax, 60(%esp)
    movl	$200, %eax
    movl	$200, %edx
    imull	%edx, %eax
    movl	%eax, 34(%esp)
    movswl	62(%esp), %eax
    movl	34(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 32(%esp)
    movswl	32(%esp), %eax
    movw	%ax, 58(%esp)
    movswl	62(%esp), %eax
    movl	$200, %edx
    imull	%edx, %eax
    movw	%ax, 30(%esp)
    movl	$200, %eax
    movswl	30(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 28(%esp)
    movswl	28(%esp), %eax
    movw	%ax, 56(%esp)
    movl	$200, %eax
    movswl	62(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 26(%esp)
    movl	$200, %eax
    movswl	26(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 24(%esp)
    movswl	24(%esp), %eax
    movw	%ax, 54(%esp)
    movswl	62(%esp), %eax
    movl	$200, %edx
    imull	%edx, %eax
    movw	%ax, 22(%esp)
    movswl	62(%esp), %eax
    movswl	22(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 20(%esp)
    movswl	20(%esp), %eax
    movw	%ax, 52(%esp)
    movswl	62(%esp), %eax
    movswl	62(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 18(%esp)
    movl	$200, %eax
    movswl	18(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 16(%esp)
    movswl	16(%esp), %eax
    movw	%ax, 50(%esp)
    movl	$200, %eax
    movswl	62(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 14(%esp)
    movswl	62(%esp), %eax
    movswl	14(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	12(%esp), %eax
    movw	%ax, 48(%esp)
    movswl	62(%esp), %eax
    movswl	62(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	62(%esp), %eax
    movswl	10(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movw	%ax, 46(%esp)
    movl	$LC9, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	60(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	58(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	56(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	54(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	52(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	50(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	48(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	46(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC10, %eax
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
    subl	$86, %esp
    movl	$300, %eax
    movw	%ax, 84(%esp)
    movl	$300, %eax
    movl	$300, %edx
    imull	%edx, %eax
    movl	%eax, 66(%esp)
    movl	66(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 62(%esp)
    movl	62(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 58(%esp)
    movl	58(%esp), %eax
    movw	%ax, 82(%esp)
    movl	$300, %eax
    movl	$300, %edx
    imull	%edx, %eax
    movl	%eax, 54(%esp)
    movl	$300, %eax
    movl	54(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 50(%esp)
    movl	50(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 46(%esp)
    movl	46(%esp), %eax
    movw	%ax, 80(%esp)
    movl	$300, %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 42(%esp)
    movl	$300, %eax
    movl	$300, %edx
    imull	%edx, %eax
    movl	%eax, 38(%esp)
    movl	42(%esp), %eax
    movl	38(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 34(%esp)
    movl	34(%esp), %eax
    movw	%ax, 78(%esp)
    movswl	84(%esp), %eax
    movl	$300, %edx
    imull	%edx, %eax
    movw	%ax, 32(%esp)
    movswl	32(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movw	%ax, 30(%esp)
    movswl	30(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movw	%ax, 28(%esp)
    movswl	28(%esp), %eax
    movw	%ax, 76(%esp)
    movl	$300, %eax
    movswl	84(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 26(%esp)
    movl	$300, %eax
    movswl	26(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 24(%esp)
    movswl	24(%esp), %eax
    movl	$300, %edx
    addl	%edx, %eax
    movw	%ax, 22(%esp)
    movswl	22(%esp), %eax
    movw	%ax, 74(%esp)
    movl	$300, %eax
    movl	$300, %edx
    addl	%edx, %eax
    movl	%eax, 18(%esp)
    movswl	84(%esp), %eax
    movl	$300, %edx
    imull	%edx, %eax
    movw	%ax, 16(%esp)
    movl	18(%esp), %eax
    movswl	16(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 14(%esp)
    movswl	14(%esp), %eax
    movw	%ax, 72(%esp)
    movswl	84(%esp), %eax
    movswl	84(%esp), %edx
    imull	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	84(%esp), %eax
    movswl	12(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movswl	84(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movw	%ax, 70(%esp)
    movl	$LC11, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	82(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC12, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	80(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC12, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	78(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC12, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	76(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC12, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	74(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC12, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	72(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC12, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	70(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC12, %eax
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
    .string	"\nmul target\n"
LC10:
    .string	"4608: %d\n"
LC11:
    .string	"\narith target\n"
LC12:
    .string	"25064: %d\n"
