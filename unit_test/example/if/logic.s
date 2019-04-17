//by latin

    .text
    .globl	_const_logic_compare
_const_logic_compare:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$12, %esp
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jl L1
L0:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L2
L1:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L3
L2:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L3:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jg L5
L4:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L6
L5:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L7
L6:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L7:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jg L9
L8:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jle L10
L9:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L11
L10:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L11:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jge L14
L12:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L14
L13:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L15
L14:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L15:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jle L18
L16:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L18
L17:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L19
L18:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L19:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jge L22
L20:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jle L22
L21:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L23
L22:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L23:
    movl	$LC1, %eax
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
    .globl	_logic_compare
_logic_compare:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$54, %esp
    movl	$1, %eax
    movl	%eax, 50(%esp)
    movl	$2, %eax
    movl	%eax, 46(%esp)
    movl	$3, %eax
    movl	%eax, 42(%esp)
    fldl	FLOAT0
    fstpl	34(%esp)
    fldl	FLOAT1
    fstpl	26(%esp)
    fldl	FLOAT2
    fstpl	18(%esp)
    movl	$1, %eax
    movw	%ax, 16(%esp)
    movl	$2, %eax
    movw	%ax, 14(%esp)
    movl	$3, %eax
    movw	%ax, 12(%esp)
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	50(%esp), %eax
    movl	46(%esp), %edx
    cmpl	%edx, %eax
    jl L25
L24:
    movl	46(%esp), %eax
    movl	42(%esp), %edx
    cmpl	%edx, %eax
    jge L26
L25:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L27
L26:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L27:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	46(%esp), %edx
    cmpl	%edx, %eax
    jg L29
