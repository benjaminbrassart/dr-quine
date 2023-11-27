; vim: set ft=nasm
; vim: nomodeline

global main
extern printf

section .text
colleen:
	push rbx
	mov rdi, format
	mov rsi, 10
	mov rdx, 9
	mov rcx, 34
	mov r8, format
	call printf
	pop rbx
	ret

main:
	push rbx
	call colleen
	pop rbx

	;
	;	nasm does not have multiline comments :(
	;

	mov rax, 0	; return 0
	ret

section .data
format:
	db "; vim: set ft=nasm%1$c; vim: nomodeline%1$c%1$cglobal main%1$cextern printf%1$c%1$csection .text%1$ccolleen:%1$c%2$cpush rbx%1$c%2$cmov rdi, format%1$c%2$cmov rsi, 10%1$c%2$cmov rdx, 9%1$c%2$cmov rcx, 34%1$c%2$cmov r8, format%1$c%2$ccall printf%1$c%2$cpop rbx%1$c%2$cret%1$c%1$cmain:%1$c%2$cpush rbx%1$c%2$ccall colleen%1$c%2$cpop rbx%1$c%1$c%2$c;%1$c%2$c;%2$cnasm does not have multiline comments :(%1$c%2$c;%1$c%1$c%2$cmov rax, 0%2$c; return 0%1$c%2$cret%1$c%1$csection .data%1$cformat:%1$c%2$cdb %3$c%4$s%3$c, 0%1$c", 0
