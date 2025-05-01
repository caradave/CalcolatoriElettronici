# mips-32 lab 0, es 7
# 
# Lettura da tastiera e visualizzazione a video di un vettore di 5 caratteri
#
# =======================================================================================


                .data
                DIM = 4
wVet:           .space 20
wRes:           .space 4
message_in:     .asciiz "inserire i 5 numeri: \n"
message_out:    .ascii "Valore minimo: "
                
                .text
                .globl main
                .ent main

main:
                li $v0, 4
                la $a0, message_in
                syscall
                
                la $t0, wVet
                li $t1, 0 

input:          li $v0, 5
                syscall
                sw $v0, ($t0)
                beq $t1, DIM, init
                addi $t1, $t1, 1
                addi $t0, $t0, 4
                j input
                
init:           la $t0, wVet
                lw $t3, ($t0)                
                add $t0, $t0, 4
                li $t1, 0
                
ricerca:        beq $t1, DIM, exit
                lw $t2, ($t0)
                bgt $t3, $t2, change
                add $t0, $t0, 4
                add $t1, $t1, 1
                j ricerca

change:         move $t3, $t2
                j ricerca

exit:           li $v0, 4
                la $a0, message_out
                syscall
                li $v0, 1
                move $a0, $t3
                syscall
                li $v0, 10
                syscall
                .end main