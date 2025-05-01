			.data

m_in:		.asciiz "inserire un intero"
m_pari:		.asciiz "il numero e' pari"
m_dispari:	.asciiz	"il numero e' dispari"

			.text
			.globl main
			.ent main

main:
			la $a0, m_in
			li $v0, 4
			syscall
			li $v0, 5
			syscall
			move $t0, $v0
			
loop:		addi $t0, $t0, -2
			beq $t0, 0, pari
			beq $t0, 1, dispari
			j loop


pari:		la $a0, m_pari
			li $v0, 4
			syscall
			j end
			
dispari:	la $a0, m_dispari
			li $v0, 4
			syscall


end:		li $v0, 10
			syscall

			.end main