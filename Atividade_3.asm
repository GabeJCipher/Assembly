section .bss
    nome resb 11   ; espaço para armazenar o nome (10 caracteres + 1 para o caractere nulo)

section .text
global _start

_start:
    ; Limpe os registros
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx

    ; Chame a syscall para sys_write para exibir a mensagem "Informe seu nome: "
    mov eax, 4       ; Código da syscall para sys_write
    mov ebx, 1       ; Descritor de arquivo padrão (saída padrão)
    mov ecx, mensagem ; Endereço da string "Informe seu nome: "
    mov edx, mensagem_len ; Comprimento da string
    int 0x80         ; Interrupção do sistema para syscall

    ; Leia o nome do usuário até que Enter seja pressionado
    mov eax, 3       ; Código da syscall para sys_read
    mov ebx, 0       ; Descritor de arquivo padrão (entrada padrão)
    mov ecx, nome    ; Endereço da variável 'nome' para armazenar a entrada
    mov edx, 11      ; Tamanho máximo de entrada (10 caracteres + 1 para o caractere nulo)
    int 0x80         ; Interrupção do sistema para syscall

    ; Adicione uma nova linha após a entrada
    mov eax, 4       ; Código da syscall para sys_write
    mov ebx, 1       ; Descritor de arquivo padrão (saída padrão)
    mov ecx, newline ; Endereço da string "newline"
    mov edx, 1       ; Comprimento da string
    int 0x80         ; Interrupção do sistema para syscall

    ; Mostre a saudação
    mov eax, 4       ; Código da syscall para sys_write
    mov ebx, 1       ; Descritor de arquivo padrão (saída padrão)
    mov ecx, saudacao ; Endereço da string "Saudações, "
    mov edx, 11      ; Comprimento da string
    int 0x80         ; Interrupção do sistema para syscall

    ; Adicione um espaço entre "Saudações" e o nome
    mov eax, 4       ; Código da syscall para sys_write
    mov ebx, 1       ; Descritor de arquivo padrão (saída padrão)
    mov ecx, espaco  ; Endereço da string " "
    mov edx, 1       ; Comprimento da string
    int 0x80         ; Interrupção do sistema para syscall

    ; Mostre o nome informado pelo usuário
    mov eax, 4       ; Código da syscall para sys_write
    mov ebx, 1       ; Descritor de arquivo padrão (saída padrão)
    mov ecx, nome    ; Endereço da variável 'nome'
    mov edx, 11      ; Comprimento máximo do nome
    int 0x80         ; Interrupção do sistema para syscall

    ; Saia do programa
    mov eax, 1       ; Código da syscall para sys_exit
    int 0x80         ; Interrupção do sistema para syscall

section .data
saudacao db "Saudações,",0
espaco db " ",0
newline db 10,0
mensagem db "Informe seu nome: "
mensagem_len equ $ - mensagem
