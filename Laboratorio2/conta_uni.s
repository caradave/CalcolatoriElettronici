#contare qaunti uni ci sono in un qualunque numero binario

        .data

num:    .half 1979

        .text
        .globl main
        .ent main

main:   lh $t0, num         # carico il numero in t0
        li $t1, 1           # metto a 1 come paragone t1
        li $t3, 0           # t3 utilizzato come counter
        li $t4, 0
        
check:  addi $t4,  $t4, 1
        and $t2, $t0, $t1
        srl $t0, $t0, 1
        bne $t2, $0, count        
        beq $t4, 16,  vis
        j check

count:  addi $t3, $t3, 1
        j check
   
vis:    move $a0, $t3
        li $v0, 1
        syscall
   
end:    li $v0, 10
        syscall
        .end main