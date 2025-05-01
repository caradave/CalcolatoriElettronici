#letture di un intero e correzione di possibili errori

        .data
        
str1:   .asciiz "Inserire un carattere: "
str2:   .asciiz "\nInserire un altro carattere: "
err:    .asciiz "\nCarattere inserito non valido"
strend: .asciiz "\nIl valore totale e': "

num:    .space 40
        
        .text
        .globl main
        .ent main
        
main:
        la $a0, str1
        li $v0, 4
        syscall
        li $t9, 10
        and $t8, $t8, $0
    
loop:   
        li $v0, 12
        syscall
        j check
new:
        la $a0, str2
        li $v0, 4
        syscall
        j loop

check:  
        beq $v0, 10, end
        bgt $v0, 57, p_err
        blt $v0, 48, p_err

print:  
        move $t0, $v0
        sub $t0, $t0, '0'
        mul $t8, $t8, 10
        add $t8, $t8, $t0
        
        j new
        

p_err:  
        la $a0, err
        li $v0, 4
        syscall
        j new

end:    
        la $a0, strend
        li $v0, 4
        syscall
        move $a0, $t8
        li $v0, 1
        syscall
        li $v0, 10
        syscall
        .end main