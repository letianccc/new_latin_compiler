//by latin

    .text
    .globl	_sort
_sort:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$0, %esp
    movl	$1, %ecx
    movl	$111, %eax
    movl	%eax, 20(%ebp, %ecx, 4)
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
    subl	$64, %esp
    leal	24(%esp), %edx
    movl	$0, %eax
    movl	$10, %ecx
    movl	%edx, %edi
    rep	stosl
    movl	$3, %eax
    movl	%eax, 24(%esp)
    movl	$5, %eax
    movl	%eax, 28(%esp)
    movl	$1, %eax
    movl	%eax, 32(%esp)
    movl	$7, %eax
    movl	%eax, 36(%esp)
    movl	$4, %eax
    movl	%eax, 40(%esp)
    movl	$9, %eax
    movl	%eax, 44(%esp)
    movl	$6, %eax
    movl	%eax, 48(%esp)
    movl	$8, %eax
    movl	%eax, 52(%esp)
    movl	$10, %eax
    movl	%eax, 56(%esp)
    movl	$4, %eax
    movl	%eax, 60(%esp)
    movl	24(%esp), %eax
    movl	%eax, 0(%esp)
    call	_sort
    movl	$10, %eax
    movl	%eax, 16(%esp)
    movl	$0, %eax
    movl	%eax, 20(%esp)
L0:
    movl	20(%esp), %eax
    movl	16(%esp), %edx
    cmpl	%edx, %eax
    jge L2
L1:
    movl	20(%esp), %ecx
    movl	24(%esp, %ecx, 4), %eax
    movl	%eax, 12(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	20(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 20(%esp)
    jmp L0
L2:
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"%d\n"
