        .data
ast:    .asciiz "*" 
n:      .asciiz "\n"      
        .text
        .globl main
        .ent main
        
main:
        
        and $t9, $t9, $0
        
loop:        
        addi $t9, $t9, 1
        jal stampa_triangolo
        bne $t9, 8, loop

        jal stampa_quadrato

        li $v0, 10
        syscall
        .end main
        
        
        
        
stampa_triangolo:
        and $t0, $t0, $0
        move $t1, $t9
        la $a0, ast
loop1:
        addi $t0, $t0, 1
        li $v0, 4
        syscall
        bne $t0, $t1, loop1
        la $a0, n
        li $v0, 4
        syscall
        jr $ra


stampa_quadrato:
        and $t9, $t9, $0
        li $v0, 4
loop_out:
        addi $t9, $t9, 1
        and $t8, $t8, $0
        la $a0, ast
loop_in:
        addi $t8, $t8, 1
        syscall
        bne $t8, 8, loop_in
        la $a0, n
        syscall
        bne $t9, 8, loop_out
        jr $ra