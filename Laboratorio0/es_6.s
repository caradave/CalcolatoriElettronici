#   mips-32 lab 0, es 5
#
#dichiarazione di un vettore e somma dei valori salvati nel vettore attraverso un "ciclo"
#
#======================================================================================

                .data
                DIM=5
wRes:           .space 20
messagge_in :   .asciiz "Inserire i 5 numeri\n"
messagge_out :  .asciiz "Numeri inseriti\n"
space:          .ascii " ; "
        
                .text
                .globl main
                .ent main
        
main:           li $v0, 4
                la $a0, messagge_in
                syscall
        
                la $t0, wRes                   #usato come indice del vettore 
                li $t2, 0
                
input:          li $v0, 5
                syscall
                sw $v0, ($t0)
                add $t0, $t0, 4
                add $t2, $t2, 1
                bne $t2, DIM, input 
                
                li $v0, 4
                la $a0, messagge_out
                syscall
                li $v0, 4
                li $t2, 1
                la $t0, wRes
                
output:         li $v0, 1
                lw $a0, ($t0)
                syscall
                beq $t2, DIM, exit
                li $v0, 4
                la $a0, space
                syscall
                add $t0, $t0, 4
                add $t2, $t2, 1
                j output
                
                
exit:           li $v0, 10
                syscall
                .end main