        .data
        
mat:    .word 1, 2, 3
        .word 4, 5, 6
        .word 7, 8, 9       
        
        .text
        .globl main
        .ent main



main:
        la $t0, mat
        and $t9, $t9, $0
        addi $t0, $t0, 32
        addi $sp, $sp, -4
loop1:
        addi $t9, $t9, 1
        lw $t1, ($t0)
        sw $t1, ($sp)
        addi $t0, $t0, -4
        addi $sp, $sp, -4       
        bne $t9, 9, loop1
        
        addi $sp, $sp, 4
        
        jal determinante3x3
        
        
        
        li $v0, 10
        syscall
        .end main


        .ent determinante3x3
determinante3x3:
        move $t9, $ra
        lw $t0, ($sp)               #valore per cui va moltiplicato il det2x2
        lw $a0, 16($sp)
        lw $a1, 20($sp)
        lw $a2, 28($sp)
        lw $a3, 32($sp)
        
        jal determinante2x2
        mul $t0, $t0, $v0
        
        
        addi $sp, $sp, 4
        lw $t1, ($sp)
        lw $a0, 8($sp)
        lw $a2, 20($sp)
        jal determinante2x2
        mul $t1, $t1, $v0
        mul $t1, $t1, -1
        
        
        addi $sp, $sp, 4
        lw $t2, ($sp)
        lw $a0, 8($sp)
        lw $a2, 20($sp)
        jal determinante2x2
        mul $t2, $t2, $v0
        
        addi $t0, $t0, $t1
        addi $t0, $t0, $t2
        move $v0, $t0
        
        jr $t9
        .end determinante3x3




        .ent determinante2x2
determinante2x2:
        mul $v0, $a0, $a3
        mul $a0, $a1, $a2
        sub $v0, $v0, $a0
        # move $a0, $v0
        # li $v0, 1
        # syscall
        jr $ra
        .end determinante2x2