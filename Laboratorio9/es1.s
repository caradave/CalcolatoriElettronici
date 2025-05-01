DIM = 3
DIM_RIGA = DIM * 4

        .data
mat1:   .word 4, -45, 15565, 6458, 4531, 124, -548, 2124, 31000
mat2:   .word 6, -5421, -547, -99, 4531, 1456, 4592, 118, 31999
indice: .word 2
vett_out:.space DIM_RIGA
n:      .asciiz "\n"

        .text
        .globl main
        .ent main


main:

        la $a0, mat1
        la $a1, mat2
        la $a2, vett_out
        li $a3, DIM
        
        addi $sp, $sp, -4
        lw $t0, indice
        sw $t0, ($sp)
    
        jal Variazione

        and $t9, $t9, $0
loop_main:
        addi $t9, $t9, 1
        lw $a0, ($a2)
        li $v0, 1
        syscall
        
        la $a0, n
        li $v0, 4
        syscall
        
        addi $a2, $a2, 4
        bne $t9, $a3, loop_main

        li $v0, 10
        syscall
        .end main
        
        
        
        
        .ent Variazione
Variazione:
        lw $t0, ($sp)
        move $t9, $a0
        
        # prendo il valore della prima matrice
        move $t2, $t0
        mul $t2, $t2, $a3
        mul $t2, $t2, 4
        add $t9, $t9, $t2
       
        # prendo il valore dalla seconda matrice
        mul $t1, $t0, 4
        add $a1, $a1, $t1
        move $t1, $t0
        addi $t1, $t1, 1
        mul $t1, $t1, 4
        
        
        and $t8, $t8, $0
loop_Variazione:
        addi $t8, $t8, 1
        
        lw $t6, ($t9)
        lw $t7, ($a1)
        sub $t7, $t7, $t6
        mul $t7, $t7, 100
        div $t7, $t6
        
        mflo $t5
        sw $t5, ($a2)
        
        addi $a2, $a2, 4
        add $a1, $a1, $t1
        addi $t9, $t9, 4
        bne $t8, $a3, loop_Variazione
        
        addi $t0, $t0, 1
        mul $t0, $t0, 4
        sub $a2, $a2, $t0
        
        jr $ra
        .end Variazione