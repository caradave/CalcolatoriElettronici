#
#   mips_1-1
# 
#trasformare 4 lettere da lower case ad upper case e stampare il risultato a video
#
# =======================================================================================
		.data
var1    .byte 'm'
var2    .byte 'i'
var3    .byte 'p'
var4    .byte 's'
var5    .byte 0x00
		.text
		.globl main
		.ent main
    
main:	

		li $v0, 10
		syscall
		.end main