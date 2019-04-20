//by latin

    .text
    .globl	_bubble
_bubble:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$120, %esp
    leal	80(%esp), %edx
    movl	$0, %eax
    movl	$10, %ecx
    movl	%edx, %edi
    rep	stosl
    movl	$3, %eax
    movl	%eax, 80(%esp)
    movl	$5, %eax
    movl	%eax, 84(%esp)
    movl	$1, %eax
    movl	%eax, 88(%esp)
    movl	$7, %eax
    movl	%eax, 92(%esp)
    movl	$4, %eax
    movl	%eax, 96(%esp)
    movl	$9, %eax
    movl	%eax, 100(%esp)
    movl	$6, %eax
    movl	%eax, 104(%esp)
    movl	$8, %eax
    movl	%eax, 108(%esp)
    movl	$10, %eax
    movl	%eax, 112(%esp)
    movl	$4, %eax
    movl	%eax, 116(%esp)
    movl	$10, %eax
    movl	%eax, 64(%esp)
    movl	$0, %eax
    movl	%eax, 72(%esp)
L0:
    movl	64(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 60(%esp)
    movl	72(%esp), %eax
    movl	60(%esp), %edx
    cmpl	%edx, %eax
    jge L7
L1:
    movl	$0, %eax
    movl	%eax, 68(%esp)
L2:
    movl	64(%esp), %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 56(%esp)
    movl	56(%esp), %eax
    movl	72(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 52(%esp)
    movl	68(%esp), %eax
    movl	52(%esp), %edx
    cmpl	%edx, %eax
    jge L6
L3:
    movl	68(%esp), %eax
    movl	%eax, %ecx
    movl	80(%esp, %ecx, 4), %eax
    movl	%eax, 48(%esp)
    movl	68(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 44(%esp)
    movl	44(%esp), %eax
    movl	%eax, %ecx
    movl	80(%esp, %ecx, 4), %eax
    movl	%eax, 40(%esp)
    movl	48(%esp), %eax
    movl	40(%esp), %edx
    cmpl	%edx, %eax
    jle L5
L4:
    movl	68(%esp), %eax
    movl	%eax, %ecx
    movl	80(%esp, %ecx, 4), %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %eax
    movl	%eax, 76(%esp)
    movl	68(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movl	%eax, %ecx
    movl	80(%esp, %ecx, 4), %eax
    movl	%eax, 28(%esp)
    movl	68(%esp), %eax
    movl	%eax, %ecx
    movl	28(%esp), %eax
    movl	%eax, 80(%esp, %ecx, 4)
    movl	68(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, %ecx
    movl	76(%esp), %eax
    movl	%eax, 80(%esp, %ecx, 4)
L5:
    movl	68(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, 68(%esp)
    jmp L2
L6:
    movl	72(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	%eax, 72(%esp)
    jmp L0
L7:
    movl	$0, %eax
    movl	%eax, 72(%esp)
L8:
    movl	72(%esp), %eax
    movl	64(%esp), %edx
    cmpl	%edx, %eax
    jge L10
L9:
    movl	72(%esp), %eax
    movl	%eax, %ecx
    movl	80(%esp, %ecx, 4), %eax
    movl	%eax, 12(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	12(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	72(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 72(%esp)
    jmp L8
L10:
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_nest_for
_nest_for:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$20, %esp
    movl	$0, %eax
    movl	%eax, 16(%esp)
L11:
    movl	16(%esp), %eax
    movl	$5, %edx
    cmpl	%edx, %eax
    jge L16
L12:
    movl	$0, %eax
    movl	%eax, 12(%esp)
L13:
    movl	12(%esp), %eax
    movl	$5, %edx
    cmpl	%edx, %eax
    jge L15
L14:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	12(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 12(%esp)
    jmp L13
L15:
    movl	16(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 4(%esp)
    movl	4(%esp), %eax
    movl	%eax, 16(%esp)
    jmp L11
L16:
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_single_for
_single_for:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$12, %esp
    movl	$0, %eax
    movl	%eax, 8(%esp)
L17:
    movl	8(%esp), %eax
    movl	$5, %edx
    cmpl	%edx, %eax
    jge L19
L18:
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	8(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 4(%esp)
    movl	4(%esp), %eax
    movl	%eax, 8(%esp)
    jmp L17
L19:
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_access
_access:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$68, %esp
    leal	28(%esp), %edx
    movl	$0, %eax
    movl	$10, %ecx
    movl	%edx, %edi
    rep	stosl
    movl	$0, %eax
    movl	%eax, 24(%esp)
L20:
    movl	24(%esp), %eax
    movl	$10, %edx
    cmpl	%edx, %eax
    jge L22
L21:
    movl	24(%esp), %eax
    movl	%eax, %ecx
    movl	24(%esp), %eax
    movl	%eax, 28(%esp, %ecx, 4)
    movl	24(%esp), %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	%eax, 24(%esp)
    jmp L20
L22:
    movl	$0, %eax
    movl	%eax, 20(%esp)
L23:
    movl	20(%esp), %eax
    movl	$10, %edx
    cmpl	%edx, %eax
    jge L25
L24:
    movl	20(%esp), %eax
    movl	%eax, %ecx
    movl	28(%esp, %ecx, 4), %eax
    movl	%eax, 12(%esp)
    movl	$LC3, %eax
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
    jmp L23
L25:
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
    call	_bubble
    call	_nest_for
    call	_single_for
    call	_access
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"sort %d\n"
LC1:
    .string	"25 hello\n"
LC2:
    .string	"5 hello\n"
LC3:
    .string	"array[i]: %d\n"
