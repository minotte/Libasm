# Cours ASSEMBLEUR

### écriture

```
<étiquette>(:) <instruction> <opérande(s)>; les : sont facultatifs
        <instruction> <opérande(s)>
        <instruction> <opérande(s)>
```
les étiquettes ne doivent pas commencer par un chiffre
le $ peut  dire que c'est une étiquette par exemple $rax c'est une etiquette et non un registre. 


### directive

cela indique explicitement des information
exemple : bits, extern, section, global...  

### Macros
pour ecrire utiliser %define nom_macros valeur
ex : ```%define msg_length 13```

## Convention en SystemV AMD64

rax c'est l'accumalateur, curseur pour choisir une fonction particulier ou comme retour
* Paramètres
  - Entiers de 64 bits : ``rdi``, ``rsi``, ``rdx``, ``rcx``, ``r8``, ``r9`` ; si plus d'argument les mettre sur la sack
  - Flottants de 128 bits : ``xmm0``, ``xmm1``, ``xmm2``, ``xmm3``, ``xmm4``, ``xmm5``, ``xmm6``, ``xmm7``
  - Flottants de 256 bits : ``ymm0``, ``ymm1``, ``ymm2``, ``ymm3``, ``ymm4``, ``ymm5``, ``ymm6``, ``ymm7``
  - Flottants de 512 bits : ``zmm0``, ``zmm1``, ``zmm2``, ``zmm3``, ``zmm4``, ``zmm5``, ``zmm6``, ``zmm7``
* Paramètres supplémentaires
* pile (de droite à gauche)
  - Valeur de retour
  - Entier de 64 bits :      ``rax``
  - Entier de 128 bits :     ``rdx:rax``
  - Flottant de 128 bits :   ``xmm0``
  - Flottant de 256 bits :   ``xmm1:xmm0``
* Registres sauvegardés par l'appelé
  - ``rbx``, ``rbp``, ``rsp``, ``r12``, ``r13``, ``r14``, ``r15``
* Registres sauvegardés par l'appelant
  - ``rax``, ``rcx``, ``rdx``, ``rsi``, ``rdi``, ``r8``, ``r9``, ``r10``, ``r11``
  - ``xmm0``, ``xmm1``, ``xmm2``, ``xmm3``, ``xmm4``, ``xmm5``, ``xmm6``, ``xmm7``, ``xmm8``, ``xmm9``, ``xmm10``, ``xmm11``, ``xmm12``, ``xmm13``, ``xmm14``, ``xmm15``
  - ``ymm0``, ``ymm1``, ``ymm2``, ``ymm3``, ``ymm4``, ``ymm5``, ``ymm6``, ``ymm7``, ``ymm8``, ``ymm9``, ``ymm10``, ``ymm11``, ``ymm12``, ``ymm13``, ``ymm14``, ``ymm15``
  - ``zmm0``, ``zmm1``, ``zmm2``, ``zmm3``, ``zmm4``, ``zmm5``, ``zmm6``, ``zmm7``, ``zmm8``, ``zmm9``, ``zmm10``, ``zmm11``, ``zmm12``, ``zmm13``, ``zmm14``, ``zmm15``

### exemple de code Helloword

#### 64bits

```
bits 64; indique en quel base mais pas obligatoire

section .data
    message db 'Hello Word!', 10

section .text
    global  _start
    _start:
        mov rax, 1  
        mov rdi, 1 ; descripteur
        mov rsi, message
        mov rdx, 13
        syscall

        mov rax, 60
        mov rdi, 0
        syscall
```
pour compiler: 
```bash
> nasm -f elf64  program.s -o program.o
> ld helloword.o -o helloword
```

#### 32bits

```
bits 32

section .data
    message db 'Hello Word!', 10

section .text
    global  _start
    _start:
        mov eax, 4  
        mov ebx, 1 ; descripteur
        mov ecx, message
        mov edx, 13
        int 0x80

        mov eax, 1
        mov ebx, 0
        int 0x80
```
pour compiler: 
```bash
> nasm -f elf32  program.s -o program.o
> ld -m elf_i386 program.o -o program
```

## variable

```b (byte : 8 bits)
  w(word : 16 bits)
  d(double-word : 32 bits) -> float
  q(quadruplw-word : 64 bits) ->double

  t
  o
  y
  z 
  
```

## CONDITION

```s
CMP <A>, <B> : compare valeur num
JMP <label> : saut  inconditonnel

JE : fais le saut si A == B
JNE: fais le saut si A != B

JG  : " si A > B
JL  : " si A < B
JGE : " si A >= B
JLE : " si A <= B
```


#### Source : FormationVideo sur youtube https://www.youtube.com/watch?v=fvtd2Ut3MHw&list=PLrSOXFDHBtfEs7PCC6r44iXiX5gMlbjcR&index=2