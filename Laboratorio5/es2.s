        .data
        
n:      .asciiz "\n"
spa:    .asciiz " "
err:    .asciiz "Questa non è una stringa palindroma"
pali:   .asciiz "La stringa e' palindroma"
the_end:.asciiz "Termine del programma"
        
        .text
        .globl main
        .ent main


main:
        and $t9, $t9, $0
        and $t8, $t8, $0
        and $t0, $t0, $0
        and $t1, $t1, $0
        
loop:
        li $v0, 12
        syscall
        addi $sp $sp, -4
        sw $v0, ($sp)
        addi $t9, $t9, 1
        bne $v0, 10, loop
        
        addi $sp, $sp, 4
        addi $t9, $t9, -1
        
loop_check:
        lw $a0, ($sp)
        li $v0, 11
        syscall
        move $t0, $a0
        
        addi $t9, $t9, -1
        mul $t8, $t9, 4
        add $sp, $sp, $t8
        la $a0, spa
        li $v0, 4
        syscall
        lw $a0, ($sp)
        li $v0, 11
        syscall
        move $t1, $a0
        
        addi $t9, $t9, -1
        mul $t8, $t9, -4
        add $sp, $sp, $t8
        la $a0, n
        li $v0, 4
        syscall
        
        bne $t0, $t1, error
        bgt $t9, 0, loop_check
        
        la $a0, pali
        li $v0, 4
        syscall 
        j end

        
        
        


error:
        la $a0, n
        li $v0, 4
        syscall
        la $a0, err
        li $v0, 4
        syscall
        
end:    
        la $a0, n
        li $v0, 4
        syscall
        la $a0, the_end
        li $v0, 4
        syscall
        li $v0, 10
        syscall
        .end main