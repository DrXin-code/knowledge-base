; calc.asm - Assembly code to launch calc.exe
section .text
global _start

_start:
    ; XOR the registers
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Push the string 'calc'
    push eax
    push 0x636c6163  ; 'calc'

    ; Move the address of the string into ebx
    mov ebx, esp

    ; Move the address of the string into ecx (CreateProcessA expects a pointer to the command line)
    mov ecx, esp

    ; Call WinExec (0x7c86153a)
    mov eax, 0x7c86153a
    call eax

    ; Exit the process
    xor eax, eax
    inc eax
    int 0x80
