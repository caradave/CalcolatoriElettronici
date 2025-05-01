        .data
        
opa:    .word 2043
opb:    .word 5
res:    .word 0        
init:   .asciiz "Scegliere l'operazione tra i due operandi:\n1. Somma\n2. Sottrazione\n3. Moltiplicazione\n4. Divisione"
err:    .asciiz "Il valore inserito non è valido"
        
        .text
        .globl main
        .ent main
        
main:  
        lw $t0, opa
        lw $t1, opb
        la $t3, res
        la $a0, init
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        
        beq $v0, 1, summ
        beq $v0, 2, subb
        beq $v0, 3, prod
        beq $v0, 4, divv
        j exit_err

summ:   add $t9, $t0, $t1
        j print

subb:   sub $t9, $t0, $t1
        j print

prod:   mul $t9, $t0, $t1
        j print

divv:   div $t9, $t0, $t1
        j print


print:  
        sw $t9, ($t3)
        move $a0, $t9
        li $v0, 1
        syscall
        j exit


exit_err:
            
        la $a0, err
        li $v0, 4
        syscall

        
exit:   li $v0, 10
        syscall
        .end main