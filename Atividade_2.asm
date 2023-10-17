;Programa hardcode ''
;Introdução ao Assembly
;Author: Gabriel Joaquim, FEAP
;Version: Gabriel Joaquim Carlos De Andrade Rodrigues, curso Engenharia da computação


section .data
    msg1 db 'A soma é: ', 0
    len equ $ - msg1

section .bss
    res resb 1

section .text
    global _start

_start:
    ; Inicializar os valores
    mov eax, 3      ; Primeiro número
    mov ebx, 4      ; Segundo número

    ; Calcular a soma
    add eax, ebx

    ; Converter o resultado para caractere ASCII
    add eax, '0'

    ; Armazenar o resultado na variável res
    mov [res], eax

    ; Imprimir a mensagem
    mov eax, 4      
    mov ebx, 1      
    mov ecx, msg1   
    mov edx, len    
    int 0x80

    ; Imprimir o resultado
    mov eax, 4      
    mov ebx, 1      
    mov ecx, res    
    mov edx, 1      
    int 0x80

    ; Sair do programa
    mov eax, 1     
    xor ebx, ebx    
    int 0x80
