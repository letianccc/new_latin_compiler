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
    subl	$534, %esp
    fldl	FLOAT0
    fstpl	526(%esp)
    movl	$1, %eax
    movl	%eax, 522(%esp)
    fldl	526(%esp)
    fldl	FLOAT3
    faddp	%st, %st(1)
    fstpl	320(%esp)
    fldl	320(%esp)
    fstpl	514(%esp)
    fldl	FLOAT3
    fldl	526(%esp)
    faddp	%st, %st(1)
    fstpl	312(%esp)
    fldl	312(%esp)
    fstpl	506(%esp)
    fldl	526(%esp)
    fildl	522(%esp)
    faddp	%st, %st(1)
    fstpl	304(%esp)
    fldl	304(%esp)
    fstpl	498(%esp)
    fildl	522(%esp)
    fldl	526(%esp)
    faddp	%st, %st(1)
    fstpl	296(%esp)
    fldl	296(%esp)
    fstpl	490(%esp)
    fldl	FLOAT0
    fldl	FLOAT3
    faddp	%st, %st(1)
    fstpl	288(%esp)
    fldl	288(%esp)
    fstpl	482(%esp)
    fldl	FLOAT3
    fldl	FLOAT0
    faddp	%st, %st(1)
    fstpl	280(%esp)
    fldl	280(%esp)
    fstpl	474(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	514(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	506(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	498(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	490(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	482(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    fldl	474(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT3
    fldl	FLOAT0
    faddp	%st, %st(1)
    fstpl	272(%esp)
    fldl	FLOAT3
    fldl	272(%esp)
    faddp	%st, %st(1)
    fstpl	264(%esp)
    fldl	264(%esp)
    fstpl	466(%esp)
    fldl	FLOAT0
    fldl	FLOAT3
    faddp	%st, %st(1)
    fstpl	256(%esp)
    fldl	FLOAT3
    fldl	256(%esp)
    faddp	%st, %st(1)
    fstpl	248(%esp)
    fldl	248(%esp)
    fstpl	458(%esp)
    movl	$1, %eax
    movl	$1, %edx
    addl	%edx, %eax
    movl	%eax, 244(%esp)
    fldl	FLOAT0
    fildl	244(%esp)
    faddp	%st, %st(1)
    fstpl	236(%esp)
    fldl	236(%esp)
    fstpl	450(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	466(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	458(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	450(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT0
    fldl	FLOAT0
    faddp	%st, %st(1)
    fstpl	228(%esp)
    fldl	FLOAT3
    fldl	228(%esp)
    faddp	%st, %st(1)
    fstpl	220(%esp)
    fldl	220(%esp)
    fstpl	442(%esp)
    fldl	FLOAT0
    fldl	FLOAT3
    faddp	%st, %st(1)
    fstpl	212(%esp)
    fldl	FLOAT0
    fldl	212(%esp)
    faddp	%st, %st(1)
    fstpl	204(%esp)
    fldl	204(%esp)
    fstpl	434(%esp)
    fldl	FLOAT3
    fldl	FLOAT0
    faddp	%st, %st(1)
    fstpl	196(%esp)
    fldl	FLOAT0
    fldl	196(%esp)
    faddp	%st, %st(1)
    fstpl	188(%esp)
    fldl	188(%esp)
    fstpl	426(%esp)
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    fldl	442(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    fldl	434(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    fldl	426(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT0
    fildl	522(%esp)
    faddp	%st, %st(1)
    fstpl	180(%esp)
    fldl	FLOAT3
    fldl	180(%esp)
    faddp	%st, %st(1)
    fstpl	172(%esp)
    fldl	172(%esp)
    fstpl	418(%esp)
    fldl	FLOAT0
    fldl	FLOAT3
    faddp	%st, %st(1)
    fstpl	164(%esp)
    fildl	522(%esp)
    fldl	164(%esp)
    faddp	%st, %st(1)
    fstpl	156(%esp)
    fldl	156(%esp)
    fstpl	410(%esp)
    movl	$1, %eax
    movl	522(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 152(%esp)
    fldl	FLOAT0
    fildl	152(%esp)
    faddp	%st, %st(1)
    fstpl	144(%esp)
    fldl	144(%esp)
    fstpl	402(%esp)
    fldl	526(%esp)
    fildl	522(%esp)
    faddp	%st, %st(1)
    fstpl	136(%esp)
    fldl	FLOAT3
    fldl	136(%esp)
    faddp	%st, %st(1)
    fstpl	128(%esp)
    fldl	128(%esp)
    fstpl	394(%esp)
    fldl	526(%esp)
    fldl	FLOAT3
    faddp	%st, %st(1)
    fstpl	120(%esp)
    fildl	522(%esp)
    fldl	120(%esp)
    faddp	%st, %st(1)
    fstpl	112(%esp)
    fldl	112(%esp)
    fstpl	386(%esp)
    movl	$1, %eax
    movl	522(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 108(%esp)
    fldl	526(%esp)
    fildl	108(%esp)
    faddp	%st, %st(1)
    fstpl	100(%esp)
    fldl	100(%esp)
    fstpl	378(%esp)
    movl	$1, %eax
    movw	%ax, 376(%esp)
    fldl	526(%esp)
    filds	376(%esp)
    faddp	%st, %st(1)
    fstpl	92(%esp)
    fldl	FLOAT3
    fldl	92(%esp)
    faddp	%st, %st(1)
    fstpl	84(%esp)
    fldl	84(%esp)
    fstpl	368(%esp)
    fldl	526(%esp)
    fldl	FLOAT3
    faddp	%st, %st(1)
    fstpl	76(%esp)
    filds	376(%esp)
    fldl	76(%esp)
    faddp	%st, %st(1)
    fstpl	68(%esp)
    fldl	68(%esp)
    fstpl	360(%esp)
    movl	$1, %eax
    movswl	376(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 64(%esp)
    fldl	526(%esp)
    fildl	64(%esp)
    faddp	%st, %st(1)
    fstpl	56(%esp)
    fldl	56(%esp)
    fstpl	352(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	418(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	410(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	402(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	394(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	386(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	378(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	368(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	360(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	352(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	526(%esp)
    filds	376(%esp)
    faddp	%st, %st(1)
    fstpl	48(%esp)
    fildl	522(%esp)
    fldl	48(%esp)
    faddp	%st, %st(1)
    fstpl	40(%esp)
    fldl	40(%esp)
    fstpl	344(%esp)
    fldl	526(%esp)
    fildl	522(%esp)
    faddp	%st, %st(1)
    fstpl	32(%esp)
    filds	376(%esp)
    fldl	32(%esp)
    faddp	%st, %st(1)
    fstpl	24(%esp)
    fldl	24(%esp)
    fstpl	336(%esp)
    movl	522(%esp), %eax
    movswl	376(%esp), %edx
    addl	%edx, %eax
    movl	%eax, 20(%esp)
    fldl	526(%esp)
    fildl	20(%esp)
    faddp	%st, %st(1)
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	328(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	344(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	336(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    fldl	328(%esp)
    fstpl	4(%esp)
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
    subl	$674, %esp
    fldl	FLOAT1
    fstpl	666(%esp)
    movl	$1, %eax
    movl	%eax, 662(%esp)
    fldl	666(%esp)
    fldl	FLOAT3
    fsubp	%st, %st(1)
    fstpl	412(%esp)
    fldl	412(%esp)
    fstpl	654(%esp)
    fldl	FLOAT3
    fldl	666(%esp)
    fsubp	%st, %st(1)
    fstpl	404(%esp)
    fldl	404(%esp)
    fstpl	646(%esp)
    fldl	666(%esp)
    fildl	662(%esp)
    fsubp	%st, %st(1)
    fstpl	396(%esp)
    fldl	396(%esp)
    fstpl	638(%esp)
    fildl	662(%esp)
    fldl	666(%esp)
    fsubp	%st, %st(1)
    fstpl	388(%esp)
    fldl	388(%esp)
    fstpl	630(%esp)
    fldl	FLOAT0
    fldl	FLOAT3
    fsubp	%st, %st(1)
    fstpl	380(%esp)
    fldl	380(%esp)
    fstpl	622(%esp)
    fldl	FLOAT3
    fldl	FLOAT0
    fsubp	%st, %st(1)
    fstpl	372(%esp)
    fldl	372(%esp)
    fstpl	614(%esp)
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    fldl	654(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC3, %eax
    movl	%eax, 0(%esp)
    fldl	638(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    fldl	646(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC4, %eax
    movl	%eax, 0(%esp)
    fldl	630(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC5, %eax
    movl	%eax, 0(%esp)
    fldl	622(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC6, %eax
    movl	%eax, 0(%esp)
    fldl	614(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT3
    fldl	FLOAT1
    fsubp	%st, %st(1)
    fstpl	364(%esp)
    fldl	FLOAT3
    fldl	364(%esp)
    fsubp	%st, %st(1)
    fstpl	356(%esp)
    fldl	356(%esp)
    fstpl	606(%esp)
    fldl	FLOAT1
    fldl	FLOAT3
    fsubp	%st, %st(1)
    fstpl	348(%esp)
    fldl	FLOAT3
    fldl	348(%esp)
    fsubp	%st, %st(1)
    fstpl	340(%esp)
    fldl	340(%esp)
    fstpl	598(%esp)
    movl	$1, %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 336(%esp)
    fldl	FLOAT1
    fildl	336(%esp)
    fsubp	%st, %st(1)
    fstpl	328(%esp)
    fldl	328(%esp)
    fstpl	590(%esp)
    movl	$LC7, %eax
    movl	%eax, 0(%esp)
    fldl	606(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	598(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	590(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT3
    fldl	FLOAT0
    fsubp	%st, %st(1)
    fstpl	320(%esp)
    fldl	FLOAT3
    fldl	320(%esp)
    fsubp	%st, %st(1)
    fstpl	312(%esp)
    fldl	312(%esp)
    fstpl	582(%esp)
    fldl	FLOAT0
    fldl	FLOAT3
    fsubp	%st, %st(1)
    fstpl	304(%esp)
    fldl	FLOAT3
    fldl	304(%esp)
    fsubp	%st, %st(1)
    fstpl	296(%esp)
    fldl	296(%esp)
    fstpl	574(%esp)
    movl	$1, %eax
    movl	$1, %edx
    subl	%edx, %eax
    movl	%eax, 292(%esp)
    fldl	FLOAT0
    fildl	292(%esp)
    fsubp	%st, %st(1)
    fstpl	284(%esp)
    fldl	284(%esp)
    fstpl	566(%esp)
    movl	$LC9, %eax
    movl	%eax, 0(%esp)
    fldl	582(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    fldl	574(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    fldl	566(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT0
    fldl	FLOAT1
    fsubp	%st, %st(1)
    fstpl	276(%esp)
    fldl	FLOAT3
    fldl	276(%esp)
    fsubp	%st, %st(1)
    fstpl	268(%esp)
    fldl	268(%esp)
    fstpl	558(%esp)
    fldl	FLOAT1
    fldl	FLOAT3
    fsubp	%st, %st(1)
    fstpl	260(%esp)
    fldl	FLOAT0
    fldl	260(%esp)
    fsubp	%st, %st(1)
    fstpl	252(%esp)
    fldl	252(%esp)
    fstpl	550(%esp)
    fldl	FLOAT3
    fldl	FLOAT1
    fsubp	%st, %st(1)
    fstpl	244(%esp)
    fldl	FLOAT0
    fldl	244(%esp)
    fsubp	%st, %st(1)
    fstpl	236(%esp)
    fldl	236(%esp)
    fstpl	542(%esp)
    movl	$LC11, %eax
    movl	%eax, 0(%esp)
    fldl	558(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC12, %eax
    movl	%eax, 0(%esp)
    fldl	550(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC11, %eax
    movl	%eax, 0(%esp)
    fldl	542(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT0
    fldl	FLOAT0
    fsubp	%st, %st(1)
    fstpl	228(%esp)
    fldl	FLOAT3
    fldl	228(%esp)
    fsubp	%st, %st(1)
    fstpl	220(%esp)
    fldl	220(%esp)
    fstpl	534(%esp)
    fldl	FLOAT0
    fldl	FLOAT3
    fsubp	%st, %st(1)
    fstpl	212(%esp)
    fldl	FLOAT0
    fldl	212(%esp)
    fsubp	%st, %st(1)
    fstpl	204(%esp)
    fldl	204(%esp)
    fstpl	526(%esp)
    fldl	FLOAT3
    fldl	FLOAT0
    fsubp	%st, %st(1)
    fstpl	196(%esp)
    fldl	FLOAT0
    fldl	196(%esp)
    fsubp	%st, %st(1)
    fstpl	188(%esp)
    fldl	188(%esp)
    fstpl	518(%esp)
    movl	$LC13, %eax
    movl	%eax, 0(%esp)
    fldl	534(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC14, %eax
    movl	%eax, 0(%esp)
    fldl	526(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC13, %eax
    movl	%eax, 0(%esp)
    fldl	518(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT0
    fildl	662(%esp)
    fsubp	%st, %st(1)
    fstpl	180(%esp)
    fldl	FLOAT3
    fldl	180(%esp)
    fsubp	%st, %st(1)
    fstpl	172(%esp)
    fldl	172(%esp)
    fstpl	510(%esp)
    fldl	FLOAT0
    fldl	FLOAT3
    fsubp	%st, %st(1)
    fstpl	164(%esp)
    fildl	662(%esp)
    fldl	164(%esp)
    fsubp	%st, %st(1)
    fstpl	156(%esp)
    fldl	156(%esp)
    fstpl	502(%esp)
    movl	$1, %eax
    movl	662(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 152(%esp)
    fldl	FLOAT0
    fildl	152(%esp)
    fsubp	%st, %st(1)
    fstpl	144(%esp)
    fldl	144(%esp)
    fstpl	494(%esp)
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    fldl	510(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    fldl	502(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC10, %eax
    movl	%eax, 0(%esp)
    fldl	494(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	666(%esp)
    fildl	662(%esp)
    fsubp	%st, %st(1)
    fstpl	136(%esp)
    fldl	FLOAT3
    fldl	136(%esp)
    fsubp	%st, %st(1)
    fstpl	128(%esp)
    fldl	128(%esp)
    fstpl	486(%esp)
    fldl	666(%esp)
    fldl	FLOAT3
    fsubp	%st, %st(1)
    fstpl	120(%esp)
    fildl	662(%esp)
    fldl	120(%esp)
    fsubp	%st, %st(1)
    fstpl	112(%esp)
    fldl	112(%esp)
    fstpl	478(%esp)
    movl	$1, %eax
    movl	662(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 108(%esp)
    fldl	666(%esp)
    fildl	108(%esp)
    fsubp	%st, %st(1)
    fstpl	100(%esp)
    fldl	100(%esp)
    fstpl	470(%esp)
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	486(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	478(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	470(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$1, %eax
    movw	%ax, 468(%esp)
    fldl	666(%esp)
    filds	468(%esp)
    fsubp	%st, %st(1)
    fstpl	92(%esp)
    fldl	FLOAT3
    fldl	92(%esp)
    fsubp	%st, %st(1)
    fstpl	84(%esp)
    fldl	84(%esp)
    fstpl	460(%esp)
    fldl	666(%esp)
    fldl	FLOAT3
    fsubp	%st, %st(1)
    fstpl	76(%esp)
    filds	468(%esp)
    fldl	76(%esp)
    fsubp	%st, %st(1)
    fstpl	68(%esp)
    fldl	68(%esp)
    fstpl	452(%esp)
    movl	$1, %eax
    movswl	468(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 64(%esp)
    fldl	666(%esp)
    fildl	64(%esp)
    fsubp	%st, %st(1)
    fstpl	56(%esp)
    fldl	56(%esp)
    fstpl	444(%esp)
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	460(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	452(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	444(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	666(%esp)
    filds	468(%esp)
    fsubp	%st, %st(1)
    fstpl	48(%esp)
    fildl	662(%esp)
    fldl	48(%esp)
    fsubp	%st, %st(1)
    fstpl	40(%esp)
    fldl	40(%esp)
    fstpl	436(%esp)
    fldl	666(%esp)
    fildl	662(%esp)
    fsubp	%st, %st(1)
    fstpl	32(%esp)
    filds	468(%esp)
    fldl	32(%esp)
    fsubp	%st, %st(1)
    fstpl	24(%esp)
    fldl	24(%esp)
    fstpl	428(%esp)
    movl	662(%esp), %eax
    movswl	468(%esp), %edx
    subl	%edx, %eax
    movl	%eax, 20(%esp)
    fldl	666(%esp)
    fildl	20(%esp)
    fsubp	%st, %st(1)
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	420(%esp)
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	436(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	428(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC8, %eax
    movl	%eax, 0(%esp)
    fldl	420(%esp)
    fstpl	4(%esp)
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
    subl	$550, %esp
    fldl	FLOAT2
    fstpl	542(%esp)
    movl	$2, %eax
    movl	%eax, 538(%esp)
    fldl	542(%esp)
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	336(%esp)
    fldl	336(%esp)
    fstpl	530(%esp)
    fldl	FLOAT4
    fldl	542(%esp)
    fmulp	%st, %st(1)
    fstpl	328(%esp)
    fldl	328(%esp)
    fstpl	522(%esp)
    fldl	542(%esp)
    fildl	538(%esp)
    fmulp	%st, %st(1)
    fstpl	320(%esp)
    fldl	320(%esp)
    fstpl	514(%esp)
    fildl	538(%esp)
    fldl	542(%esp)
    fmulp	%st, %st(1)
    fstpl	312(%esp)
    fldl	312(%esp)
    fstpl	506(%esp)
    fldl	FLOAT2
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	304(%esp)
    fldl	304(%esp)
    fstpl	498(%esp)
    fldl	FLOAT4
    fldl	FLOAT2
    fmulp	%st, %st(1)
    fstpl	296(%esp)
    fldl	296(%esp)
    fstpl	490(%esp)
    movl	$LC15, %eax
    movl	%eax, 0(%esp)
    fldl	530(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC15, %eax
    movl	%eax, 0(%esp)
    fldl	522(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC15, %eax
    movl	%eax, 0(%esp)
    fldl	514(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC15, %eax
    movl	%eax, 0(%esp)
    fldl	506(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC15, %eax
    movl	%eax, 0(%esp)
    fldl	498(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC15, %eax
    movl	%eax, 0(%esp)
    fldl	490(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$2, %eax
    movl	$2, %edx
    imull	%edx, %eax
    movl	%eax, 292(%esp)
    fildl	292(%esp)
    fldl	FLOAT2
    fmulp	%st, %st(1)
    fstpl	284(%esp)
    fldl	284(%esp)
    fstpl	482(%esp)
    fldl	FLOAT4
    fldl	FLOAT2
    fmulp	%st, %st(1)
    fstpl	276(%esp)
    fldl	276(%esp)
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	268(%esp)
    fldl	268(%esp)
    fstpl	474(%esp)
    fldl	FLOAT2
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	260(%esp)
    fldl	260(%esp)
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	252(%esp)
    fldl	252(%esp)
    fstpl	466(%esp)
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	482(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	474(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	466(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT4
    fldl	FLOAT2
    fmulp	%st, %st(1)
    fstpl	244(%esp)
    fldl	244(%esp)
    fldl	FLOAT2
    fmulp	%st, %st(1)
    fstpl	236(%esp)
    fldl	236(%esp)
    fstpl	458(%esp)
    fldl	FLOAT2
    fldl	FLOAT2
    fmulp	%st, %st(1)
    fstpl	228(%esp)
    fldl	228(%esp)
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	220(%esp)
    fldl	220(%esp)
    fstpl	450(%esp)
    fldl	FLOAT2
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	212(%esp)
    fldl	212(%esp)
    fldl	FLOAT2
    fmulp	%st, %st(1)
    fstpl	204(%esp)
    fldl	204(%esp)
    fstpl	442(%esp)
    movl	$LC17, %eax
    movl	%eax, 0(%esp)
    fldl	458(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC17, %eax
    movl	%eax, 0(%esp)
    fldl	450(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC17, %eax
    movl	%eax, 0(%esp)
    fldl	442(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT4
    fldl	FLOAT2
    fmulp	%st, %st(1)
    fstpl	196(%esp)
    fldl	196(%esp)
    fildl	538(%esp)
    fmulp	%st, %st(1)
    fstpl	188(%esp)
    fldl	188(%esp)
    fstpl	434(%esp)
    fildl	538(%esp)
    fldl	FLOAT2
    fmulp	%st, %st(1)
    fstpl	180(%esp)
    fldl	180(%esp)
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	172(%esp)
    fldl	172(%esp)
    fstpl	426(%esp)
    fldl	FLOAT2
    fildl	538(%esp)
    fmulp	%st, %st(1)
    fstpl	164(%esp)
    fldl	164(%esp)
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	156(%esp)
    fldl	156(%esp)
    fstpl	418(%esp)
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	434(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	426(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	418(%esp)
    fstpl	4(%esp)
    call	_printf
    fldl	FLOAT4
    fldl	542(%esp)
    fmulp	%st, %st(1)
    fstpl	148(%esp)
    fldl	148(%esp)
    fildl	538(%esp)
    fmulp	%st, %st(1)
    fstpl	140(%esp)
    fldl	140(%esp)
    fstpl	410(%esp)
    fildl	538(%esp)
    fldl	542(%esp)
    fmulp	%st, %st(1)
    fstpl	132(%esp)
    fldl	132(%esp)
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	124(%esp)
    fldl	124(%esp)
    fstpl	402(%esp)
    fldl	542(%esp)
    fildl	538(%esp)
    fmulp	%st, %st(1)
    fstpl	116(%esp)
    fldl	116(%esp)
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	108(%esp)
    fldl	108(%esp)
    fstpl	394(%esp)
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	410(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	402(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	394(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$2, %eax
    movw	%ax, 392(%esp)
    fldl	FLOAT4
    fldl	542(%esp)
    fmulp	%st, %st(1)
    fstpl	100(%esp)
    fldl	100(%esp)
    filds	392(%esp)
    fmulp	%st, %st(1)
    fstpl	92(%esp)
    fldl	92(%esp)
    fstpl	384(%esp)
    filds	392(%esp)
    fldl	542(%esp)
    fmulp	%st, %st(1)
    fstpl	84(%esp)
    fldl	84(%esp)
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	76(%esp)
    fldl	76(%esp)
    fstpl	376(%esp)
    fldl	542(%esp)
    filds	392(%esp)
    fmulp	%st, %st(1)
    fstpl	68(%esp)
    fldl	68(%esp)
    fldl	FLOAT4
    fmulp	%st, %st(1)
    fstpl	60(%esp)
    fldl	60(%esp)
    fstpl	368(%esp)
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	384(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	376(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	368(%esp)
    fstpl	4(%esp)
    call	_printf
    fildl	538(%esp)
    fldl	542(%esp)
    fmulp	%st, %st(1)
    fstpl	52(%esp)
    fldl	52(%esp)
    filds	392(%esp)
    fmulp	%st, %st(1)
    fstpl	44(%esp)
    fldl	44(%esp)
    fstpl	360(%esp)
    filds	392(%esp)
    fldl	542(%esp)
    fmulp	%st, %st(1)
    fstpl	36(%esp)
    fldl	36(%esp)
    fildl	538(%esp)
    fmulp	%st, %st(1)
    fstpl	28(%esp)
    fldl	28(%esp)
    fstpl	352(%esp)
    fldl	542(%esp)
    filds	392(%esp)
    fmulp	%st, %st(1)
    fstpl	20(%esp)
    fldl	20(%esp)
    fildl	538(%esp)
    fmulp	%st, %st(1)
    fstpl	12(%esp)
    fldl	12(%esp)
    fstpl	344(%esp)
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	360(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	352(%esp)
    fstpl	4(%esp)
    call	_printf
    movl	$LC16, %eax
    movl	%eax, 0(%esp)
    fldl	344(%esp)
    fstpl	4(%esp)
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
    call	_mul
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 2.1: %f\n"
LC1:
    .string	"target 3.1: %f\n"
LC2:
    .string	"target 3.2: %f\n"
LC3:
    .string	"target -2.1: %f\n"
LC4:
    .string	"target 2.1 : %f\n"
LC5:
    .string	"target -0.1: %f\n"
LC6:
    .string	"target 0.1 : %f\n"
LC7:
    .string	"target 1.1 : %f\n"
LC8:
    .string	"target -3.1: %f\n"
LC9:
    .string	"target -0.9: %f\n"
LC10:
    .string	"target -1.1: %f\n"
LC11:
    .string	"target 1   : %f\n"
LC12:
    .string	"target -3.2: %f\n"
LC13:
    .string	"target -1  : %f\n"
LC14:
    .string	"target -1.2: %f\n"
LC15:
    .string	"target 4.4: %f\n"
LC16:
    .string	"target 8.8: %f\n"
LC17:
    .string	"target 9.68: %f\n"
FLOAT0:
    .long	-1717986918
    .long	1072798105
FLOAT1:
    .long	-858993459
    .long	1074318540
FLOAT2:
    .long	-1717986918
    .long	1073846681
FLOAT3:
    .long	0
    .long	1072693248
FLOAT4:
    .long	0
    .long	1073741824
