.model small
.stack 100h
.data
mensaje db "Hola Mundo!!", 13, 10, '$'
.code
main proc

    mov ax, @data
    mov ds, ax

    mov dx, offset mensaje
    mov ah, 9
    int 21h

    mov ax, 4c00h
    int 21h
main endp
end main
