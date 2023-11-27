; vim: set ft=nasm
; vim: nomodeline

global main
extern fprintf, fputs, fopen, fclose

;
;	this is fun!
;

%macro MAIN 0
main:
	mov rdi, file_name
	mov rsi, open_mode

	push rbx
	call fopen
	pop rbx

	cmp rax, 0
	jne .open_success

.open_fail:
	mov rax, 1
	ret

.open_success:
	mov rdi, rax
	push rdi
	push rbx

	PRINT rdi, format

	pop rbx
	pop rdi

	push rbx
	call fclose
	pop rbx

	mov rax, 0
	ret
%endmacro

%macro PRINT 2 ; (%1 = File, %2 = Format)
	mov rdi, qword %1
	mov rsi, qword %2
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	mov r9, qword %2
	push rbx
	call fprintf
	pop rbx
%endmacro

section .text
MAIN

section .data
open_fail_message:
	db "cannot write to "
file_name:
	db "Grace_kid.s", 0

open_mode:
	db "w", 0

format:
	db "; vim: set ft=nasm%1$c; vim: nomodeline%1$c%1$cglobal main%1$cextern fprintf, fputs, fopen, fclose%1$c%1$c;%1$c;%2$cthis is fun!%1$c;%1$c%1$c%%macro MAIN 0%1$cmain:%1$c%2$cmov rdi, file_name%1$c%2$cmov rsi, open_mode%1$c%1$c%2$cpush rbx%1$c%2$ccall fopen%1$c%2$cpop rbx%1$c%1$c%2$ccmp rax, 0%1$c%2$cjne .open_success%1$c%1$c.open_fail:%1$c%2$cmov rax, 1%1$c%2$cret%1$c%1$c.open_success:%1$c%2$cmov rdi, rax%1$c%2$cpush rdi%1$c%2$cpush rbx%1$c%1$c%2$cPRINT rdi, format%1$c%1$c%2$cpop rbx%1$c%2$cpop rdi%1$c%1$c%2$cpush rbx%1$c%2$ccall fclose%1$c%2$cpop rbx%1$c%1$c%2$cmov rax, 0%1$c%2$cret%1$c%%endmacro%1$c%1$c%%macro PRINT 2 ; (%%1 = File, %%2 = Format)%1$c%2$cmov rdi, qword %%1%1$c%2$cmov rsi, qword %%2%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$cmov r9, qword %%2%1$c%2$cpush rbx%1$c%2$ccall fprintf%1$c%2$cpop rbx%1$c%%endmacro%1$c%1$csection .text%1$cMAIN%1$c%1$csection .data%1$copen_fail_message:%1$c%2$cdb %3$ccannot write to %3$c%1$cfile_name:%1$c%2$cdb %3$cGrace_kid.s%3$c, 0%1$c%1$copen_mode:%1$c%2$cdb %3$cw%3$c, 0%1$c%1$cformat:%1$c%2$cdb %3$c%4$s%3$c, 0%1$c", 0
