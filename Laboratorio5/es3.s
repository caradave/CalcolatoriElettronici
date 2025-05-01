        .data
        
m_in:   .asciiz "Inserire i valori di a, b e c (l'equazione è nella forma ax^2 + bx + c)"
sol:    .asciiz "L'equazione ha soluzioni reali"
not_sol:.asciiz "L'equazione non ha soluzione"        
        .text
        .globl main
        .ent main
        
        
        
        
main:
        and $t9, $t9, $0

input_loop:
        addi $t9, $t9, 1
        li $v0, 5
        syscall
        addi $sp, $sp, -4
        sw $v0, ($sp)        
        bne $t9, 3, input_loop
        
        addi $sp, $sp, 8 #qui ho a
        lw $t1, ($sp)
        beq $t1, 0, have_sol
        
        mul $t1, $t1, -4
        
        addi $sp, $sp, -4
        lw $t0, ($sp)
        mul $t0, $t0, $t0

        
        addi $sp, $sp, -4
        lw $t2, ($sp)
        mul $t1, $t1, $t2
        add $t0, $t0, $t1
        slt $t0, $t0, 0
        beq $t0, 1, nott
        
have_sol:
        la $a0, sol
        li $v0, 4
        syscall
        j end

nott:    
        la $a0, not_sol
        li $v0, 4
        syscall
        
        
end:    li $v0, 10
        syscall
        .end main