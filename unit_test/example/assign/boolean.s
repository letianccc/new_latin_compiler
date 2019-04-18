//by latin

    .text
    .globl	_int_const
_int_const:
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
    .globl	_double_const
_double_const:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$44, %esp
    fldl	FLOAT1
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L14
L12:
    fldl	FLOAT2
    fldl	FLOAT1
    fcompp
    fstsw
    sahf
    jae	L14
L13:
    movl	$1, %eax
    movl	%eax, 40(%esp)
    jmp L15
L14:
    movl	$0, %eax
    movl	%eax, 40(%esp)
L15:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	40(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	FLOAT1
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L18
L16:
    fldl	FLOAT2
    fldl	FLOAT1
    fcompp
    fstsw
    sahf
    jae	L18
L17:
    movl	$1, %eax
    movl	%eax, 36(%esp)
    jmp L19
L18:
    movl	$0, %eax
    movl	%eax, 36(%esp)
L19:
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
    fldl	FLOAT1
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L22
L20:
    fldl	FLOAT2
    fldl	FLOAT1
    fcompp
    fstsw
    sahf
    jae	L22
L21:
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 16(%esp)
    movl	28(%esp), %eax
    movl	$1, %edx
    movl	%edx, (%eax)
    jmp L23
L22:
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 12(%esp)
    movl	28(%esp), %eax
    movl	$0, %edx
    movl	%edx, (%eax)
L23:
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
    .globl	_double_mix
_double_mix:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$64, %esp
    fldl	FLOAT0
    fstpl	52(%esp)
    fldl	FLOAT1
    fstpl	44(%esp)
    fldl	FLOAT2
    fstpl	36(%esp)
    movl	$777, %eax
    movl	%eax, 60(%esp)
    fldl	44(%esp)
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L26
L24:
    fldl	FLOAT2
    fldl	44(%esp)
    fcompp
    fstsw
    sahf
    jae	L26
L25:
    movl	$1, %eax
    movl	%eax, 60(%esp)
    jmp L27
L26:
    movl	$0, %eax
    movl	%eax, 60(%esp)
L27:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	60(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 60(%esp)
    fldl	44(%esp)
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jb	L29
L28:
    fldl	FLOAT2
    fldl	44(%esp)
    fcompp
    fstsw
    sahf
    jae	L30
L29:
    movl	$1, %eax
    movl	%eax, 60(%esp)
    jmp L31
L30:
    movl	$0, %eax
    movl	%eax, 60(%esp)
L31:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	60(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 60(%esp)
    fldl	44(%esp)
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    ja	L33
L32:
    fldl	FLOAT2
    fldl	44(%esp)
    fcompp
    fstsw
    sahf
    jbe	L34
L33:
    movl	$1, %eax
    movl	%eax, 60(%esp)
    jmp L35
L34:
    movl	$0, %eax
    movl	%eax, 60(%esp)
L35:
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    movl	60(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 60(%esp)
    fldl	FLOAT1
    fldl	52(%esp)
    fcompp
    fstsw
    sahf
    jae	L38
L36:
    fldl	36(%esp)
    fldl	FLOAT1
    fcompp
    fstsw
    sahf
    jae	L38
L37:
    movl	$1, %eax
    movl	%eax, 60(%esp)
    jmp L39
L38:
    movl	$0, %eax
    movl	%eax, 60(%esp)
L39:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	60(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 60(%esp)
    fldl	44(%esp)
    fldl	52(%esp)
    fcompp
    fstsw
    sahf
    jae	L42
L40:
    fldl	36(%esp)
    fldl	44(%esp)
    fcompp
    fstsw
    sahf
    jae	L42
L41:
    movl	$1, %eax
    movl	%eax, 60(%esp)
    jmp L43
L42:
    movl	$0, %eax
    movl	%eax, 60(%esp)
L43:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	60(%esp), %eax
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
    fldl	44(%esp)
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L46
L44:
    fldl	FLOAT2
    fldl	44(%esp)
    fcompp
    fstsw
    sahf
    jae	L46
L45:
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 16(%esp)
    movl	28(%esp), %eax
    movl	$1, %edx
    movl	%edx, (%eax)
    jmp L47
L46:
    movl	28(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 12(%esp)
    movl	28(%esp), %eax
    movl	$0, %edx
    movl	%edx, (%eax)
L47:
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
    .globl	_integer_mix
_integer_mix:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$78, %esp
    movl	$1, %eax
    movl	%eax, 70(%esp)
    movl	$2, %eax
    movl	%eax, 66(%esp)
    movl	$3, %eax
    movl	%eax, 62(%esp)
    movl	$1, %eax
    movw	%ax, 60(%esp)
    movl	$2, %eax
    movw	%ax, 58(%esp)
    movl	$3, %eax
    movw	%ax, 56(%esp)
    movl	$777, %eax
    movl	%eax, 74(%esp)
    movl	$1, %eax
    movl	66(%esp), %edx
    cmpl	%edx, %eax
    jge L50
L48:
    movl	66(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L50
L49:
    movl	$1, %eax
    movl	%eax, 74(%esp)
    jmp L51
L50:
    movl	$0, %eax
    movl	%eax, 74(%esp)
L51:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	74(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 74(%esp)
    movl	$1, %eax
    movl	66(%esp), %edx
    cmpl	%edx, %eax
    jl L53
L52:
    movl	66(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L54
L53:
    movl	$1, %eax
    movl	%eax, 74(%esp)
    jmp L55
L54:
    movl	$0, %eax
    movl	%eax, 74(%esp)
L55:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	74(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 74(%esp)
    movl	$1, %eax
    movl	66(%esp), %edx
    cmpl	%edx, %eax
    jg L57
L56:
    movl	66(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jle L58
L57:
    movl	$1, %eax
    movl	%eax, 74(%esp)
    jmp L59
L58:
    movl	$0, %eax
    movl	%eax, 74(%esp)
L59:
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    movl	74(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 74(%esp)
    movl	70(%esp), %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jge L62
L60:
    movl	$2, %eax
    movl	62(%esp), %edx
    cmpl	%edx, %eax
    jge L62
L61:
    movl	$1, %eax
    movl	%eax, 74(%esp)
    jmp L63
L62:
    movl	$0, %eax
    movl	%eax, 74(%esp)
L63:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	74(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 74(%esp)
    movl	70(%esp), %eax
    movl	66(%esp), %edx
    cmpl	%edx, %eax
    jge L66
L64:
    movl	66(%esp), %eax
    movl	62(%esp), %edx
    cmpl	%edx, %eax
    jge L66
L65:
    movl	$1, %eax
    movl	%eax, 74(%esp)
    jmp L67
L66:
    movl	$0, %eax
    movl	%eax, 74(%esp)
L67:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	74(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 52(%esp)
    leal	52(%esp), %eax
    movl	%eax, 44(%esp)
    movl	44(%esp), %eax
    movl	%eax, 48(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	52(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	48(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 40(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	40(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movl	66(%esp), %edx
    cmpl	%edx, %eax
    jge L70
L68:
    movl	66(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L70
L69:
    movl	48(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 36(%esp)
    movl	48(%esp), %eax
    movl	$1, %edx
    movl	%edx, (%eax)
    jmp L71
L70:
    movl	48(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 32(%esp)
    movl	48(%esp), %eax
    movl	$0, %edx
    movl	%edx, (%eax)
L71:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	52(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	48(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 28(%esp)
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	28(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 74(%esp)
    movl	$1, %eax
    movswl	58(%esp), %edx
    cmpl	%edx, %eax
    jge L74
L72:
    movswl	58(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L74
L73:
    movl	$1, %eax
    movl	%eax, 74(%esp)
    jmp L75
L74:
    movl	$0, %eax
    movl	%eax, 74(%esp)
L75:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	74(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 74(%esp)
    movl	$1, %eax
    movswl	58(%esp), %edx
    cmpl	%edx, %eax
    jl L77
L76:
    movswl	58(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L78
L77:
    movl	$1, %eax
    movl	%eax, 74(%esp)
    jmp L79
L78:
    movl	$0, %eax
    movl	%eax, 74(%esp)
L79:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	74(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 74(%esp)
    movl	$1, %eax
    movswl	58(%esp), %edx
    cmpl	%edx, %eax
    jg L81
L80:
    movswl	58(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jle L82
L81:
    movl	$1, %eax
    movl	%eax, 74(%esp)
    jmp L83
L82:
    movl	$0, %eax
    movl	%eax, 74(%esp)
L83:
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    movl	74(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 74(%esp)
    movswl	60(%esp), %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jge L86
L84:
    movl	$2, %eax
    movswl	56(%esp), %edx
    cmpl	%edx, %eax
    jge L86
L85:
    movl	$1, %eax
    movl	%eax, 74(%esp)
    jmp L87
L86:
    movl	$0, %eax
    movl	%eax, 74(%esp)
L87:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	74(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 74(%esp)
    movswl	60(%esp), %eax
    movswl	58(%esp), %edx
    cmpl	%edx, %eax
    jge L90
L88:
    movswl	58(%esp), %eax
    movswl	56(%esp), %edx
    cmpl	%edx, %eax
    jge L90
L89:
    movl	$1, %eax
    movl	%eax, 74(%esp)
    jmp L91
L90:
    movl	$0, %eax
    movl	%eax, 74(%esp)
L91:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	74(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 52(%esp)
    leal	52(%esp), %eax
    movl	%eax, 24(%esp)
    movl	24(%esp), %eax
    movl	%eax, 48(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	52(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	48(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 20(%esp)
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	20(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$1, %eax
    movswl	58(%esp), %edx
    cmpl	%edx, %eax
    jge L94
L92:
    movswl	58(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L94
L93:
    movl	48(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 16(%esp)
    movl	48(%esp), %eax
    movl	$1, %edx
    movl	%edx, (%eax)
    jmp L95
L94:
    movl	48(%esp), %eax
    movl	(%eax), %eax
    movl	%eax, 12(%esp)
    movl	48(%esp), %eax
    movl	$0, %edx
    movl	%edx, (%eax)
L95:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	52(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	48(%esp), %eax
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
    .globl	_mix
_mix:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$62, %esp
    movl	$1, %eax
    movl	%eax, 54(%esp)
    movl	$2, %eax
    movl	%eax, 50(%esp)
    movl	$3, %eax
    movl	%eax, 46(%esp)
    movl	$1, %eax
    movw	%ax, 44(%esp)
    movl	$2, %eax
    movw	%ax, 42(%esp)
    movl	$3, %eax
    movw	%ax, 40(%esp)
    fldl	FLOAT0
    fstpl	32(%esp)
    fldl	FLOAT1
    fstpl	24(%esp)
    fldl	FLOAT2
    fstpl	16(%esp)
    movl	$777, %eax
    movl	%eax, 58(%esp)
    filds	42(%esp)
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L98
L96:
    movl	50(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L98
L97:
    movl	$1, %eax
    movl	%eax, 58(%esp)
    jmp L99
L98:
    movl	$0, %eax
    movl	%eax, 58(%esp)
L99:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	58(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 58(%esp)
    fldl	FLOAT3
    fldl	32(%esp)
    fcompp
    fstsw
    sahf
    jae	L102
L100:
    movl	50(%esp), %eax
    movswl	40(%esp), %edx
    cmpl	%edx, %eax
    jge L102
L101:
    movl	$1, %eax
    movl	%eax, 58(%esp)
    jmp L103
L102:
    movl	$0, %eax
    movl	%eax, 58(%esp)
L103:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	58(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 58(%esp)
    movswl	44(%esp), %eax
    movl	50(%esp), %edx
    cmpl	%edx, %eax
    jge L106
L104:
    fldl	16(%esp)
    fildl	50(%esp)
    fcompp
    fstsw
    sahf
    jae	L106
L105:
    movl	$1, %eax
    movl	%eax, 58(%esp)
    jmp L107
L106:
    movl	$0, %eax
    movl	%eax, 58(%esp)
L107:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	58(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 58(%esp)
    fldl	24(%esp)
    filds	44(%esp)
    fcompp
    fstsw
    sahf
    jae	L110
L108:
    movswl	42(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L110
L109:
    movl	$1, %eax
    movl	%eax, 58(%esp)
    jmp L111
L110:
    movl	$0, %eax
    movl	%eax, 58(%esp)
L111:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	58(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 58(%esp)
    fldl	24(%esp)
    filds	44(%esp)
    fcompp
    fstsw
    sahf
    jae	L113
L112:
    movswl	42(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jg L115
L113:
    fldl	FLOAT3
    fldl	32(%esp)
    fcompp
    fstsw
    sahf
    jae	L116
L114:
    movl	50(%esp), %eax
    movswl	40(%esp), %edx
    cmpl	%edx, %eax
    jge L116
L115:
    movl	$1, %eax
    movl	%eax, 58(%esp)
    jmp L117
L116:
    movl	$0, %eax
    movl	%eax, 58(%esp)
L117:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	58(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 58(%esp)
    fldl	24(%esp)
    filds	44(%esp)
    fcompp
    fstsw
    sahf
    jae	L119
L118:
    movswl	42(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jg L121
L119:
    fldl	FLOAT3
    fldl	32(%esp)
    fcompp
    fstsw
    sahf
    jae	L122
L120:
    movl	50(%esp), %eax
    movswl	40(%esp), %edx
    cmpl	%edx, %eax
    jle L122
L121:
    movl	$1, %eax
    movl	%eax, 58(%esp)
    jmp L123
L122:
    movl	$0, %eax
    movl	%eax, 58(%esp)
L123:
    movl	$LC2, %eax
    movl	%eax, 0(%esp)
    movl	58(%esp), %eax
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
    call	_int_const
    call	_double_const
    call	_double_mix
    call	_integer_mix
    call	_mix
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
LC2:
    .string	"target 0: %d\n"
FLOAT0:
    .long	-1717986918
    .long	1072798105
FLOAT1:
    .long	-858993459
    .long	1073794252
FLOAT2:
    .long	-858993459
    .long	1074318540
FLOAT3:
    .long	0
    .long	1073741824
