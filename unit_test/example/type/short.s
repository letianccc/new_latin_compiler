//by latin

    .text
    .globl	_int_to_short
_int_to_short:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$16, %esp
    movl	$70000, %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movw	%ax, 10(%esp)
    movl	$70000, %eax
    movw	%ax, 8(%esp)
    movswl	10(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movswl	8(%esp), %eax
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
    .globl	_mix_add
_mix_add:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$36, %esp
    movl	$1, %eax
    movw	%ax, 34(%esp)
    movl	$2, %eax
    movw	%ax, 32(%esp)
    movl	$3, %eax
    movl	%eax, 28(%esp)
    movl	$4, %eax
    movl	%eax, 24(%esp)
    movswl	34(%esp), %eax
    movswl	32(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 12(%esp)
    movswl	12(%esp), %eax
    movw	%ax, 22(%esp)
    movswl	34(%esp), %eax
    movl	28(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 10(%esp)
    movswl	10(%esp), %eax
    movl	%eax, 18(%esp)
    movl	28(%esp), %eax
    movswl	34(%esp), %edx
    addl	%edx, %eax
    movw	%ax, 8(%esp)
    movswl	8(%esp), %eax
    movl	%eax, 14(%esp)
    movswl	22(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	18(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    call	_printf
    movl	14(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, %eax
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
    call	_int_to_short
    call	_mix_add
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 4464: %d\n"
LC1:
    .string	"target 3: %d\n"
LC2:
    .string	"target 4: %d\n"
