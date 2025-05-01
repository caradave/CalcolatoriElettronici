        .data
n:      .word 12
k:      .word 2
        .text
        .globl main
        .ent main
        
main:

        lw $a0, n
        lw $a1, k
        jal combina

        li $v0, 10
        syscall
        .end main
        
combina:
        li $t0, 1
        li $t1, 1
        move $t3, $a0
        mul $a1, $a1, -1
        add $t3, $t3, $a1
        mul $a1, $a1, -1

loop1:
        mul $t0, $t0, $a0
        addi $a0, $a0, -1
        bne $a0, $t3, loop1
loop2:
        mul $t1, $t1, $a1
        addi $a1, $a1, -1
        bne $a1, $0, loop2
        
        div $a0, $t0, $t1
        li $v0, 1
        syscall
        jr $ra