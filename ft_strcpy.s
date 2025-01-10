;char *strcpy(char *dest, const char *src);

bits 64
global ft_strcpy

section .text
    ft_strcpy:
        mov rdx, rdi            ; dest

        cmp rsi, 0              ; if (src == NULL)
        je  error

    loop:
        mov cl, byte [rsi]      ; put the char in cl
        mov byte [rdi], cl      ; copy char un rdi
        cmp byte [rsi], 0
        je  loop_end

        inc rdi
        inc rsi
        jmp loop

    loop_end:
        mov rax, rdx
        ret

    error:
        xor rax,rax             ; null to rax 
        ret



; // Entiers de 64 bits : rdi, rsi, rdx, rcx, r8, r9

; // Registres sauvegardés par l'appelé
; // rbx, rbp, rsp, r12, r13, r14, r15

; // Registres sauvegardés par l'appelant
; // rax, rcx, rdx, rsi, rdi, r8, r9, r10, r11

;rax, rbx, rcx , rdx, rdi , rsi , rbp, rsp, r8, r9, ... ,r15    64 bits
;eax, ebx, ecx, edx, edi, esi , ebp, esp, r8d, r9d, ... ,r15d   32 bits
;ax, bx, cx, dx, di , si , bp, sp, r8w, r9w, ... ,r15w          16 bits (15:0)
;ah, bh, ch, dh                                                 8 bits high (15:8)
;al , bl , cl , dl , dil , sil , bpl, spl ,r8b, r9b, ... ,r15b  8 bits low (7:0)
