//by latin

    .text
    .globl	_assign_boolean
_assign_boolean:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$44, %esp
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jge L2
L0:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L2
L1:
    movl	$1, %eax
    movl	%eax, 40(%esp)
    jmp L3
L2:
    movl	$0, %eax
    movl	%eax, 40(%esp)
L3:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	40(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jge L6
L4:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L6
L5:
    movl	$1, %eax
    movl	%eax, 36(%esp)
    jmp L7
L6:
    movl	$0, %eax
    movl	%eax, 36(%esp)
L7:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	36(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 32(%esp)
    leal	32(%esp), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 28(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	32(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 20(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	20(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jge L10
L8:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L10
L9:
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 16(%esp)
    movl	28(%esp), %eax
    movl	$1, %edx
    movl	%edx, (%eax)
    jmp L11
L10:
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 12(%esp)
    movl	28(%esp), %eax
    movl	$0, %edx
    movl	%edx, (%eax)
L11:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	32(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 8(%esp)
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
    call	_assign_boolean
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
    .string	"target 777: %d\n"
