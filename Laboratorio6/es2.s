        .data
str_in: .asciiz "Inserire la lunghezza del lato: "
ast:    .asciiz "*" 
n:      .asciiz "\n"      
        .text
        .globl main
        .ent main
        
main:
        la $a0, str_in
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $a0, $v0

        jal stampa_triangolo
        jal stampa_quadrato


        li $v0, 10
        syscall
        .end main
        
        
        
        
stampa_triangolo:
        move $t0, $a0
        and $t9, $t9, $0
        li $v0, 4
loop1:
        addi $t9, $t9, 1
        and $t8, $t8, $0
        la $a0, ast
loop2:  
        addi $t8, $t8, 1
        syscall
        bne $t8, $t9, loop2
        
        la $a0, n
        syscall
        bne $t9, $t0, loop1
        move $a0, $t0
        jr $ra


stampa_quadrato:
        and $t9, $t9, $0
        move $t0, $a0
        li $v0, 4
loop_out:
        addi $t9, $t9, 1
        and $t8, $t8, $0
        la $a0, ast
loop_in:
        addi $t8, $t8, 1
        syscall
        bne $t8, $t0, loop_in
        la $a0, n
        syscall
        bne $t9, $t0, loop_out
        move $a0, $t0
        jr $ra