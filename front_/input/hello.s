	.file	"hello.c"
	.text
	.section .rdata,"dr"
LC0:
	.ascii "\12add target: 3\0"
LC1:
	.ascii "value1: %d\12\0"
LC2:
	.ascii "value2: %d\12\0"
LC3:
	.ascii "value3: %d\12\0"
LC4:
	.ascii "value4: %d\12\0"
LC5:
	.ascii "value5: %d\12\0"
LC6:
	.ascii "value6: %d\12\0"
LC7:
	.ascii "value7: %d\12\0"
LC8:
	.ascii "value8: %d\12\0"
	.text
	.globl	_add
	.def	_add;	.scl	2;	.type	32;	.endef
_add:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movw	$30000, -10(%ebp)
	movw	$24464, -12(%ebp)
	movzwl	-10(%ebp), %eax
	subw	$5536, %ax
	movw	%ax, -14(%ebp)
	movzwl	-10(%ebp), %eax
	subw	$5536, %ax
	movw	%ax, -16(%ebp)
	movzwl	-10(%ebp), %eax
	subw	$5536, %ax
	movw	%ax, -18(%ebp)
	movswl	-10(%ebp), %eax
	addl	$15000, %eax
	addl	%eax, %eax
	movw	%ax, -20(%ebp)
	movzwl	-10(%ebp), %eax
	addw	$15000, %ax
	addl	%eax, %eax
	movw	%ax, -22(%ebp)
	movzwl	-10(%ebp), %eax
	addw	$15000, %ax
	addl	%eax, %eax
	movw	%ax, -24(%ebp)
	movzwl	-10(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movw	%ax, -26(%ebp)
	movl	$LC0, (%esp)
	call	_puts
	movswl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movswl	-14(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movswl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movswl	-18(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movswl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movswl	-22(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movswl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movswl	-26(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	nop
	leave
	ret
	.section .rdata,"dr"
LC9:
	.ascii "\12sub target: -1\0"
	.text
	.globl	_sub
	.def	_sub;	.scl	2;	.type	32;	.endef
_sub:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movw	$1, -10(%ebp)
	movw	$-1, -12(%ebp)
	movzwl	-10(%ebp), %eax
	subl	$2, %eax
	movw	%ax, -14(%ebp)
	movzwl	-10(%ebp), %eax
	negl	%eax
	movw	%ax, -16(%ebp)
	movzwl	-10(%ebp), %eax
	negl	%eax
	movw	%ax, -18(%ebp)
	movw	$-1, -20(%ebp)
	movzwl	-10(%ebp), %eax
	addl	%eax, %eax
	movl	$1, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movw	%ax, -22(%ebp)
	movw	$-1, -24(%ebp)
	movzwl	-10(%ebp), %eax
	negl	%eax
	movw	%ax, -26(%ebp)
	movl	$LC9, (%esp)
	call	_puts
	movswl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movswl	-14(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movswl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movswl	-18(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movswl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movswl	-22(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movswl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movswl	-26(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	nop
	leave
	ret
	.section .rdata,"dr"
LC10:
	.ascii "\12add and sub target: 1\0"
LC11:
	.ascii "value9: %d\12\0"
LC12:
	.ascii "value10: %d\12\0"
LC13:
	.ascii "value11: %d\12\0"
LC14:
	.ascii "value12: %d\12\0"
LC15:
	.ascii "value13: %d\12\0"
LC16:
	.ascii "value14: %d\12\0"
LC17:
	.ascii "value15: %d\12\0"
LC18:
	.ascii "value16: %d\12\0"
	.text
	.globl	_add_sub
	.def	_add_sub;	.scl	2;	.type	32;	.endef
_add_sub:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$72, %esp
	movw	$1, -10(%ebp)
	movw	$1, -12(%ebp)
	movw	$1, -14(%ebp)
	movzwl	-10(%ebp), %eax
	movw	%ax, -16(%ebp)
	movzwl	-10(%ebp), %eax
	movl	$2, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movw	%ax, -18(%ebp)
	movzwl	-10(%ebp), %eax
	movw	%ax, -20(%ebp)
	movzwl	-10(%ebp), %eax
	movw	%ax, -22(%ebp)
	movzwl	-10(%ebp), %eax
	movw	%ax, -24(%ebp)
	movzwl	-10(%ebp), %eax
	movl	$2, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movw	%ax, -26(%ebp)
	movw	$1, -28(%ebp)
	movw	$1, -30(%ebp)
	movzwl	-10(%ebp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movw	%ax, -32(%ebp)
	movzwl	-10(%ebp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movw	%ax, -34(%ebp)
	movw	$1, -36(%ebp)
	movw	$1, -38(%ebp)
	movzwl	-10(%ebp), %eax
	movw	%ax, -40(%ebp)
	movzwl	-10(%ebp), %eax
	movw	%ax, -42(%ebp)
	movl	$LC10, (%esp)
	call	_puts
	movswl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movswl	-14(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movswl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movswl	-18(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movswl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movswl	-22(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movswl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movswl	-26(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movswl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	movswl	-30(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	movswl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	movswl	-34(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	movswl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	movswl	-38(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	movswl	-40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	movswl	-42(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC18, (%esp)
	call	_printf
	nop
	leave
	ret
	.section .rdata,"dr"
LC19:
	.ascii "\12mul target: 8\0"
LC20:
	.ascii "4608: %d\12\0"
	.text
	.globl	_mul
	.def	_mul;	.scl	2;	.type	32;	.endef
_mul:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movw	$200, -10(%ebp)
	movw	$4608, -12(%ebp)
	movzwl	-10(%ebp), %eax
	imulw	$-25536, %ax, %ax
	movw	%ax, -14(%ebp)
	movzwl	-10(%ebp), %eax
	imulw	$-25536, %ax, %ax
	movw	%ax, -16(%ebp)
	movzwl	-10(%ebp), %eax
	imulw	$-25536, %ax, %ax
	movw	%ax, -18(%ebp)
	movzwl	-10(%ebp), %edx
	movzwl	-10(%ebp), %eax
	imull	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	0(,%eax,4), %edx
	addl	%edx, %eax
	sall	$3, %eax
	movw	%ax, -20(%ebp)
	movzwl	-10(%ebp), %edx
	movzwl	-10(%ebp), %eax
	imull	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	0(,%eax,4), %edx
	addl	%edx, %eax
	sall	$3, %eax
	movw	%ax, -22(%ebp)
	movzwl	-10(%ebp), %edx
	movzwl	-10(%ebp), %eax
	imull	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	0(,%eax,4), %edx
	addl	%edx, %eax
	sall	$3, %eax
	movw	%ax, -24(%ebp)
	movzwl	-10(%ebp), %edx
	movzwl	-10(%ebp), %eax
	imull	%eax, %edx
	movzwl	-10(%ebp), %eax
	imull	%edx, %eax
	movw	%ax, -26(%ebp)
	movl	$LC19, (%esp)
	call	_puts
	movswl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	movswl	-14(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	movswl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	movswl	-18(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	movswl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	movswl	-22(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	movswl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	movswl	-26(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	nop
	leave
	ret
	.section .rdata,"dr"
LC21:
	.ascii "\12arith target: 8\0"
	.text
	.globl	_arith
	.def	_arith;	.scl	2;	.type	32;	.endef
_arith:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movw	$300, -10(%ebp)
	movw	$25064, -12(%ebp)
	movw	$25064, -14(%ebp)
	movw	$25064, -16(%ebp)
	movswl	-10(%ebp), %eax
	addl	$2, %eax
	imulw	$300, %ax, %ax
	movw	%ax, -18(%ebp)
	movswl	-10(%ebp), %eax
	addl	$2, %eax
	imulw	$300, %ax, %ax
	movw	%ax, -20(%ebp)
	movzwl	-10(%ebp), %eax
	imulw	$300, %ax, %ax
	addw	$600, %ax
	movw	%ax, -22(%ebp)
	movzwl	-10(%ebp), %eax
	leal	2(%eax), %edx
	movzwl	-10(%ebp), %eax
	imull	%edx, %eax
	movw	%ax, -24(%ebp)
	movl	$LC21, (%esp)
	call	_puts
	movswl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movswl	-14(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movswl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movswl	-18(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movswl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movswl	-22(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movswl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	nop
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	call	___main
	call	_add
	call	_sub
	call	_add_sub
	call	_mul
	call	_arith
	call	_getchar
	nop
	leave
	ret
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
