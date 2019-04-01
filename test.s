.section .rodata
.LC0:
.string "func\n"
.LC1:
.string "value\n"
.text
.global _func
_func:
pushl %ebp
pushl %ebx
pushl %esi
pushl %edi
movl %esp, %ebp
movl $.LC0, (%esp)
movl $0, %eax
call _printf
movl $0, %eax
movl %ebp, %esp
popl %edi
popl %esi
popl %ebx
popl %ebp
ret
.text
.global _main
_main:
pushl %ebp
pushl %ebx
pushl %esi
pushl %edi
movl %esp, %ebp
call _func
movl $.LC1, (%esp)
movl $0, %eax
call _printf
movl $0, %eax
call _getchar
movl %ebp, %esp
popl %edi
popl %esi
popl %ebx
popl %ebp
ret
