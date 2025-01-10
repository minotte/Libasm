; int strncmp(const char *s1, const char *s2, size_t n);
bits 64
global ft_strcmp

section .text
    ft_strcmp:
        cmp rdi, 0          ; if (s1 == NULL)
        je end_s1_null
        cmp rsi, 0          ; same s2
        je end
        mov     rcx, 0          ; i = 0

    loop :  
        mov     r8b, byte [rdi]  ; s1[i]
        mov     r9b, byte [rsi]  ; s2[i]
        cmp     r8b, 0           ; if s1[i] == '\0' 
        je      end              ; if true go end
        cmp     r9b, 0           ; if s2[i] == '\0'
        je      end              ; if true go end
        cmp     r8b, r9b          
        jne     end             ; if (s1[i] != s2[i]) go to  end
        inc     rdi             ; *s1 + 1
        inc     rsi             ; *s2 + 1
        inc     rcx             ; i++
        jmp     loop            ; if (i < n)

    end :
        movsx   eax, r8b        ; extend r8b to unsigned int 
        movsx   ebx, r9b
        sub     eax, ebx        ; s1[i] - s2[i]
        movsx   rax, eax
        ret

    end_s1_null :
        mov     eax, 0 
        mov     r8b, byte [rsi]
        movsx   ebx, r8b
        sub     eax, ebx        ; s1[i] - s2[i]
        movsx   rax, eax
        ret