L28:
    movl	46(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L30
L29:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L31
L30:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L31:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	50(%esp), %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jg L33
L32:
    movl	$2, %eax
    movl	42(%esp), %edx
    cmpl	%edx, %eax
    jle L34
L33:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L35
L34:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L35:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	50(%esp), %eax
    movl	46(%esp), %edx
    cmpl	%edx, %eax
    jge L38
L36:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L38
L37:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L39
L38:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L39:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jle L42
L40:
    movl	46(%esp), %eax
    movl	42(%esp), %edx
    cmpl	%edx, %eax
    jge L42
L41:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L43
L42:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L43:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	50(%esp), %eax
    movl	46(%esp), %edx
    cmpl	%edx, %eax
    jge L46
L44:
    movl	46(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jle L46
L45:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L47
L46:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L47:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    fldl	26(%esp)
    fldl	34(%esp)
    fcompp
    fstsw
    sahf
    jb	L49
L48:
    fldl	18(%esp)
    fldl	26(%esp)
    fcompp
    fstsw
    sahf
    jae	L50
L49:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L51
L50:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L51:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	26(%esp)
    fldl	FLOAT3
    fcompp
    fstsw
    sahf
    ja	L53
L52:
    fldl	FLOAT4
    fldl	26(%esp)
    fcompp
    fstsw
    sahf
    jae	L54
L53:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L55
L54:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L55:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	FLOAT5
    fldl	34(%esp)
    fcompp
    fstsw
    sahf
    ja	L57
L56:
    fldl	18(%esp)
    fldl	FLOAT5
    fcompp
    fstsw
    sahf
    jbe	L58
L57:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L59
L58:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L59:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	26(%esp)
    fldl	34(%esp)
    fcompp
    fstsw
    sahf
    jae	L62
L60:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L62
L61:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L63
L62:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L63:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jle L66
L64:
    fldl	18(%esp)
    fldl	26(%esp)
    fcompp
    fstsw
    sahf
    jae	L66
L65:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L67
L66:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L67:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	26(%esp)
    fldl	34(%esp)
    fcompp
    fstsw
    sahf
    jae	L70
L68:
    fldl	FLOAT4
    fldl	26(%esp)
    fcompp
    fstsw
    sahf
    jbe	L70
L69:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L71
L70:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L71:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movswl	16(%esp), %eax
    movswl	14(%esp), %edx
    cmpl	%edx, %eax
    jl L73
L72:
    movswl	14(%esp), %eax
    movswl	12(%esp), %edx
    cmpl	%edx, %eax
    jge L74
L73:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L75
L74:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L75:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movswl	14(%esp), %edx
    cmpl	%edx, %eax
    jg L77
L76:
    movswl	14(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L78
L77:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L79
L78:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L79:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movswl	16(%esp), %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jg L81
L80:
    movl	$2, %eax
    movswl	12(%esp), %edx
    cmpl	%edx, %eax
    jle L82
L81:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L83
L82:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L83:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movswl	16(%esp), %eax
    movswl	14(%esp), %edx
    cmpl	%edx, %eax
    jge L86
L84:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L86
L85:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L87
L86:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L87:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jle L90
L88:
    movswl	14(%esp), %eax
    movswl	12(%esp), %edx
    cmpl	%edx, %eax
    jge L90
L89:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L91
L90:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L91:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movswl	16(%esp), %eax
    movswl	14(%esp), %edx
    cmpl	%edx, %eax
    jge L94
L92:
    movswl	14(%esp), %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jle L94
L93:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L95
L94:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L95:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fldl	26(%esp)
    filds	16(%esp)
    fcompp
    fstsw
    sahf
    jb	L97
L96:
    fildl	42(%esp)
    fldl	26(%esp)
    fcompp
    fstsw
    sahf
    jae	L98
L97:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L99
L98:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L99:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    filds	16(%esp)
    fldl	34(%esp)
    fcompp
    fstsw
    sahf
    jae	L102
L100:
    fildl	42(%esp)
    fldl	26(%esp)
    fcompp
    fstsw
    sahf
    jae	L102
L101:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L103
L102:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L103:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fildl	46(%esp)
    fldl	18(%esp)
    fcompp
    fstsw
    sahf
    jb	L105
L104:
    movswl	16(%esp), %eax
    movl	46(%esp), %edx
    cmpl	%edx, %eax
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
    fildl	46(%esp)
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jb	L109
L108:
    fldl	FLOAT1
    filds	16(%esp)
    fcompp
    fstsw
    sahf
    jae	L110
L109:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L111
L110:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L111:
    movl	$LC0, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    fildl	46(%esp)
    fldl	FLOAT0
    fcompp
    fstsw
    sahf
    jae	L114
L112:
    fldl	FLOAT1
    filds	16(%esp)
    fcompp
    fstsw
    sahf
    jbe	L114
L113:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L115
L114:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L115:
    movl	$LC1, %eax
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
    .globl	_mul_logic
_mul_logic:
    pushl	%ebp
    pushl	%ebx
    pushl	%esi
    pushl	%edi
    movl	%esp, %ebp
    andl	$-16, %esp
    subl	$54, %esp
    movl	$1, %eax
    movl	%eax, 50(%esp)
    movl	$2, %eax
    movl	%eax, 46(%esp)
    movl	$3, %eax
    movl	%eax, 42(%esp)
    fldl	FLOAT0
    fstpl	34(%esp)
    fldl	FLOAT1
    fstpl	26(%esp)
    fldl	FLOAT2
    fstpl	18(%esp)
    movl	$1, %eax
    movw	%ax, 16(%esp)
    movl	$2, %eax
    movw	%ax, 14(%esp)
    movl	$3, %eax
    movw	%ax, 12(%esp)
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jl L117
L116:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jge L120
L117:
    movl	$3, %eax
    movl	$4, %edx
    cmpl	%edx, %eax
    jge L120
L118:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jle L120
L119:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L121
L120:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L121:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	$1, %eax
    movl	$2, %edx
    cmpl	%edx, %eax
    jl L123
L122:
    movl	$2, %eax
    movl	42(%esp), %edx
    cmpl	%edx, %eax
    jge L126
L123:
    movl	$3, %eax
    movl	$4, %edx
    cmpl	%edx, %eax
    jge L126
L124:
    movl	$2, %eax
    movl	$3, %edx
    cmpl	%edx, %eax
    jle L126
L125:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L127
L126:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L127:
    movl	$LC1, %eax
    movl	%eax, 0(%esp)
    movl	8(%esp), %eax
    movl	%eax, 4(%esp)
    call	_printf
    movl	$777, %eax
    movl	%eax, 8(%esp)
    movl	50(%esp), %eax
    movswl	14(%esp), %edx
    cmpl	%edx, %eax
    jl L129
L128:
    movswl	14(%esp), %eax
    movl	42(%esp), %edx
    cmpl	%edx, %eax
    jge L132
L129:
    fldl	FLOAT6
    fldl	18(%esp)
    fcompp
    fstsw
    sahf
    jae	L132
L130:
    fldl	FLOAT5
    fldl	18(%esp)
    fcompp
    fstsw
    sahf
    jbe	L132
L131:
    movl	$1, %eax
    movl	%eax, 8(%esp)
    jmp L133
L132:
    movl	$0, %eax
    movl	%eax, 8(%esp)
L133:
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
    call	_const_logic_compare
    call	_logic_compare
    call	_mul_logic
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
    .long	1072693248
FLOAT4:
    .long	0
    .long	1074266112
FLOAT5:
    .long	0
    .long	1073741824
FLOAT6:
    .long	0
    .long	1074790400
