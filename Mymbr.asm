;Test mbr asm

section Mymbr vstart=0x7c00
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov sp, 0x7c00
;use INT to cls
    mov ah, 0x06
    mov bh, 0x07
    mov cx, 0; (0,0)
    mov dx, 0x184f; (80,25)
    INT 0x10
;get cursor
    mov ah, 3
    mov bh, 0
    INT 0x10
;print 
    mov ax, 0xb800
    mov gs, ax
    mov byte [gs:0x00 ],'1'
    mov byte [gs:0x01],0xA4 ; A 表示绿色背景闪烁， 4 表示前景色为红色
    mov byte [gs:0x02], ' '
    mov byte [gs:0x03],0xA4
    mov byte [gs:0x04],'M'
    mov byte [gs:0x05],0xA4
    mov byte [gs:0x06],'B'
    mov byte [gs:0x07],0xA4
    mov byte [gs:0x0B],'R'  
    mov byte [gs:0x09],0xA4
    jmp $

message db "Hello mbr"
times 510-($-$$) db 0
db 0x55, 0xaa

