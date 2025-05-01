NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 1


        .data

prezzi: .word 39, 1880, 2394, 1000, 1590
scontati: .space DIM        
n:      .asciiz "\n"
sconti: .asciiz "Prezzi scontati"
sconto_tot: .asciiz "Lo sconto totale vale: "
        .text
        .globl main
        .ent main
        
main:
        la $a0, prezzi
        la $a1, scontati
        li $a2, NUM
        li $a3, SCONTO
        li $t0, ARROTONDA
        
        jal calcola_sconto
        and $t9, $t9, $0
        la $a0, n
        li $v0, 4
        syscall
        move $a0, $t6
        li $v0, 1
        syscall
        la $a0, n
        li $v0, 4
        syscall
print_loop:

        lw $a0, ($a1)
        li $v0, 1
        syscall
        la $a0, n
        li $v0, 4
        syscall
        addi $t9, $t9, 1
        addi $a1, $a1, 4
        bne $t9, $a2, print_loop
        
        li $v0, 10
        syscall
        .end main
        
        
        
        .ent calcola_sconto
calcola_sconto:
        and $t9, $t9, $0
        and $t6, $t6, $0
        li $t8, 10
        li $t7, 3
        
loop_calcola_sconto:
        lw $t1, ($a0)
        move $t2, $t1
        mul $t1, $t1, $t7
        div $t1, $t8
        mflo $t5
        add $t6, $t6, $t5
        sub $t2, $t2, $t5
        beq $t0, 1, arrotonda
next_:
        sw $t2, ($a1)
        addi $a1, $a1, 4
        addi $a0, $a0, 4
        addi $t9, $t9, 1
        bne $t9, $a2, loop_calcola_sconto
        
        addi $a1, $a1, -20
        addi $a0, $a0, -20
        
        jr $ra

arrotonda:
        mfhi $t3
        bne $t3, $0, aggiungi
        j next_
aggiungi:
        addi $t2, $t2, 1
        addi $t6, $t6, 1
        j next_
        .end calcola_sconto