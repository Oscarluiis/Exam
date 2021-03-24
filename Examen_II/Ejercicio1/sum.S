#set byte [0x10000000] = ["The sum of squares is: ", 0]
call main

; Exit program
mov eax, 10
int 0x80

;array = dword[esp+4]
;size = dword[esp+8]
sum:
    mov eax,0;eax=sum
    mov ebx,0;i = ebx

    for:
        cmp ebx,dword[esp+8]
        jge end_for
            ;apuntador al array
            mov ecx, dword[esp+4] 
            mov ecx, dword[ecx+ebx*4]
            ;salvar el valor del eax
            sub esp,4
            mov dword[esp], eax

            mov eax,ecx
            mul ecx
            mov ecx,eax

            ;recuperar el valor del eax
            mov eax, dword[esp]
            add esp,4
            add eax,ecx
            inc ebx
            jmp for
    end_for:
end_sum:
    ret


main:
    sub esp,60
    mov dword[esp+56],65
    mov dword[esp+52],52
    mov dword[esp+48],55
    mov dword[esp+44],20
    mov dword[esp+40],10
    mov dword[esp+36],86
    mov dword[esp+32],22
    mov dword[esp+28],50
    mov dword[esp+24],45
    mov dword[esp+20],5
    mov dword[esp+16],41
    mov dword[esp+12],43
    mov dword[esp+8],10
    mov dword[esp+4],13
    mov edx,esp
    add edx,8
    mov dword[esp],edx
    call sum
    add esp,60
    mov edx,eax
    ;imprimir mensaje
    mov eax,4
    mov ebx,0x10000000
    int 0x80
    ;imprimir valor
    mov eax,1
    mov ebx,edx
    int 0x80
    ;imprimir salto de linea
    mov eax,11
    mov ebx,10
    int 0x80

    ret
