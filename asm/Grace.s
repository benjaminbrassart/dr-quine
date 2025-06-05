; vim: set ft=nasm
; vim: nomodeline

extern fprintf, fopen, fclose

%macro MAIN 0
global main
main:
	add rsp, -8
	mov rdi, file_name
	mov rsi, open_mode
	call fopen wrt ..plt
	add rsp, 8

	cmp rax, 0
	jz .err

	push rax
	add rsp, -8
	PRINT qword rax
	add rsp, 8
	pop rax

	add rsp, -8
	mov rdi, rax
	call fclose
	add rsp, 8

	mov rax, 0
	ret
.err:
	mov rax, 1
	ret
%endmacro

%macro PRINT 1 ; (%1 = File)
	add rsp, -8
	mov rdi, %1
	mov rsi, format
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	mov r9, format
	call fprintf wrt ..plt
	add rsp, 8
%endmacro

section .text
MAIN

section .data
align 16
file_name:
	db "Grace_kid.s", 0
open_mode:
	db "w", 0
format:
	db "; vim: set ft=nasm%1$c; vim: nomodeline%1$c%1$cextern fprintf, fopen, fclose%1$c%1$c%%macro MAIN 0%1$cglobal main%1$cmain:%1$c%2$cadd rsp, -8%1$c%2$cmov rdi, file_name%1$c%2$cmov rsi, open_mode%1$c%2$ccall fopen wrt ..plt%1$c%2$cadd rsp, 8%1$c%1$c%2$ccmp rax, 0%1$c%2$cjz .err%1$c%1$c%2$cpush rax%1$c%2$cadd rsp, -8%1$c%2$cPRINT qword rax%1$c%2$cadd rsp, 8%1$c%2$cpop rax%1$c%1$c%2$cadd rsp, -8%1$c%2$cmov rdi, rax%1$c%2$ccall fclose%1$c%2$cadd rsp, 8%1$c%1$c%2$cmov rax, 0%1$c%2$cret%1$c.err:%1$c%2$cmov rax, 1%1$c%2$cret%1$c%%endmacro%1$c%1$c%%macro PRINT 1 ; (%%1 = File)%1$c%2$cadd rsp, -8%1$c%2$cmov rdi, %%1%1$c%2$cmov rsi, format%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$cmov r9, format%1$c%2$ccall fprintf wrt ..plt%1$c%2$cadd rsp, 8%1$c%%endmacro%1$c%1$csection .text%1$cMAIN%1$c%1$csection .data%1$calign 16%1$cfile_name:%1$c%2$cdb %3$cGrace_kid.s%3$c, 0%1$copen_mode:%1$c%2$cdb %3$cw%3$c, 0%1$cformat:%1$c%2$cdb %3$c%4$s%3$c, 0%1$c", 0
