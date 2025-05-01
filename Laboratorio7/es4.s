        .data
        
mat:    .word 8, 2, 3, 4        
        
        
        .text
        .globl main
        .ent main


main:
        la $t0, mat

        lw $a0, ($t0)
        addi $t0, 4
        lw $a1, ($t0)
        addi $t0, 4
        lw $a2, ($t0)
        addi $t0, 4
        lw $a3, ($t0)
        addi $t0, 4

        jal determinante2x2
        move $a0, $v0
        li $v0, 1
        syscall
        
        li $v0, 10
        syscall
        .end main
        
        
        .ent determinante2x2
determinante2x2:
        mul $v0, $a0, $a3
        mul $a0, $a1, $a2
        sub $v0, $v0, $a0
        jr $ra
        .end determinante2x2