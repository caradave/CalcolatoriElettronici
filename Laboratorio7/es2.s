        .data
        
m_in:   .asciiz "Inserire un intero: "
        
        
        .text
        .globl main
        .ent main



main:
        la $a0, m_in
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $a0, $v0

        jal CalcolaSuccessivo
        move $a0, $v0
        li $v0, 1
        syscall

        li $v0, 10
        syscall
        .end main



CalcolaSuccessivo:
        li $t0, 2
        div $a0, $t0
        mfhi $t1
        bne $t1, $0, dispari
        mflo $v0
        jr $ra
dispari:
        mul $v0, $a0, 3
        addi $v0, $v0, 1
        jr $ra
        