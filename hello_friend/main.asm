global _start

_start:
	; Set eax to syscall 0x4 which is write
	mov eax, 0x4
	; Set file descriptor to 1
	mov ebx, 0x1
	; Set second parameter as the string
	mov ecx, string
	; Set the third variable as the string length
	mov edx, stringL
	; interupt (int) 0x80 tells program to run whatever is in eax (syscall)
	int 0x80

	; EXIT STATUS
	; Syscall 1 is the exit syscall
	mov eax, 0x1
	; Exit status of zero means no errors have occured during execution
	mov ebx, 0x0
	; Execute syscall within eax
	int 0x80

	; Our string is a defined byte (df), with a \n (0x0a) at the end
	string: db "Hello, Friend.", 0x0a
	; string length is [equ]al to the string 
	; length ($-string(end of string - start of string, difference in memory location)) 
	stringL: equ $-string
