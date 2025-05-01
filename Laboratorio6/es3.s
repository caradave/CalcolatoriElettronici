        .data
        
str_in: .asciiz "bella"
        
        .text
        .globl main
        .ent main
        
main:
        la $t0, str_in  
        li $t9, 5
        
loop:
        addi $t9, $t9, -1
        lb $a0, ($t0)
        addi $t0, $t0, 1
        jal conv
        li $v0, 11
        syscall
        bne $t9, $0, loop

        li $v0, 10
        syscall
        .end main
        
        
conv:
        addi $a0, $a0, -32
        jr $ra