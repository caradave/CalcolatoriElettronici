        .data
        
vett1:  .word 1, 2, 3, 4
vett2:  .word 1, 2, 3, 4
n:      .asciiz "\n"
spa:    .asciiz " "        
        .text
        .globl main
        .ent main


main:
        la $t0, vett1       #carico i due vettori in memoria
        and $t9, $t9, $0    #counter per il ciclo esterno
        
loop_w: 
        and $t8, $t8, $0 #count ciclo interno
        addi $t9, $t9, 1
        la $t1, vett2
        
loop_in:
        lw $t2, ($t0)
        lw $t3, ($t1)
        mul $a0, $t2, $t3
        li $v0, 1
        syscall
        la $a0, spa
        li $v0, 4
        syscall
        add $t1, $t1, 4
        addi, $t8, $t8, 1
        bne $t8, 4, loop_in
        
        la $a0, n
        li $v0, 4
        syscall
        addi $t0, $t0, 4
        bne $t9, 4, loop_w
        
        

        
        li $v0, 10
        syscall
        .end main