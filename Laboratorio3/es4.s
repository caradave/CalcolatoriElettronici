        .data
        DIM = 3
m_in:   .asciiz "Inserire i numeri "
m_out:  .asciiz "La media vale: "
        
        .text
        .globl main
        .ent main
        
main:   
        la $a0, m_in
        li $v0, 4
        syscall
        
        and $t0, $t0, $0
        li $t9, 0

loop:   
        li $v0, 5
        syscall
        add $t0, $t0, $v0
        addi $t9, $t9, 1
        bne $t9, DIM, loop
        
        
        la $a0, m_out
        li $v0, 4
        syscall
        
        divu $a0, $t0, DIM
        li $v0, 1
        syscall


        li $v0, 10
        syscall
        .end main