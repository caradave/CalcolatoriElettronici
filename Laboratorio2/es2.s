			.data

m_1:		.asciiz "inserire il primo numero: "
m_2:		.asciiz "inserire il secondo numero: "
m_nope:		.asciiz "almeno un numero non e' rappresentabile su byte"

			.text
			.globl main
			.ent main

main:
			la $a0, m_1
			li $v0, 4
			syscall
			li $v0, 5
			syscall
			move $t0, $v0
			
			la $a0, m_2
			li $v0, 4
			syscall	
			li $v0, 5
			syscall
			move $t1, $v0

check: 		addi $t0, $t0, -256
			bgez $t0, error_bit
			addi $t1, $t1, -256
			bgez $t1, error_bit

op_log:		xor $t3, $t0, $t1
			not $t1, $t1
			and $t0, $t0, $t1
			not $t0, $t0
			or $t0, $t0, $t3
			move $a0, $t0
			li $v0, 1
			syscall
			j end


error_bit:	la $a0, m_nope
			li $v0, 4
			syscall


end:		li $v0, 10
			syscall

			.end main