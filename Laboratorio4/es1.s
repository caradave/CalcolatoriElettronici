        .data
        
vett:   .word 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
n:      .asciiz "\n"
        
        .text
        .globl main
        .ent main
        
main:   
        la $t0, vett
        and $t9, $t9, $0

        
start:  addi $t9, $t9, 1
        lw $a0, ($t0)
        li $v0, 1
        syscall
        la $a0, n
        li $v0, 4
        syscall
        addi $t0, $t0, 4
        bne $t9, 2, start

        
        
        
loop:   addi $t9, $t9, 1        #inizializzo il count
        addi $t0, $t0, -8       #vado a prendere il primo valore e lo salvo
        lw $t1, ($t0)           
        addi $t0, $t0, 4        #pesco il secondo valore e lo salvo
        lw $t2, ($t0)
        
        addi $t0, $t0, 4
        
        add $t3, $t1, $t2     #faccio la somma e la salvo
        sw $t3, ($t0)
        lw $a0, ($t0)
        li $v0, 1
        syscall
        la $a0, n
        li $v0, 4
        syscall
        addi $t0, $t0, 4
        bne $t9, 20, loop
        
        
        li $v0, 10
        syscall
        .end main