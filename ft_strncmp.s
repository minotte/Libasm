; int strncmp(const char *s1, const char *s2, size_t n);
bits 64
global ft_strcmp

section .text
    ft_strcmp:
        cmp rdi, 0          ; if (s1 == NULL)
        je end
        cmp rsi, 0          ; same s2
        je end

    for1 :
        mov rcx, 0          ; i = 0
        
    next1 :
        mov r8b, byte [rdi]  ; s1[i]
        mov r9b, byte [rsi]  ; s2[i]
        cmp r8b, 0           ; if s1[i] == '\0' 
        je end              ; if true go end
        cmp r9b, 0           ; if s2[i] == '\0'
        je end              ; if true go end
        cmp r8b, r9b          
        jne end             ; if (s1[i] != s2[i]) go to  end
        inc rdi             ; *s1 + 1
        inc rsi             ; *s2 + 1
        inc rcx             ; i++
        jl  next1           ; if (i < n)

    end :
        movsx eax, r8b       ; extend r8b to nonsigned int 
        movsx ebx, r9b
        sub eax, ebx        ; s1[i] - s2[i]
        movsx rax, eax
        ret

    ; error :
    ;     xor rax, rax
    ;     ret

    ; end_up :
    ;     mov rax,
    ;     ret

; // Entiers de 64 bits : rdi, rsi, rdx, rcx, r8, r9

; // Registres sauvegardés par l'appelé
; // rbx, rbp, rsp, r12, r13, r14, r15

; // Registres sauvegardés par l'appelant
; // rax, rcx, rdx, rsi, rdi, r8, r9, r10, r11

;rax, rbx, rcx, rdx, rdi, rsi, rbp, rsp, r8, r9, ... ,r15    64 bits
;eax, ebx, ecx, edx, edi, esi, ebp, esp, r8d, r9d, ... ,r15d   32 bits
;ax,  bx,  cx,  dx,  di , si,  bp, sp, r8w, r9w, ... ,r15w          16 bits (15:0)
;ah,  bh,  ch,  dh                                                 8 bits high (15:8)
;r8b, r9b , cl, dl , dil, sil, bpl, spl ,r8b, r9b, ... ,r15b  8 bits low (7:0)


;   i = 0;
; 	while (i < n && (s1[i] != '\0' || s2[i] != '\0'))
; 	{
; 		if (s1[i] != s2[i])
; 		{
; 			cmp = (unsigned char)s1[i] - (unsigned char)s2[i];
; 			return (cmp);
; 		}
; 		i++;
; 	}
