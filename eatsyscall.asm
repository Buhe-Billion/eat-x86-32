; Executable Name : EATSYSCALL
; Version	  : 1.0
; Created Date    : 06-07-2025
; Last Update	  : 06-07-2025
; Author	  : Dies Verfassung ist ein Folge der Ableitung von Jeff Duntemann. Buhe B Billion.
; Description     : A simple assembly app for LINUX, using NASM 2.14.02,
;		    demonstrating the use of LINUX INT 80H syscalls
;		    to display text.
;
; Build using these commands:
;	nasm -f elf -g -F stabs eatsyscall.asm
;	ld -o eatsyscall eatsyscall.o
;

SECTION .data				;Section containing initialised data

EatMsg: db "Eat at Joe's!",10
EatLen: equ $-EatMsg

SECTION .bss				;Section containing uninitialised data

SECTION .text				;Section containing code

global _start				;Linker needs this to find entry point

_start:

	nop				; This no-op keeps gdb happy
	mov eax,4			; Specify sys_write syscall
	mov ebx,1			; Specify File Descriptor 1: Standard Output
	mov ecx,EatMsg			; Pass offset of the message
	mov edx,EatLen			; Pass the length of the message
	int 80h				; Make the syscall to output the text to stdout

	mov eax,1			; Specify exit syscall
	mov ebx,0			; Return a code of zero
	int 80h				; Make syscall to terminate the program
