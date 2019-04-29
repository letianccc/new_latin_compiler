//by latin

    .text
    .globl	_access1
_access1:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$72, %esp
    leal	32(%esp), %edx
    movl	$0, %eax
    movl	$10, %ecx
    movl	%edx, %edi
    rep	stosl
    movl	$0, %ecx
    movl	$1, %eax
    movl	%eax, 32(%esp, %ecx, 4)
    movl	$0, %ecx
    movl	32(%esp, %ecx, 4), %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, 28(%esp)
    movl	$0, %ecx
    movl	32(%esp, %ecx, 4), %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	%eax, 24(%esp)
    movl	$0, %ecx
    movl	32(%esp, %ecx, 4), %eax
    movl	%eax, 8(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	28(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	24(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_access2
_access2:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$100, %esp
    leal	60(%esp), %edx
    movl	$0, %eax
    movl	$10, %ecx
    movl	%edx, %edi
    rep	stosl
    movl	$1, %eax
    movl	%eax, 60(%esp)
    movl	$2, %eax
    movl	%eax, 64(%esp)
    movl	$3, %eax
    movl	%eax, 68(%esp)
    movl	$4, %eax
    movl	%eax, 72(%esp)
    movl	$5, %eax
    movl	%eax, 76(%esp)
    movl	$6, %eax
    movl	%eax, 80(%esp)
    movl	$1, %eax
    movl	%eax, 56(%esp)
    movl	$1, %eax
    movl	%eax, 52(%esp)
    movl	52(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 48(%esp)
    movl	48(%esp), %ecx
    movl	60(%esp, %ecx, 4), %eax
    movl	%eax, 44(%esp)
    movl	44(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 40(%esp)
    movl	56(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %ecx
    movl	40(%esp), %eax
    movl	%eax, 60(%esp, %ecx, 4)
    movl	$2, %ecx
    movl	60(%esp, %ecx, 4), %eax
    movl	%eax, 32(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    movl	32(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	52(%esp), %eax
    movl	$2, %edx
    addl	%edx, %eax
    movl	%eax, 28(%esp)
    movl	28(%esp), %ecx
    movl	60(%esp, %ecx, 4), %eax
    movl	%eax, 24(%esp)
    movl	56(%esp), %ecx
    movl	60(%esp, %ecx, 4), %eax
    movl	%eax, 20(%esp)
    movl	24(%esp), %eax
    movl	20(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 16(%esp)
    movl	56(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %ecx
    movl	16(%esp), %eax
    movl	%eax, 60(%esp, %ecx, 4)
    movl	$2, %ecx
    movl	60(%esp, %ecx, 4), %eax
    movl	%eax, 8(%esp)
    movl	$LC3, %eax
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
    .globl	_init
_init:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$64, %esp
    leal	24(%esp), %edx
    movl	$0, %eax
    movl	$10, %ecx
    movl	%edx, %edi
    rep	stosl
    movl	$3, %eax
    movl	%eax, 24(%esp)
    movl	$4, %eax
    movl	%eax, 28(%esp)
    movl	$5, %eax
    movl	%eax, 32(%esp)
    movl	$6, %eax
    movl	%eax, 36(%esp)
    movl	$0, %ecx
    movl	24(%esp, %ecx, 4), %eax
    movl	%eax, 20(%esp)
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    movl	20(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %ecx
    movl	24(%esp, %ecx, 4), %eax
    movl	%eax, 16(%esp)
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    movl	16(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$2, %ecx
    movl	24(%esp, %ecx, 4), %eax
    movl	%eax, 12(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$3, %ecx
    movl	24(%esp, %ecx, 4), %eax
    movl	%eax, 8(%esp)
    movl	$LC3, %eax
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
    call	_access1
    call	_access2
    call	_init
    call	_getchar
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
    .string	"target 5: %d\n"
LC3:
    .string	"target 6: %d\n"
LC4:
    .string	"target 3: %d\n"
LC5:
    .string	"target 4: %d\n"
