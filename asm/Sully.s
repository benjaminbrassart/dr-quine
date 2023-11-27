; vim: set ft=nasm
; vim: nomodeline

global main
extern snprintf, fprintf, fopen, fclose, system

%define BUFFER_SIZE 256

section .text
main:
	mov qword [i], 5
	dec qword [i]

	push rbx
	call duplicate
	mov rdx, format_compile
	call exec_command
	pop rbx

	cmp qword [i], 0
	jle .return

	push rbx
	mov rdx, format_run
	call exec_command
	pop rbx

.return:
	mov rax, 0
	ret

duplicate:
	mov rdi, buffer
	mov rsi, BUFFER_SIZE
	mov rdx, format_source
	mov rcx, qword [i]

	push rbx
	call snprintf

	mov rdi, buffer
	mov rsi, open_mode

	call fopen
	pop rbx

	cmp rax, 0
	je error

	push rax

	mov rdi, rax
	mov rsi, src
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	mov r9, src
	push rbx
	push qword [i]

	call fprintf

	pop rax ; push qword [i]
	pop rbx
	pop rdi
	mov rdi, rdi

	call fclose
	ret

exec_command:
	mov rdi, buffer
	mov rsi, BUFFER_SIZE
	mov rdx, rdx
	mov rcx, qword [i]

	push rbx
	call snprintf
	mov rdi, buffer
	call system
	cmp rax, 0
	jne error
	pop rbx
	ret

error: ; sys_exit(1)
	mov rax, 60
	mov rdi, 1
	syscall

section .bss
buffer: resb BUFFER_SIZE
i: resq 1

section .data
open_mode: db "w", 0
format_run: db "./Sully_%d", 0
format_compile: db "nasm -f elf64 Sully_%1$d.s -g -o Sully_%1$d.o && clang Sully_%1$d.o -o Sully_%1$d -lc && rm -f Sully_%1$d.o", 0
format_source: db "Sully_%d.s", 0
src: db "; vim: set ft=nasm%1$c; vim: nomodeline%1$c%1$cglobal main%1$cextern snprintf, fprintf, fopen, fclose, system%1$c%1$c%%define BUFFER_SIZE 256%1$c%1$csection .text%1$cmain:%1$c%2$cmov qword [i], %5$d%1$c%2$cdec qword [i]%1$c%1$c%2$cpush rbx%1$c%2$ccall duplicate%1$c%2$cmov rdx, format_compile%1$c%2$ccall exec_command%1$c%2$cpop rbx%1$c%1$c%2$ccmp qword [i], 0%1$c%2$cjle .return%1$c%1$c%2$cpush rbx%1$c%2$cmov rdx, format_run%1$c%2$ccall exec_command%1$c%2$cpop rbx%1$c%1$c.return:%1$c%2$cmov rax, 0%1$c%2$cret%1$c%1$cduplicate:%1$c%2$cmov rdi, buffer%1$c%2$cmov rsi, BUFFER_SIZE%1$c%2$cmov rdx, format_source%1$c%2$cmov rcx, qword [i]%1$c%1$c%2$cpush rbx%1$c%2$ccall snprintf%1$c%1$c%2$cmov rdi, buffer%1$c%2$cmov rsi, open_mode%1$c%1$c%2$ccall fopen%1$c%2$cpop rbx%1$c%1$c%2$ccmp rax, 0%1$c%2$cje error%1$c%1$c%2$cpush rax%1$c%1$c%2$cmov rdi, rax%1$c%2$cmov rsi, src%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$cmov r9, src%1$c%2$cpush rbx%1$c%2$cpush qword [i]%1$c%1$c%2$ccall fprintf%1$c%1$c%2$cpop rax ; push qword [i]%1$c%2$cpop rbx%1$c%2$cpop rdi%1$c%2$cmov rdi, rdi%1$c%1$c%2$ccall fclose%1$c%2$cret%1$c%1$cexec_command:%1$c%2$cmov rdi, buffer%1$c%2$cmov rsi, BUFFER_SIZE%1$c%2$cmov rdx, rdx%1$c%2$cmov rcx, qword [i]%1$c%1$c%2$cpush rbx%1$c%2$ccall snprintf%1$c%2$cmov rdi, buffer%1$c%2$ccall system%1$c%2$ccmp rax, 0%1$c%2$cjne error%1$c%2$cpop rbx%1$c%2$cret%1$c%1$cerror: ; sys_exit(1)%1$c%2$cmov rax, 60%1$c%2$cmov rdi, 1%1$c%2$csyscall%1$c%1$csection .bss%1$cbuffer: resb BUFFER_SIZE%1$ci: resq 1%1$c%1$csection .data%1$copen_mode: db %3$cw%3$c, 0%1$cformat_run: db %3$c./Sully_%%d%3$c, 0%1$cformat_compile: db %3$cnasm -f elf64 Sully_%%1$d.s -g -o Sully_%%1$d.o && clang Sully_%%1$d.o -o Sully_%%1$d -lc && rm -f Sully_%%1$d.o%3$c, 0%1$cformat_source: db %3$cSully_%%d.s%3$c, 0%1$csrc: db %3$c%4$s%3$c, 0%1$c", 0
