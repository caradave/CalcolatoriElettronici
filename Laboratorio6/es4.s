        .data
        
vett:   .word 5, 8, 2, 0, 1, 15        
        
        .text
        .globl main
        .ent main
        
main:
        la $a0, vett
        li $a1, 6
        
        jal massimo
        move $a0, $v0
        li $v0, 1
        syscall


        li $v0, 10
        syscall
        
        
massimo:
        and $t9, $t9, $0
        addi $t9, $t9, 1
        lw $t0, ($a0)
        
loop:
        addi $t9, $t9, 1
        addi $a0, $a0, 4
        lw $t1, ($a0)
        bgt $t1, $t0, new_max
next_:  bne $t9, $a1, loop
        move $v0, $t0
        jr $ra

new_max:
        move $t0, $t1
        j next_
        