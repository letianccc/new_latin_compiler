//by latin

LC0:
    .string	"aaa%d\n"
    .text
    .globl	_func
_func:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$8, %esp
    movl	20(%ebp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    movl	24(%ebp), %eax
    movl	%eax, 4(%esp)
    movl	$LC0, 0(%esp)
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
    subl	$8, %esp
    movl	$2, 4(%esp)
    movl	$1, 0(%esp)
    call	_func
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
