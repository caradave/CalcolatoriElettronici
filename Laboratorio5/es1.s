		.data
		
n:		.word 3141592653		
		
		.text
		.globl main
		.ent main

main:		
		
		
		lw $t0, n
		li $t9, 10
		and $t8, $t8, $0
		addiu $sp, $sp, -4

loop:	
		divu $t0, $t9
		mfhi $t2
		sw $t2, ($sp)
		addiu $sp, $sp, -4
		addi $t8, $t8, 1
		mflo $t0
		bne $t0, 0, loop
		
		addi $sp, $sp, 4
loop_print:
		addi $t8, $t8, -1
		lw $a0, ($sp)
		addi $a0, $a0, '0'
		li $v0, 11
		syscall
		addi $sp, $sp, 4
		bne $t8, 0, loop_print

		
		li $v0, 10
		syscall
		.end main