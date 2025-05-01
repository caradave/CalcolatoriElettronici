        .data
        DIM = 5

mat:    .word 1, 3, 0, 0, 0
        .word 3, 2, 0, 5, 7
        .word 0, 0, 3, 6, 8
        .word 0, 5, 6, 4, 9
        .word 0, 7, 8, 9, 5
spa:    .asciiz " "
n:      .asciiz "\n"

        .text
        .globl main
        .ent main

main:
        and $t9, $t9, $0
        la $t0, mat
        
loop_out:
        addi $t9, $t9, 1
        and $t8, $t8, $0
loop_in:
        addi $t8, $t8, 1
        addi $sp, $sp, -4
        lw $t1, ($t0)
        sw $t1, ($sp)
        addi $t0, $t0, 4
        bne $t8, DIM, loop_in

        bne $t9, DIM, loop_out
        
        
        
        and $t9, $t9, $0
        addi $t0, $t0, -4
check_out:
        addi $t9, $t9, 1
        and $t8, $t8, $0
check_in:
        addi $t8, $t8, 1
        lw $t1, ($t0)
        lw $t2, ($sp)
        move $a0, $t1
        li $v0, 1
        syscall
        move $a0, $t2
        li $v0, 1
        syscall
        la $a0, spa
        li $v0, 4
        syscall
        bne $t1, $t2, error
        addi $sp, $sp, 4
        addi $t0, $t0, -20
        bne $t8, DIM, check_in
        addi $t0, $t0, 96
        la $a0, n
        li $v0, 4
        syscall
        bne $t9, DIM, check_out
        j end

error:
        
        li $a0, 3
        li $v0, 1
        syscall
        
        
end:    li $v0, 10
        syscall
        .end main