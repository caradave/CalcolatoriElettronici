        .data
        
tab:    .word 154, 123, 109, 86, 4, 0
        .word 412, -23, -231, 9, 50, 0
        .word 123, -24, 12, 55, -45, 0
        .word 0, 0, 0, 0, 0, 0
n:      .asciiz "\n"
spa:    .asciiz " "
        
        .text
        .globl main
        .ent main

main:
        and $t9, $t9, $0
        la $t0, tab
        

loop_out_r:
        addi $t9, $t9, 1
        and $t8, $t8, 0
        and $t1, $t1, $0
        
loop_in_r:
        addi $t8, $t8, 1
        lw $t2, ($t0)
        add $t1, $t1, $t2
        addi, $t0, $t0, 4
        bne $t8, 5, loop_in_r
        sw $t1, ($t0)
        addi $t0, 4

        bne $t9, 3, loop_out_r
        
        
        
        addi $t0, $t0, -72
        and $t9, $t9, $0


loop_out_c:
        addi $t9, $t9, 1
        and $t8, $t8, $0
        and $t1, $t1, $0

loop_in_c:
        lw $t2, ($t0)
        add $t1, $t1, $t2
        addi $t8, $t8, 1
        addi $t0, $t0, 24
        bne $t8, 3, loop_in_c
        
        sw $t1, ($t0)
        addi $t0, $t0, -68
        
        
        bne $t9, 6, loop_out_c

        and $t9, $t9, 0
        addi $t0, $t0, -24

loop_out:
        addi $t9, $t9, 1
        and $t8, $t8, $0 
loop_in:
        addi $t8, $t8, 1
        lw $a0, ($t0)
        li $v0, 1
        syscall
        la $a0, spa
        li $v0, 4
        syscall
        addi $t0, $t0, 4
        bne $t8, 6, loop_in
        la $a0, n
        li, $v0, 4
        syscall
        bne $t9, 4, loop_out
        
        
        li $v0, 10
        syscall
        .end main