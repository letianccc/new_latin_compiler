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
    subl	$72, %esp
    movl	$3, %eax
    movl	%eax, 68(%esp)
    movl	$2, %eax
    movl	%eax, 64(%esp)
    movl	$1, %eax
    movl	%eax, 60(%esp)
    movl	$1, %eax
    movl	%eax, 56(%esp)
    movl	$3, %eax
    movl	%eax, 52(%esp)
    movl	60(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 48(%esp)
    movl	48(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	FLOAT0
    fstpl	28(%esp)
    fldl	28(%esp)
    fstpl	4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	FLOAT1
    fstpl	4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	$5, %eax
    movl	%eax, 4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 4(%esp)
    movl	$1, %eax
    movl	%eax, 0(%esp)
    call	_func1
    movl	$2, %eax
    movl	%eax, 4(%esp)
    movl	$1, %eax
    movl	%eax, 0(%esp)
    call	_func2
    call	_func3
    movl	$1, %eax
    movl	%eax, 0(%esp)
    call	_func4
    call	_getchar
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
    subl	$72, %esp
    movl	$3, %eax
    movl	%eax, 68(%esp)
    movl	$2, %eax
    movl	%eax, 64(%esp)
    movl	$1, %eax
    movl	%eax, 60(%esp)
    movl	$1, %eax
    movl	%eax, 56(%esp)
    movl	$3, %eax
    movl	%eax, 52(%esp)
    movl	60(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	$2, %eax
    movl	%eax, 48(%esp)
    movl	48(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	FLOAT0
    fstpl	28(%esp)
    fldl	28(%esp)
    fstpl	4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    fldl	FLOAT1
    fstpl	4(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	$5, %eax
    movl	%eax, 4(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    call	_printf
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
    .globl	_func2
_func2:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$12, %esp
    movl	20(%ebp), %eax
    movl	%eax, 8(%esp)
    movl	20(%ebp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	24(%ebp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
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
    subl	$0, %esp
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_func4
_func4:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$0, %esp
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 1: %d\n"
LC1:
    .string	"target 2: %d\n"
LC2:
    .string	"target 3.5 : %f\n"
LC3:
    .string	"target 4.5 : %f\n"
LC4:
    .string	"target 5   : %d\n"
LC5:
    .string	"target None: None\n"
FLOAT0:
    .long	0
    .long	1074528256
FLOAT1:
    .long	0
    .long	1074921472
