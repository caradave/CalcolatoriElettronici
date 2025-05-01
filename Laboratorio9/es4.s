            .data
            RIGHE = 9
            COLONNE = 9
            DIM = RIGHE * COLONNE
            ITERAZIONI = 14
matrice1:   .byte 0, 0, 0, 0, 0, 0, 0, 0, 0
            .byte 0, 0, 0, 0, 0, 0, 0, 0, 0
            .byte 0, 0, 0, 0, 0, 0, 0, 0, 0
            .byte 0, 0, 0, 0, 1, 0, 0, 0, 0
            .byte 0, 0, 0, 1, 1, 1, 0, 0, 0
            .byte 0, 0, 0, 0, 0, 0, 0, 0, 0
            .byte 0, 0, 0, 0, 0, 0, 0, 0, 0
            .byte 0, 0, 0, 0, 0, 0, 0, 0, 0
            .byte 0, 0, 0, 0, 0, 0, 0, 0, 0
matrice2:   .space DIM



            .text
            .globl main
            .ent main


main:

            la $a0, matrice1
            la $a1, matrice2
            






            li $v0, 10
            syscall
            .end main