; vim: set ft=nasm
; vim: nomodeline

extern strcmp, snprintf, fopen, fprintf, fclose, system

section .text
global main
main:
	mov qword [i], 5

	add rsp, -8
		mov rdi, file_name
		mov rsi, root_name
		call strcmp
	add rsp, 8

	cmp rax, 0
	je .duplicate
	dec qword [i]
.duplicate:
	add rsp, -8
		mov rdi, buffer
		mov rsi, BUFFER_SIZE
		mov rdx, format_duplicate
		mov rcx, qword [i]
		call snprintf
	add rsp, 8

	add rsp, -8
		mov rdi, buffer
		mov rsi, open_mode
		call fopen
	add rsp, 8

	push rax

		mov rdi, rax
		mov rsi, format
		mov rdx, 10
		mov rcx, 9
		mov r8, 34
		mov r9, format
		add rsp, -8
		push qword [i]
		call fprintf
		add rsp, 16

	pop rax

	add rsp, -8
		mov rdi, rax
		call fclose
	add rsp, 8

.compile:
	add rsp, -8
		mov rdi, buffer
		mov rsi, BUFFER_SIZE
		mov rdx, format_compile
		mov rcx, qword [i]
		call snprintf
	add rsp, 8

	add rsp, -8
		mov rdi, buffer
		call system
	add rsp, 8

	cmp qword [i], 0
	je .return

.run:
	add rsp, -8
		mov rdi, buffer
		mov rsi, BUFFER_SIZE
		mov rdx, format_run
		mov rcx, qword [i]
		call snprintf
	add rsp, 8

	add rsp, -8
		mov rdi, buffer
		call system
	add rsp, 8

.return:
	mov rax, 0
	ret

section .bss
buffer:
	resb 1024
BUFFER_SIZE equ $ - buffer
i:
	resq 1
section .data
align 16
file_name:
	db __FILE__, 0
root_name:
	db "Sully.s", 0
format_run:
	db "./Sully_%lld", 0
format_duplicate:
	db "Sully_%lld.s", 0
format_compile:
	db "nasm -f elf64 -g Sully_%1$lld.s -o Sully_%1$lld.o"
	db "; "
	db "cc -lc -no-pie Sully_%1$lld.o -o Sully_%1$lld"
	db "; "
	db "rm -f Sully_%1$lld.o"
	db 0
open_mode:
	db "w", 0
format:
	db "; vim: set ft=nasm%1$c; vim: nomodeline%1$c%1$cextern strcmp, snprintf, fopen, fprintf, fclose, system%1$c%1$csection .text%1$cglobal main%1$cmain:%1$c%2$cmov qword [i], %5$lld%1$c%1$c%2$cadd rsp, -8%1$c%2$c%2$cmov rdi, file_name%1$c%2$c%2$cmov rsi, root_name%1$c%2$c%2$ccall strcmp%1$c%2$cadd rsp, 8%1$c%1$c%2$ccmp rax, 0%1$c%2$cjz .duplicate%1$c%2$cdec qword [i]%1$c.duplicate:%1$c%2$cadd rsp, -8%1$c%2$c%2$cmov rdi, buffer%1$c%2$c%2$cmov rsi, BUFFER_SIZE%1$c%2$c%2$cmov rdx, format_duplicate%1$c%2$c%2$cmov rcx, qword [i]%1$c%2$c%2$ccall snprintf%1$c%2$cadd rsp, 8%1$c%1$c%2$cadd rsp, -8%1$c%2$c%2$cmov rdi, buffer%1$c%2$c%2$cmov rsi, open_mode%1$c%2$c%2$ccall fopen%1$c%2$cadd rsp, 8%1$c%1$c%2$cpush rax%1$c%1$c%2$c%2$cmov rdi, rax%1$c%2$c%2$cmov rsi, format%1$c%2$c%2$cmov rdx, 10%1$c%2$c%2$cmov rcx, 9%1$c%2$c%2$cmov r8, 34%1$c%2$c%2$cmov r9, format%1$c%2$c%2$cadd rsp, -8%1$c%2$c%2$cpush qword [i]%1$c%2$c%2$ccall fprintf%1$c%2$c%2$cadd rsp, 16%1$c%1$c%2$cpop rax%1$c%1$c%2$cadd rsp, -8%1$c%2$c%2$cmov rdi, rax%1$c%2$c%2$ccall fclose%1$c%2$cadd rsp, 8%1$c%1$c.compile:%1$c%2$cadd rsp, -8%1$c%2$c%2$cmov rdi, buffer%1$c%2$c%2$cmov rsi, BUFFER_SIZE%1$c%2$c%2$cmov rdx, format_compile%1$c%2$c%2$cmov rcx, qword [i]%1$c%2$c%2$ccall snprintf%1$c%2$cadd rsp, 8%1$c%1$c%2$cadd rsp, -8%1$c%2$c%2$cmov rdi, buffer%1$c%2$c%2$ccall system%1$c%2$cadd rsp, 8%1$c%1$c%2$ccmp qword [i], 0%1$c%2$cjl .return%1$c%1$c.run:%1$c%2$cadd rsp, -8%1$c%2$c%2$cmov rdi, buffer%1$c%2$c%2$cmov rsi, BUFFER_SIZE%1$c%2$c%2$cmov rdx, format_run%1$c%2$c%2$cmov rcx, qword [i]%1$c%2$c%2$ccall snprintf%1$c%2$cadd rsp, 8%1$c%1$c%2$cadd rsp, -8%1$c%2$c%2$cmov rdi, buffer%1$c%2$c%2$ccall system%1$c%2$cadd rsp, 8%1$c%1$c.return:%1$c%2$cmov rax, 0%1$c%2$cret%1$c%1$csection .bss%1$cbuffer:%1$c%2$cresb 1024%1$cBUFFER_SIZE equ $ - buffer%1$ci:%1$c%2$cresq 1%1$csection .data%1$calign 16%1$cfile_name:%1$c%2$cdb __FILE__, 0%1$croot_name:%1$c%2$cdb %3$cSully.s%3$c, 0%1$cformat_run:%1$c%2$cdb %3$c./Sully_%%lld%3$c, 0%1$cformat_duplicate:%1$c%2$cdb %3$cSully_%%lld.s%3$c, 0%1$cformat_compile:%1$c%2$cdb %3$cnasm -f elf64 -g Sully_%%1$lld.s -o Sully_%%1$lld.o%3$c%1$c%2$cdb %3$c; %3$c%1$c%2$cdb %3$ccc -lc -no-pie Sully_%%1$lld.o -o Sully_%%1$lld%3$c%1$c%2$cdb %3$c; %3$c%1$c%2$cdb %3$crm -f Sully_%%1$lld.o%3$c%1$c%2$cdb 0%1$copen_mode:%1$c%2$cdb %3$cw%3$c, 0%1$cformat:%1$c%2$cdb %3$c%4$s%3$c, 0%1$c", 0
