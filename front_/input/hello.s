	.file	"hello.c"
	.text
	.section .rdata,"dr"
LC3:
	.ascii "target 2.1: %f\12\0"
LC5:
	.ascii "target 3.1: %f\12\0"
LC7:
	.ascii "target 3.2: %f\12\0"
	.text
	.globl	_add
	.def	_add;	.scl	2;	.type	32;	.endef
_add:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$264, %esp
	fldl	LC0
	fstpl	-16(%ebp)
	movl	$1, -20(%ebp)
	fldl	-16(%ebp)
	fld1
	faddp	%st, %st(1)
	fstpl	-32(%ebp)
	fldl	-16(%ebp)
	fld1
	faddp	%st, %st(1)
	fstpl	-40(%ebp)
	fildl	-20(%ebp)
	fldl	-16(%ebp)
	faddp	%st, %st(1)
	fstpl	-48(%ebp)
	fildl	-20(%ebp)
	fldl	-16(%ebp)
	faddp	%st, %st(1)
	fstpl	-56(%ebp)
	fldl	LC2
	fstpl	-64(%ebp)
	fldl	LC2
	fstpl	-72(%ebp)
	fldl	-32(%ebp)
	fstpl	4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	fldl	-40(%ebp)
	fstpl	4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	fldl	-48(%ebp)
	fstpl	4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	fldl	-56(%ebp)
	fstpl	4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	fldl	-64(%ebp)
	fstpl	4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	fldl	-72(%ebp)
	fstpl	4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	fldl	LC4
	fstpl	-80(%ebp)
	fldl	LC4
	fstpl	-88(%ebp)
	fldl	LC4
	fstpl	-96(%ebp)
	fldl	-80(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-88(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-96(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	LC6
	fstpl	-104(%ebp)
	fldl	LC6
	fstpl	-112(%ebp)
	fldl	LC6
	fstpl	-120(%ebp)
	fldl	-104(%ebp)
	fstpl	4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	fldl	-112(%ebp)
	fstpl	4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	fldl	-120(%ebp)
	fstpl	4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	fildl	-20(%ebp)
	fldl	LC0
	faddp	%st, %st(1)
	fld1
	faddp	%st, %st(1)
	fstpl	-128(%ebp)
	fildl	-20(%ebp)
	fldl	LC2
	faddp	%st, %st(1)
	fstpl	-136(%ebp)
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -236(%ebp)
	fildl	-236(%ebp)
	fldl	LC0
	faddp	%st, %st(1)
	fstpl	-144(%ebp)
	fildl	-20(%ebp)
	faddl	-16(%ebp)
	fld1
	faddp	%st, %st(1)
	fstpl	-152(%ebp)
	fldl	-16(%ebp)
	fld1
	faddp	%st, %st(1)
	fildl	-20(%ebp)
	faddp	%st, %st(1)
	fstpl	-160(%ebp)
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -236(%ebp)
	fildl	-236(%ebp)
	fldl	-16(%ebp)
	faddp	%st, %st(1)
	fstpl	-168(%ebp)
	movw	$1, -170(%ebp)
	filds	-170(%ebp)
	faddl	-16(%ebp)
	fld1
	faddp	%st, %st(1)
	fstpl	-184(%ebp)
	fldl	-16(%ebp)
	fld1
	faddp	%st, %st(1)
	filds	-170(%ebp)
	faddp	%st, %st(1)
	fstpl	-192(%ebp)
	movswl	-170(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -236(%ebp)
	fildl	-236(%ebp)
	fldl	-16(%ebp)
	faddp	%st, %st(1)
	fstpl	-200(%ebp)
	fldl	-128(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-136(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-144(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-152(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-160(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-168(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-184(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-192(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-200(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	filds	-170(%ebp)
	faddl	-16(%ebp)
	fildl	-20(%ebp)
	faddp	%st, %st(1)
	fstpl	-208(%ebp)
	fildl	-20(%ebp)
	faddl	-16(%ebp)
	filds	-170(%ebp)
	faddp	%st, %st(1)
	fstpl	-216(%ebp)
	movswl	-170(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -236(%ebp)
	fildl	-236(%ebp)
	fldl	-16(%ebp)
	faddp	%st, %st(1)
	fstpl	-224(%ebp)
	fldl	-208(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-216(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	fldl	-224(%ebp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	nop
	leave
	ret
	.section .rdata,"dr"
LC11:
	.ascii "target -2.1: %f\12\0"
LC12:
	.ascii "target 2.1 : %f\12\0"
LC13:
	.ascii "target -0.1: %f\12\0"
LC14:
	.ascii "target 0.1 : %f\12\0"
LC16:
	.ascii "target 1.1 : %f\12\0"
LC17:
	.ascii "target -3.1: %f\12\0"
LC20:
	.ascii "target -0.9: %f\12\0"
LC21:
	.ascii "target -1.1: %f\12\0"
LC23:
	.ascii "target 1   : %f\12\0"
LC24:
	.ascii "target -3.2: %f\12\0"
LC27:
	.ascii "target -1  : %f\12\0"
LC28:
	.ascii "target -1.2: %f\12\0"
	.text
	.globl	_sub
	.def	_sub;	.scl	2;	.type	32;	.endef
_sub:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$312, %esp
	fldl	LC4
	fstpl	-16(%ebp)
	movl	$1, -20(%ebp)
	fld1
	fsubl	-16(%ebp)
	fstpl	-32(%ebp)
	fldl	-16(%ebp)
	fld1
	fsubrp	%st, %st(1)
	fstpl	-40(%ebp)
	fildl	-20(%ebp)
	fsubl	-16(%ebp)
	fstpl	-48(%ebp)
	fildl	-20(%ebp)
	fldl	-16(%ebp)
	fsubp	%st, %st(1)
	fstpl	-56(%ebp)
	fldl	LC9
	fstpl	-64(%ebp)
	fldl	LC10
	fstpl	-72(%ebp)
	fldl	-32(%ebp)
	fstpl	4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	fldl	-48(%ebp)
	fstpl	4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	fldl	-40(%ebp)
	fstpl	4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	fldl	-56(%ebp)
	fstpl	4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	fldl	-64(%ebp)
	fstpl	4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	fldl	-72(%ebp)
	fstpl	4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	fldl	LC0
	fstpl	-80(%ebp)
	fldl	LC15
	fstpl	-88(%ebp)
	fldl	LC15
	fstpl	-96(%ebp)
	fldl	-80(%ebp)
	fstpl	4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	fldl	-88(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	fldl	-96(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	fldl	LC18
	fstpl	-104(%ebp)
	fldl	LC19
	fstpl	-112(%ebp)
	fldl	LC19
	fstpl	-120(%ebp)
	fldl	-104(%ebp)
	fstpl	4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	fldl	-112(%ebp)
	fstpl	4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	fldl	-120(%ebp)
	fstpl	4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	fld1
	fstpl	-128(%ebp)
	fldl	LC22
	fstpl	-136(%ebp)
	fld1
	fstpl	-144(%ebp)
	fldl	-128(%ebp)
	fstpl	4(%esp)
	movl	$LC23, (%esp)
	call	_printf
	fldl	-136(%ebp)
	fstpl	4(%esp)
	movl	$LC24, (%esp)
	call	_printf
	fldl	-144(%ebp)
	fstpl	4(%esp)
	movl	$LC23, (%esp)
	call	_printf
	fld1
	fchs
	fstpl	-152(%ebp)
	fldl	LC26
	fstpl	-160(%ebp)
	fld1
	fchs
	fstpl	-168(%ebp)
	fldl	-152(%ebp)
	fstpl	4(%esp)
	movl	$LC27, (%esp)
	call	_printf
	fldl	-160(%ebp)
	fstpl	4(%esp)
	movl	$LC28, (%esp)
	call	_printf
	fldl	-168(%ebp)
	fstpl	4(%esp)
	movl	$LC27, (%esp)
	call	_printf
	fildl	-20(%ebp)
	fldl	LC0
	fsubrp	%st, %st(1)
	fld1
	fsubrp	%st, %st(1)
	fstpl	-176(%ebp)
	fildl	-20(%ebp)
	fldl	LC9
	fsubp	%st, %st(1)
	fstpl	-184(%ebp)
	movl	$1, %eax
	subl	-20(%ebp), %eax
	movl	%eax, -284(%ebp)
	fildl	-284(%ebp)
	fldl	LC0
	fsubrp	%st, %st(1)
	fstpl	-192(%ebp)
	fldl	-176(%ebp)
	fstpl	4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	fldl	-184(%ebp)
	fstpl	4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	fldl	-192(%ebp)
	fstpl	4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	fildl	-20(%ebp)
	fsubl	-16(%ebp)
	fld1
	fsubrp	%st, %st(1)
	fstpl	-200(%ebp)
	fld1
	fsubl	-16(%ebp)
	fildl	-20(%ebp)
	fsubrp	%st, %st(1)
	fstpl	-208(%ebp)
	movl	$1, %eax
	subl	-20(%ebp), %eax
	movl	%eax, -284(%ebp)
	fildl	-284(%ebp)
	fsubl	-16(%ebp)
	fstpl	-216(%ebp)
	fldl	-200(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	fldl	-208(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	fldl	-216(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	movw	$1, -218(%ebp)
	filds	-218(%ebp)
	fsubl	-16(%ebp)
	fld1
	fsubrp	%st, %st(1)
	fstpl	-232(%ebp)
	fld1
	fsubl	-16(%ebp)
	filds	-218(%ebp)
	fsubrp	%st, %st(1)
	fstpl	-240(%ebp)
	movswl	-218(%ebp), %eax
	movl	$1, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -284(%ebp)
	fildl	-284(%ebp)
	fsubl	-16(%ebp)
	fstpl	-248(%ebp)
	fldl	-232(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	fldl	-240(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	fldl	-248(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	filds	-218(%ebp)
	fsubl	-16(%ebp)
	fildl	-20(%ebp)
	fsubrp	%st, %st(1)
	fstpl	-256(%ebp)
	fildl	-20(%ebp)
	fsubl	-16(%ebp)
	filds	-218(%ebp)
	fsubrp	%st, %st(1)
	fstpl	-264(%ebp)
	movswl	-218(%ebp), %eax
	movl	-20(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -284(%ebp)
	fildl	-284(%ebp)
	fsubl	-16(%ebp)
	fstpl	-272(%ebp)
	fldl	-256(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	fldl	-264(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	fldl	-272(%ebp)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	nop
	leave
	ret
	.section .rdata,"dr"
LC31:
	.ascii "target 4.4: %f\12\0"
LC33:
	.ascii "target 8.8: %f\12\0"
LC35:
	.ascii "target 9.68: %f\12\0"
	.text
	.globl	_mul
	.def	_mul;	.scl	2;	.type	32;	.endef
_mul:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$264, %esp
	fldl	LC29
	fstpl	-16(%ebp)
	movl	$2, -20(%ebp)
	fldl	-16(%ebp)
	fadd	%st(0), %st
	fstpl	-32(%ebp)
	fldl	-16(%ebp)
	fadd	%st(0), %st
	fstpl	-40(%ebp)
	fildl	-20(%ebp)
	fldl	-16(%ebp)
	fmulp	%st, %st(1)
	fstpl	-48(%ebp)
	fildl	-20(%ebp)
	fldl	-16(%ebp)
	fmulp	%st, %st(1)
	fstpl	-56(%ebp)
	fldl	LC30
	fstpl	-64(%ebp)
	fldl	LC30
	fstpl	-72(%ebp)
	fldl	-32(%ebp)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	fldl	-40(%ebp)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	fldl	-48(%ebp)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	fldl	-56(%ebp)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	fldl	-64(%ebp)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	fldl	-72(%ebp)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	fldl	LC32
	fstpl	-80(%ebp)
	fldl	LC32
	fstpl	-88(%ebp)
	fldl	LC32
	fstpl	-96(%ebp)
	fldl	-80(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	-88(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	-96(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	LC34
	fstpl	-104(%ebp)
	fldl	LC34
	fstpl	-112(%ebp)
	fldl	LC34
	fstpl	-120(%ebp)
	fldl	-104(%ebp)
	fstpl	4(%esp)
	movl	$LC35, (%esp)
	call	_printf
	fldl	-112(%ebp)
	fstpl	4(%esp)
	movl	$LC35, (%esp)
	call	_printf
	fldl	-120(%ebp)
	fstpl	4(%esp)
	movl	$LC35, (%esp)
	call	_printf
	fildl	-20(%ebp)
	fldl	LC29
	fmulp	%st, %st(1)
	fadd	%st(0), %st
	fstpl	-128(%ebp)
	fildl	-20(%ebp)
	fldl	LC30
	fmulp	%st, %st(1)
	fstpl	-136(%ebp)
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -236(%ebp)
	fildl	-236(%ebp)
	fldl	LC29
	fmulp	%st, %st(1)
	fstpl	-144(%ebp)
	fldl	-128(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	-136(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	-144(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fildl	-20(%ebp)
	fmull	-16(%ebp)
	fadd	%st(0), %st
	fstpl	-152(%ebp)
	fldl	-16(%ebp)
	fld	%st(0)
	faddp	%st, %st(1)
	fildl	-20(%ebp)
	fmulp	%st, %st(1)
	fstpl	-160(%ebp)
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -236(%ebp)
	fildl	-236(%ebp)
	fldl	-16(%ebp)
	fmulp	%st, %st(1)
	fstpl	-168(%ebp)
	fldl	-152(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	-160(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	-168(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	movw	$2, -170(%ebp)
	filds	-170(%ebp)
	fmull	-16(%ebp)
	fadd	%st(0), %st
	fstpl	-184(%ebp)
	fldl	-16(%ebp)
	fld	%st(0)
	faddp	%st, %st(1)
	filds	-170(%ebp)
	fmulp	%st, %st(1)
	fstpl	-192(%ebp)
	movswl	-170(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -236(%ebp)
	fildl	-236(%ebp)
	fldl	-16(%ebp)
	fmulp	%st, %st(1)
	fstpl	-200(%ebp)
	fldl	-184(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	-192(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	-200(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	filds	-170(%ebp)
	fmull	-16(%ebp)
	fildl	-20(%ebp)
	fmulp	%st, %st(1)
	fstpl	-208(%ebp)
	fildl	-20(%ebp)
	fmull	-16(%ebp)
	filds	-170(%ebp)
	fmulp	%st, %st(1)
	fstpl	-216(%ebp)
	movswl	-170(%ebp), %eax
	imull	-20(%ebp), %eax
	movl	%eax, -236(%ebp)
	fildl	-236(%ebp)
	fldl	-16(%ebp)
	fmulp	%st, %st(1)
	fstpl	-224(%ebp)
	fldl	-208(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	-216(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	fldl	-224(%ebp)
	fstpl	4(%esp)
	movl	$LC33, (%esp)
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
	call	_mul
	call	_getchar
	nop
	leave
	ret
	.section .rdata,"dr"
	.align 8
LC0:
	.long	-1717986918
	.long	1072798105
	.align 8
LC2:
	.long	-858993459
	.long	1073794252
	.align 8
LC4:
	.long	-858993459
	.long	1074318540
	.align 8
LC6:
	.long	-1717986918
	.long	1074370969
	.align 8
LC9:
	.long	-1717986912
	.long	-1078355559
	.align 8
LC10:
	.long	-1717986912
	.long	1069128089
	.align 8
LC15:
	.long	-858993459
	.long	-1073165108
	.align 8
LC18:
	.long	-858993460
	.long	-1075000116
	.align 8
LC19:
	.long	-1717986918
	.long	-1074685543
	.align 8
LC22:
	.long	-1717986918
	.long	-1073112679
	.align 8
LC26:
	.long	858993460
	.long	-1074580685
	.align 8
LC29:
	.long	-1717986918
	.long	1073846681
	.align 8
LC30:
	.long	-1717986918
	.long	1074895257
	.align 8
LC32:
	.long	-1717986918
	.long	1075943833
	.align 8
LC34:
	.long	-171798691
	.long	1076059176
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
