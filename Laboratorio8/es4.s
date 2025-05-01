DIM = 5
        .data
        
vet1:   .word 56, 12, 98, 129, 58
vet2:   .word 1, 0, 245, 129, 12
risultato: .space DIM
n:      .asciiz "\n"

        .text
        .globl main
        .ent main

main:
        la $a0, vet1
        la $a1, vet2
        la $a2, risultato
        li $a3, DIM
        jal CalcolaDistanzaH
        
        and $t9, $t9, $0
print_loop:
        lw $a0, ($a2)
        li $v0, 1
        syscall
        la $a0, n
        li $v0, 4
        syscall
        addi $a2, $a2, 4
        addi $t9, $t9, 1
        bne $t9, $a3, print_loop



        li $v0, 10
        syscall
        .end main



        .ent CalcolaDistanzaH
CalcolaDistanzaH:
        and $t7, $t7, $0
        and $t9, $t9, $0
        
loop_CalcolaDistanzaH:
        and $t0, $t0, $0
        lw $t1, ($a0)
        lw $t2, ($a1)
        and $t8, $t8, $0
        
loop_in_CalcolaDistanzaH:
        andi $t6, $t1, 1
        andi $t5, $t2, 1
        bne $t6, $t5, non_uguali
        addi $t8, $t8, 1
move_bit:
        srl $t1, $t1, 1
        srl $t2, $t2, 1
        bne $t8, 16, loop_in_CalcolaDistanzaH
        
        sw $t0, ($a2)
        addi $a0, $a0, 4
        addi $a1, $a1, 4
        addi $a2, $a2, 4
        addi $t9, $t9, 1
        bne $t9, $a3, loop_CalcolaDistanzaH
        addi $a2, $a2, -20
        jr $ra

non_uguali:
        addi $t0, $t0, 1
        j move_bit

        .end CalcolaDistanzaH