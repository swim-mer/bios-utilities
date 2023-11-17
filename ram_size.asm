; BIOS Interrupt 12H
; Determine memory size

; Set video mode to 4-color 320x200 graphics mode
mov ah, 0x00
mov al, 5
int 0x10

; Set background color
mov ah, 0x0b
mov bh, 0 
mov bl, 15 
int 0x10

; Set cursor position
mov ah, 0x02
mov dh, 5 
mov dl, 5
int 0x10

mov bl, 1
mov ah, 0x0e
mov al, 'R'
int 0x10
mov al, 'A'
int 0x10
mov al, 'M'
int 0x10
mov al, ':'
int 0x10
mov al, ' '
int 0x10

; Get memory size of RAM in kilobytes -- maximum of 640KB, of 0x0280H
int 0x12


; Save copy of AX in BX
mov dx, ax

mov ah, 0x0e
mov al, '0'
int 0x10
mov al, 'x'
int 0x10

mov cl, 0

; Loop to read and print all bits in AX register
calc_bits:
	rol dx, 4
	add cl, 4
	cmp cl, 16
	jg end	
	mov al, 15
	and al, dl
	cmp al, 9
	jg add_7
	
print_bits:
	add al, '0'
	int 0x10
	jmp calc_bits


add_7:
	add al, 7
	jmp print_bits
	
end:
	mov al, 'H'
	int 0x10

mov al, ' '
int 0x10
mov al, 'K'
int 0x10
mov al, 'B'
int 0x10


times 510-($-$$) db 0
dw 0xaa55
