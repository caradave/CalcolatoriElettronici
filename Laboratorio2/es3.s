		.data

n1:     .word 5
n2:     .word 6
n3:     .word 3
a_capo: .asciiz "\n"

		.text
		.globl main
		.ent main
    
main:	
        lw $t0, n1
        lw $t1, n2
        lw $t2, n3
        
check1: bgt $t0, $t1, swap1
        j check2
        
swap1:  move $t3, $t0
        move $t0, $t1
        move $t1, $t3
        #if (a>b):
         #   swap (a, b)

check2: bgt $t0, $t2, swap2
        j check3

swap2:  move $t3, $t0
        move $t0, $t2
        move $t2, $t3
        #if (a>b):
         #   swap (a, b)

check3: bgt $t1, $t2, swap3
        j print

swap3:  move $t3, $t1
        move $t1, $t2
        move $t2, $t3
        #if (a>b):
         #   swap (a, b)


print:  li $v0, 1
        move $a0, $t0
        syscall
        li $v0, 4
        la $a0, a_capo
        syscall
        
        li $v0, 1
        move $a0, $t1
        syscall
        li $v0, 4
        la $a0, a_capo
        syscall
        
        li $v0, 1
        move $a0, $t2
        syscall
        li $v0, 4
        la $a0, a_capo
        syscall
        
end:	li $v0, 10
		syscall
		.end main