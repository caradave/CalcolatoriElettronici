RIGHE = 4
COLONNE = 5

        .data
matrice:.byte  0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9, 24, 8, 25, 43, 62



        .text
        .globl main
        .ent main

main:
        la $a0, matrice
        li $a1, 12
        li $a2, RIGHE
        li $a3, COLONNE
        
        jal contaVicini



        li $v0, 10
        syscall
        .end main



        .ent contaVicini
contaVicini:
        move $t9, $a0 
        and $t0, $t0, $0
        add $t9, $t9, $a1
        
        addi $t9, $t9, 1 #valore a destra
        lb $t0, ($t9)
        addi $t9, $t9, -2 #valore a sinistra
        lb $t1, ($t9)
        add $t0, $t0, $t1
        
        add $t9, $t9, $a3 #valore in basso a sinistra e seguenti sulla medesima riga
        and $t8, $t8, $0
loop_conta_1:
        lb $t1, ($t9)
        add $t0, $t0, $t1
        add $t9, $t9, 1
        add $t8, $t8, 1
        bne $t8, 3, loop_conta_1

        add $t9, $t9, -3 #valori da in alto a sinistra e seguenti sulla medesima riga
        sub $t9, $t9, $a3
        sub $t9, $t9, $a3
        and $t8, $t8, $0
loop_conta_2:
        lb $t1, ($t9)
        add $t0, $t0, $t1
        add $t9, $t9, 1
        add $t8, $t8, 1
        bne $t8, 3, loop_conta_2
        
        jr $ra
        .end contaVicini