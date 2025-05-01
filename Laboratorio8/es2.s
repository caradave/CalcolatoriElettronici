        .data

anni:   .word 1945, 2008, 1800, 2006, 1748, 1600
ris:    .byte 0, 0, 0, 0, 0, 0
len:    .byte 6

        .text
        .globl main
        .ent main


main:
        la $a0, anni
        la $a1, ris
        lbu $a2, len

        jal bisestile
        and $t9, $t9, $0
        addi $a1, $a1, -6

print_loop:
        lb $a0, ($a1)
        li $v0, 1
        syscall
        addi $t9, $t9, 1
        addi $a1, $a1, 1
        bne $t9, $a2, print_loop
        
        li $v0, 10
        syscall
        .end main




# ---------------------------------------- #
        .ent bisestile
bisestile:
        move $t0, $a0
        and $t9, $t9, $0
        li $t8, 100
        li $t7, 4

loop1:
        lw $t1, ($t0)
        # move $t1, $t6
        div $t1, $t8
        mfhi $t2
        beq $t2, $0, anno_div_100
        
next_:
        div $t1, $t7
        mfhi $t2
        beq $t2, $0, bis
next_1:
        addi $t9, $t9, 1
        addi $t0, $t0, 4
        addi $a1, $a1, 1
        bne $t9, $a2, loop1
        jr $ra
        
anno_div_100:
        mflo $t2
        div $t2, $t7
        mfhi $t2
        beq $t2, $0, bis
        j next_1

bis:
        li $t6, 1
        sb $t6, ($a1)
        j next_1
        

        .end bisestile
