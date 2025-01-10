bits 64

;Macro
STDOUT: equ 1
STDIN:  equ 0
%define SYS_WRITE

section .data
    message: db "Bonjour,  "
    MESSAGE_LENGTH: equ $-message
    ; USERNAME_MAX_LENGTH: equ 11

section .text
    global _start
    _start:
        ;compteur 
        mov rbx,    5

        loop_message:
            mov rax, SYS_WRITE
            mov rdi,    FD

        
        ; Quitte le programme
        mov rax, 60
        xor rdi, rdi
        syscall