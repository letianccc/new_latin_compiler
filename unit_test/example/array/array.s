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
    subl	$46, %esp
    movl	$0, %eax
    movl	%eax, %ecx
    movl	$1, %eax
    movl	%eax, 36(%esp, %ecx, 4)
    movl	$0, %eax
    movl	%eax, %ecx
    movl	36(%esp, %ecx, 4), %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, 28(%esp)
    movl	$0, %eax
    movl	%eax, %ecx
    movl	36(%esp, %ecx, 4), %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	%eax, 24(%esp)
    movl	$0, %eax
    movl	%eax, %ecx
    movl	36(%esp, %ecx, 4), %eax
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
