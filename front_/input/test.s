//by latin

    .text
    .globl	_double_size_compare
_double_size_compare:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$28, %esp
    fldl	FLOAT0
    fstpl	20(%esp)
    fldl	FLOAT1
    fstpl	12(%esp)
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	12(%esp)
    fldl	20(%esp)
    fcompp
    fstsw
    sahf
    jae	L1
L0:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L2
L1:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L2:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	12(%esp)
    fldl	20(%esp)
    fcompp
    fstsw
    sahf
    ja	L4
L3:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L5
L4:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L5:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	20(%esp)
    fldl	12(%esp)
    fcompp
    fstsw
    sahf
    jbe	L7
L6:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L8
L7:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L8:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	20(%esp)
    fldl	12(%esp)
    fcompp
    fstsw
    sahf
    jb	L10
L9:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L11
L10:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L11:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	20(%esp)
    fldl	FLOAT1
    fcompp
    fstsw
    sahf
    jbe	L13
L12:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L14
L13:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L14:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	FLOAT1
    fldl	20(%esp)
    fcompp
    fstsw
    sahf
    jae	L16
L15:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L17
L16:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L17:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	FLOAT1
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L19
L18:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L20
L19:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L20:
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
    .globl	_short_size_compare
_short_size_compare:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$16, %esp
    movl	$1, %eax
    movw	%ax, 14(%esp)
    movl	$2, %eax
    movw	%ax, 12(%esp)
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movswl	12(%esp), %eax
    movswl	14(%esp), %edx
    cmpl	%eax, %edx
    jge L22
L21:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L23
L22:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L23:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movswl	12(%esp), %eax
    movswl	14(%esp), %edx
    cmpl	%eax, %edx
    jg L25
L24:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L26
L25:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L26:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movswl	14(%esp), %eax
    movswl	12(%esp), %edx
    cmpl	%eax, %edx
    jle L28
L27:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L29
L28:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L29:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movswl	14(%esp), %eax
    movswl	12(%esp), %edx
    cmpl	%eax, %edx
    jl L31
L30:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L32
L31:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L32:
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
    .globl	_int_size_compare
_int_size_compare:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$40, %esp
    movl	$1, %eax
    movl	%eax, 36(%esp)
    movl	$2, %eax
    movl	%eax, 32(%esp)
    movl	$1, %eax
    movw	%ax, 30(%esp)
    movl	$2, %eax
    movw	%ax, 28(%esp)
    fldl	FLOAT2
    fstpl	20(%esp)
    fldl	FLOAT3
    fstpl	12(%esp)
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	32(%esp), %eax
    movl	36(%esp), %edx
    cmpl	%eax, %edx
    jge L34
L33:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L35
L34:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L35:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	32(%esp), %eax
    movl	36(%esp), %edx
    cmpl	%eax, %edx
    jg L37
L36:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L38
L37:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L38:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	36(%esp), %eax
    movl	32(%esp), %edx
    cmpl	%eax, %edx
    jle L40
L39:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L41
L40:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L41:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	36(%esp), %eax
    movl	32(%esp), %edx
    cmpl	%eax, %edx
    jl L43
L42:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L44
L43:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L44:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$2, %eax
    movl	$1, %edx
    cmpl	%eax, %edx
    jge L46
L45:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L47
L46:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L47:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$2, %eax
    movl	$1, %edx
    cmpl	%eax, %edx
    jg L49
L48:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L50
L49:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L50:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%eax, %edx
    jle L52
L51:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L53
L52:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L53:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%eax, %edx
    jl L55
L54:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L56
L55:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L56:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	32(%esp), %eax
    movl	$1, %edx
    cmpl	%eax, %edx
    jge L58
L57:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L59
L58:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L59:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	32(%esp), %eax
    movl	$1, %edx
    cmpl	%eax, %edx
    jg L61
L60:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L62
L61:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L62:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$0, %eax
    movl	36(%esp), %edx
    cmpl	%eax, %edx
    jle L64
L63:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L65
L64:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L65:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$0, %eax
    movl	36(%esp), %edx
    cmpl	%eax, %edx
    jl L67
L66:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L68
L67:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L68:
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
    .globl	_mix_size_compare
_mix_size_compare:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$40, %esp
    movl	$1, %eax
    movl	%eax, 36(%esp)
    movl	$2, %eax
    movl	%eax, 32(%esp)
    fldl	FLOAT0
    fstpl	24(%esp)
    fldl	FLOAT1
    fstpl	16(%esp)
    movl	$1, %eax
    movw	%ax, 14(%esp)
    movl	$2, %eax
    movw	%ax, 12(%esp)
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	FLOAT0
    fldl	FLOAT2
    fcompp
    fstsw
    sahf
    jae	L70
L69:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L71
L70:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L71:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	FLOAT0
    filds	14(%esp)
    fcompp
    fstsw
    sahf
    jae	L73
L72:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L74
L73:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L74:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	FLOAT0
    fildl	36(%esp)
    fcompp
    fstsw
    sahf
    jae	L76
L75:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L77
L76:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L77:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	FLOAT3
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L79
L78:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L80
L79:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L80:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fildl	32(%esp)
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L82
L81:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L83
L82:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L83:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    filds	12(%esp)
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L85
L84:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L86
L85:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L86:
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	24(%esp)
    fldl	FLOAT2
    fcompp
    fstsw
    sahf
    jae	L88
L87:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L89
L88:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L89:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	24(%esp)
    filds	14(%esp)
    fcompp
    fstsw
    sahf
    jae	L91
L90:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L92
L91:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L92:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	24(%esp)
    fildl	36(%esp)
    fcompp
    fstsw
    sahf
    jae	L94
L93:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L95
L94:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L95:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	FLOAT3
    fldl	24(%esp)
    fcompp
    fstsw
    sahf
    jae	L97
L96:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L98
L97:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L98:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fildl	32(%esp)
    fldl	24(%esp)
    fcompp
    fstsw
    sahf
    jae	L100
L99:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L101
L100:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L101:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    filds	12(%esp)
    fldl	24(%esp)
    fcompp
    fstsw
    sahf
    jae	L103
L102:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L104
L103:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L104:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movswl	12(%esp), %eax
    movl	36(%esp), %edx
    cmpl	%eax, %edx
    jge L106
L105:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L107
L106:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L107:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	32(%esp), %eax
    movswl	14(%esp), %edx
    cmpl	%eax, %edx
    jge L109
L108:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L110
L109:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L110:
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
    call	_int_size_compare
    call	_short_size_compare
    call	_double_size_compare
    call	_mix_size_compare
    call	_getchar
    movl	%ebp, %esp
    popl	%edi
    popl	%esi
    popl	%ebx
    popl	%ebp
    ret
LC0:
    .string	"target 1: %d\n"
FLOAT0:
    .long	-1717986918
    .long	1072798105
FLOAT1:
    .long	-858993459
    .long	1073794252
FLOAT2:
    .long	0
    .long	1072693248
FLOAT3:
    .long	0
    .long	1073741824
