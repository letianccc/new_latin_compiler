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
    subl	$108, %esp
    movl	$1, 104(%esp)
    movl	$1, %eax
    addl	$1, %eax
    movl	%eax, 68(%esp)
    movl	68(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 64(%esp)
    movl	64(%esp), %eax
    movl	%eax, 100(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 60(%esp)
    movl	60(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 56(%esp)
    movl	56(%esp), %eax
    movl	%eax, 96(%esp)
    movl	$1, %eax
    addl	104(%esp), %eax
    movl	%eax, 52(%esp)
    movl	52(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 48(%esp)
    movl	48(%esp), %eax
    movl	%eax, 92(%esp)
    movl	$1, %eax
    addl	$1, %eax
    movl	%eax, 44(%esp)
    movl	44(%esp), %eax
    movl	%eax, %eax
    addl	104(%esp), %eax
    movl	%eax, 40(%esp)
    movl	40(%esp), %eax
    movl	%eax, 88(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    addl	104(%esp), %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movl	%eax, 84(%esp)
    movl	$1, %eax
    addl	104(%esp), %eax
    movl	%eax, 28(%esp)
    movl	28(%esp), %eax
    movl	%eax, %eax
    addl	104(%esp), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 80(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, %eax
    addl	104(%esp), %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	%eax, 76(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    addl	104(%esp), %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	%eax, %eax
    addl	104(%esp), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 72(%esp)
    movl	$LC0, 0(%esp)
    call	_printf
    movl	100(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, 0(%esp)
    call	_printf
    movl	96(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, 0(%esp)
    call	_printf
    movl	92(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, 0(%esp)
    call	_printf
    movl	88(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, 0(%esp)
    call	_printf
    movl	84(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, 0(%esp)
    call	_printf
    movl	80(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, 0(%esp)
    call	_printf
    movl	76(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, 0(%esp)
    call	_printf
    movl	72(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC8, 0(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_sub
_sub:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$108, %esp
    movl	$1, 104(%esp)
    movl	$1, %eax
    subl	$1, %eax
    movl	%eax, 68(%esp)
    movl	68(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 64(%esp)
    movl	64(%esp), %eax
    movl	%eax, 100(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 60(%esp)
    movl	60(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 56(%esp)
    movl	56(%esp), %eax
    movl	%eax, 96(%esp)
    movl	$1, %eax
    subl	104(%esp), %eax
    movl	%eax, 52(%esp)
    movl	52(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 48(%esp)
    movl	48(%esp), %eax
    movl	%eax, 92(%esp)
    movl	$1, %eax
    subl	$1, %eax
    movl	%eax, 44(%esp)
    movl	44(%esp), %eax
    movl	%eax, %eax
    subl	104(%esp), %eax
    movl	%eax, 40(%esp)
    movl	40(%esp), %eax
    movl	%eax, 88(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    subl	104(%esp), %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movl	%eax, 84(%esp)
    movl	$1, %eax
    subl	104(%esp), %eax
    movl	%eax, 28(%esp)
    movl	28(%esp), %eax
    movl	%eax, %eax
    subl	104(%esp), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 80(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, %eax
    subl	104(%esp), %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	%eax, 76(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    subl	104(%esp), %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	%eax, %eax
    subl	104(%esp), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 72(%esp)
    movl	$LC9, 0(%esp)
    call	_printf
    movl	100(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, 0(%esp)
    call	_printf
    movl	96(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, 0(%esp)
    call	_printf
    movl	92(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, 0(%esp)
    call	_printf
    movl	88(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, 0(%esp)
    call	_printf
    movl	84(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, 0(%esp)
    call	_printf
    movl	80(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, 0(%esp)
    call	_printf
    movl	76(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, 0(%esp)
    call	_printf
    movl	72(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC8, 0(%esp)
    call	_printf
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
    .text
    .globl	_add_sub
_add_sub:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$204, %esp
    movl	$1, 200(%esp)
    movl	$1, %eax
    addl	$1, %eax
    movl	%eax, 132(%esp)
    movl	132(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 128(%esp)
    movl	128(%esp), %eax
    movl	%eax, 196(%esp)
    movl	$1, %eax
    subl	$1, %eax
    movl	%eax, 124(%esp)
    movl	124(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 120(%esp)
    movl	120(%esp), %eax
    movl	%eax, 192(%esp)
    movl	200(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 116(%esp)
    movl	116(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 112(%esp)
    movl	112(%esp), %eax
    movl	%eax, 188(%esp)
    movl	$1, %eax
    subl	200(%esp), %eax
    movl	%eax, 108(%esp)
    movl	108(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 104(%esp)
    movl	104(%esp), %eax
    movl	%eax, 184(%esp)
    movl	$1, %eax
    subl	$1, %eax
    movl	%eax, 100(%esp)
    movl	100(%esp), %eax
    movl	%eax, %eax
    addl	200(%esp), %eax
    movl	%eax, 96(%esp)
    movl	96(%esp), %eax
    movl	%eax, 180(%esp)
    movl	200(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 92(%esp)
    movl	92(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 88(%esp)
    movl	88(%esp), %eax
    movl	%eax, 176(%esp)
    movl	$1, %eax
    addl	200(%esp), %eax
    movl	%eax, 84(%esp)
    movl	84(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 80(%esp)
    movl	80(%esp), %eax
    movl	%eax, 172(%esp)
    movl	$1, %eax
    addl	$1, %eax
    movl	%eax, 76(%esp)
    movl	76(%esp), %eax
    movl	%eax, %eax
    subl	200(%esp), %eax
    movl	%eax, 72(%esp)
    movl	72(%esp), %eax
    movl	%eax, 168(%esp)
    movl	200(%esp), %eax
    movl	%eax, %eax
    subl	200(%esp), %eax
    movl	%eax, 68(%esp)
    movl	68(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 64(%esp)
    movl	64(%esp), %eax
    movl	%eax, 164(%esp)
    movl	$1, %eax
    subl	200(%esp), %eax
    movl	%eax, 60(%esp)
    movl	60(%esp), %eax
    movl	%eax, %eax
    addl	200(%esp), %eax
    movl	%eax, 56(%esp)
    movl	56(%esp), %eax
    movl	%eax, 160(%esp)
    movl	200(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 52(%esp)
    movl	52(%esp), %eax
    movl	%eax, %eax
    addl	200(%esp), %eax
    movl	%eax, 48(%esp)
    movl	48(%esp), %eax
    movl	%eax, 156(%esp)
    movl	200(%esp), %eax
    movl	%eax, %eax
    addl	200(%esp), %eax
    movl	%eax, 44(%esp)
    movl	44(%esp), %eax
    movl	%eax, %eax
    subl	$1, %eax
    movl	%eax, 40(%esp)
    movl	40(%esp), %eax
    movl	%eax, 152(%esp)
    movl	$1, %eax
    addl	200(%esp), %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %eax
    movl	%eax, %eax
    subl	200(%esp), %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movl	%eax, 148(%esp)
    movl	200(%esp), %eax
    movl	%eax, %eax
    addl	$1, %eax
    movl	%eax, 28(%esp)
    movl	28(%esp), %eax
    movl	%eax, %eax
    subl	200(%esp), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 144(%esp)
    movl	200(%esp), %eax
    movl	%eax, %eax
    addl	200(%esp), %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, %eax
    subl	200(%esp), %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	%eax, 140(%esp)
    movl	200(%esp), %eax
    movl	%eax, %eax
    subl	200(%esp), %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	%eax, %eax
    addl	200(%esp), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 136(%esp)
    movl	$LC10, 0(%esp)
    call	_printf
    movl	196(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, 0(%esp)
    call	_printf
    movl	192(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, 0(%esp)
    call	_printf
    movl	188(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, 0(%esp)
    call	_printf
    movl	184(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, 0(%esp)
    call	_printf
    movl	180(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, 0(%esp)
    call	_printf
    movl	176(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, 0(%esp)
    call	_printf
    movl	172(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, 0(%esp)
    call	_printf
    movl	168(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC8, 0(%esp)
    call	_printf
    movl	164(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC11, 0(%esp)
    call	_printf
    movl	160(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC12, 0(%esp)
    call	_printf
    movl	156(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC13, 0(%esp)
    call	_printf
    movl	152(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC14, 0(%esp)
    call	_printf
    movl	148(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC15, 0(%esp)
    call	_printf
    movl	144(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC16, 0(%esp)
    call	_printf
    movl	140(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC17, 0(%esp)
    call	_printf
    movl	136(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC18, 0(%esp)
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
    subl	$108, %esp
    movl	$2, 104(%esp)
    movl	$2, %eax
    imull	$2, %eax
    movl	%eax, 68(%esp)
    movl	$2, %eax
    imull	68(%esp), %eax
    movl	%eax, 64(%esp)
    movl	64(%esp), %eax
    movl	%eax, 100(%esp)
    movl	$2, %eax
    imull	$2, %eax
    movl	%eax, 60(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    imull	60(%esp), %eax
    movl	%eax, 56(%esp)
    movl	56(%esp), %eax
    movl	%eax, 96(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    imull	$2, %eax
    movl	%eax, 52(%esp)
    movl	$2, %eax
    imull	52(%esp), %eax
    movl	%eax, 48(%esp)
    movl	48(%esp), %eax
    movl	%eax, 92(%esp)
    movl	$2, %eax
    imull	104(%esp), %eax
    movl	%eax, 44(%esp)
    movl	$2, %eax
    imull	44(%esp), %eax
    movl	%eax, 40(%esp)
    movl	40(%esp), %eax
    movl	%eax, 88(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    imull	$2, %eax
    movl	%eax, 36(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    imull	36(%esp), %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movl	%eax, 84(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    imull	104(%esp), %eax
    movl	%eax, 28(%esp)
    movl	$2, %eax
    imull	28(%esp), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 80(%esp)
    movl	$2, %eax
    imull	104(%esp), %eax
    movl	%eax, 20(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    imull	20(%esp), %eax
    movl	%eax, 16(%esp)
    movl	16(%esp), %eax
    movl	%eax, 76(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    imull	104(%esp), %eax
    movl	%eax, 12(%esp)
    movl	104(%esp), %eax
    movl	%eax, %eax
    imull	12(%esp), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 72(%esp)
    movl	$LC19, 0(%esp)
    call	_printf
    movl	100(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, 0(%esp)
    call	_printf
    movl	96(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, 0(%esp)
    call	_printf
    movl	92(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, 0(%esp)
    call	_printf
    movl	88(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, 0(%esp)
    call	_printf
    movl	84(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, 0(%esp)
    call	_printf
    movl	80(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, 0(%esp)
    call	_printf
    movl	76(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, 0(%esp)
    call	_printf
    movl	72(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC8, 0(%esp)
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
    subl	$124, %esp
    movl	$2, 120(%esp)
    movl	$2, %eax
    imull	$2, %eax
    movl	%eax, 88(%esp)
    movl	88(%esp), %eax
    movl	%eax, %eax
    addl	$2, %eax
    movl	%eax, 84(%esp)
    movl	84(%esp), %eax
    movl	%eax, %eax
    addl	$2, %eax
    movl	%eax, 80(%esp)
    movl	80(%esp), %eax
    movl	%eax, 116(%esp)
    movl	$2, %eax
    imull	$2, %eax
    movl	%eax, 76(%esp)
    movl	$2, %eax
    addl	76(%esp), %eax
    movl	%eax, 72(%esp)
    movl	72(%esp), %eax
    movl	%eax, %eax
    addl	$2, %eax
    movl	%eax, 68(%esp)
    movl	68(%esp), %eax
    movl	%eax, 112(%esp)
    movl	$2, %eax
    addl	$2, %eax
    movl	%eax, 64(%esp)
    movl	$2, %eax
    imull	$2, %eax
    movl	%eax, 60(%esp)
    movl	64(%esp), %eax
    movl	%eax, %eax
    addl	60(%esp), %eax
    movl	%eax, 56(%esp)
    movl	56(%esp), %eax
    movl	%eax, 108(%esp)
    movl	120(%esp), %eax
    movl	%eax, %eax
    imull	$2, %eax
    movl	%eax, 52(%esp)
    movl	52(%esp), %eax
    movl	%eax, %eax
    addl	$2, %eax
    movl	%eax, 48(%esp)
    movl	48(%esp), %eax
    movl	%eax, %eax
    addl	$2, %eax
    movl	%eax, 44(%esp)
    movl	44(%esp), %eax
    movl	%eax, 104(%esp)
    movl	$2, %eax
    imull	120(%esp), %eax
    movl	%eax, 40(%esp)
    movl	$2, %eax
    addl	40(%esp), %eax
    movl	%eax, 36(%esp)
    movl	36(%esp), %eax
    movl	%eax, %eax
    addl	$2, %eax
    movl	%eax, 32(%esp)
    movl	32(%esp), %eax
    movl	%eax, 100(%esp)
    movl	$2, %eax
    addl	$2, %eax
    movl	%eax, 28(%esp)
    movl	120(%esp), %eax
    movl	%eax, %eax
    imull	$2, %eax
    movl	%eax, 24(%esp)
    movl	28(%esp), %eax
    movl	%eax, %eax
    addl	24(%esp), %eax
    movl	%eax, 20(%esp)
    movl	20(%esp), %eax
    movl	%eax, 96(%esp)
    movl	120(%esp), %eax
    movl	%eax, %eax
    imull	120(%esp), %eax
    movl	%eax, 16(%esp)
    movl	120(%esp), %eax
    movl	%eax, %eax
    addl	16(%esp), %eax
    movl	%eax, 12(%esp)
    movl	12(%esp), %eax
    movl	%eax, %eax
    addl	120(%esp), %eax
    movl	%eax, 8(%esp)
    movl	8(%esp), %eax
    movl	%eax, 92(%esp)
    movl	$LC20, 0(%esp)
    call	_printf
    movl	116(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC1, 0(%esp)
    call	_printf
    movl	112(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC2, 0(%esp)
    call	_printf
    movl	108(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC3, 0(%esp)
    call	_printf
    movl	104(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC4, 0(%esp)
    call	_printf
    movl	100(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC5, 0(%esp)
    call	_printf
    movl	96(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC6, 0(%esp)
    call	_printf
    movl	92(%esp), %eax
    movl	%eax, 4(%esp)
    movl	$LC7, 0(%esp)
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
    call	_sub
    call	_add_sub
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
    .string	"\nadd target: 3\n"
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
    .string	"\nsub target: -1\n"
LC10:
    .string	"\nadd and sub target: 1\n"
LC11:
    .string	"value9: %d\n"
LC12:
    .string	"value10: %d\n"
LC13:
    .string	"value11: %d\n"
LC14:
    .string	"value12: %d\n"
LC15:
    .string	"value13: %d\n"
LC16:
    .string	"value14: %d\n"
LC17:
    .string	"value15: %d\n"
LC18:
    .string	"value16: %d\n"
LC19:
    .string	"\nmul target: 8\n"
LC20:
    .string	"\narith target: 8\n"
