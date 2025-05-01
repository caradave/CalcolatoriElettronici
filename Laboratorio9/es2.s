        .data

str_orig: .asciiz "% nella citta dolente, % nell eterno dolore, % tra la preduta gente %"
str_sost: .asciiz "per me si va"
str_new:  .space 200
end_str:  .asciiz "\0"

        .text
        .globl main
        .ent main
main:
        la $a0, str_orig
        la $a1, str_sost
        la $a2, str_new
        
        jal sostituisci




        li $v0, 10
        syscall
        .end main
        
        
        
        .ent sostituisci
sostituisci:
        move $t0, $a0
        la $t9, str_end
        lw
loop_sostituisci:
        lb $a0, ($t0)
        li $v0, 11
        syscall
        addi $t0, $t0, 1
        bne $a0, '\0', loop_sostituisci 
        
        jr $ra

        .end sostituisci