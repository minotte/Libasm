bits 64
global ft_strlen

section .text
    ft_strlen:
        mov rcx, 0 
        mov rbx, rdi

    loop:
        
        cmp byte [rbx], 0

        jz  loop_end            ; end of the loop

        inc rcx                 ; increment i
        inc rbx                 ; increment *str
        jmp loop                ; to loop
    
    loop_end:
        mov rax, rcx            ; return rax
        ret
