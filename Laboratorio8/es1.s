        .data
ora_in: .byte 12, 47
ora_out:.byte 18, 14

        .text
        .globl main
        .ent main

main:
        la $a0, ora_in
        la $a1, ora_out
        li $a2, 1
        li $a3, 40
        
        
        jal costoParcheggio
        

        li $v0, 10
        syscall
        .end main




        .ent costoParcheggio
costoParcheggio:
        lb $t0, ($a0)
        mul $t0, $t0, 60
        lb $t1, 1($a0)
        add $t1, $t1, $t0
        
        lb $t2, ($a1)
        mul $t2, $t2, 60
        lb $t3, 1($a1)
        add $t3, $t3, $t2
        
        sub $t3, $t3, $t1
        div $t3, $a3
        mfhi $t0           #in hi c'è il resto
        mflo $t1
        
        mul $t1, $t1, $a2
        bne $0, $t0, costo_aggiuntivo

end_costo_parcheggio:
        move $v0, $t1
        jr $ra
        
costo_aggiuntivo:
        addi $t1, $t1, 1
        j end_costo_parcheggio
        .end costoParcheggio