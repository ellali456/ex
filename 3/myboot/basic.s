.code16

.global init
init:
	mov $0x0e, %ah
	mov $msg, %si

print_char:
	lodsb # load the byte from si to al and inc si
	cmp $0, %al
	je done 
	int $0x10
	jmp print_char

done:
	hlt

msg: .asciz "Hello world!"

.fill 510-(.-init), 1, 0
.word 0xaa55
