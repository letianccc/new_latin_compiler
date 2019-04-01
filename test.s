.section .rodata
.LC0:
.string "value\n"
.text
.global _main
_main:
	
                    pushl %ebp
                    pushl %ebx
                    pushl %esi
                    pushl %edi
                    movl %esp, %ebp
                movl $.LC0, (%esp)
movl $0, %eax
call _printf
movl $0, %eax
call _getchar
leave
ret
