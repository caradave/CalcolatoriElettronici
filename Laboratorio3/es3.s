        .data

g:      .byte 20
h:      .byte 22
m:      .byte 10
tot:    .word 0
        
        .text
        .globl main
        .ent main


main:
        lbu $t0, g
        lbu $t1, h
        lbu $t2, m
        lw $t3, tot
        
        mul $t0, $t0, 24
        addu $t1, $t1, $t0
        mul $t3, $t1, 60
        addu $t3, $t3, $t2
        
        move $a0, $t3
        li $v0, 1
        syscall
        
        
        li $v0, 10
        syscall
        .end main