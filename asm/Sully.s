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
	call compile
	pop rbx

	cmp qword [i], 0
	je .return

	push rbx
	call run
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
	push qword [i]

	push rbx
	call fprintf
	pop rbx

	pop rax ; push qword [i]
	pop rdi
	mov rdi, rdi

	call fclose
	ret

compile: ; TODO
	ret

run: ; TODO
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
format_compile: db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d", 0
format_source: db "Sully_%d.s", 0
src: db "section .bss%1$cbuffer:%1$c%2$cresb 256%1$c%1$csection .data%1$ci:%1$c%2$cdq %6$lld%1$csrc:%1$c%2$cdb %3$c%4$s%3$c, 0%1$c", 0
