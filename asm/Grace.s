; vim: set ft=nasm
; vim: nomodeline

extern fprintf, fputs, fopen, fclose, stderr

%macro MAIN 0
global main
main:
	; stack: 0
	mov rdi, file_name
	mov rsi, open_mode

	push rbx
	; stack: 1
	call fopen
	pop rbx
	; stack: 0

	push rax
	; stack: 1

	PRINT qword rax

	pop rdi
	; stack: 0
	mov rdi, rdi

	push rbx
	; stack: 1
	call fclose
	pop rbx
	; stack: 0

	mov rax, 0
	ret
%endmacro

%macro PRINT 1 ; (%1 = File)
	mov rdi, %1
	mov rsi, format
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	mov r9, format

	call fprintf
%endmacro

MAIN

section .data
file_name:
	db "Grace_kid.s", 0
open_mode:
	db "w", 0
format:
	db "; vim: set ft=nasm%1$c; vim: nomodeline%1$c%1$cextern fprintf, fputs, fopen, fclose, stderr%1$c%1$c%%macro MAIN 0%1$cglobal main%1$cmain:%1$c%2$c; stack: 0%1$c%2$cmov rdi, file_name%1$c%2$cmov rsi, open_mode%1$c%1$c%2$cpush rbx%1$c%2$c; stack: 1%1$c%2$ccall fopen%1$c%2$cpop rbx%1$c%2$c; stack: 0%1$c%1$c%2$cpush rax%1$c%2$c; stack: 1%1$c%1$c%2$cPRINT qword rax%1$c%1$c%2$cpop rdi%1$c%2$c; stack: 0%1$c%2$cmov rdi, rdi%1$c%1$c%2$cpush rbx%1$c%2$c; stack: 1%1$c%2$ccall fclose%1$c%2$cpop rbx%1$c%2$c; stack: 0%1$c%1$c%2$cmov rax, 0%1$c%2$cret%1$c%%endmacro%1$c%1$c%%macro PRINT 1 ; (%%1 = File)%1$c%2$cmov rdi, %%1%1$c%2$cmov rsi, format%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$cmov r9, format%1$c%1$c%2$ccall fprintf%1$c%%endmacro%1$c%1$cMAIN%1$c%1$csection .data%1$cfile_name:%1$c%2$cdb %3$cGrace_kid.s%3$c, 0%1$copen_mode:%1$c%2$cdb %3$cw%3$c, 0%1$cformat:%1$c%2$cdb %3$c%4$s%3$c, 0%1$c", 0
