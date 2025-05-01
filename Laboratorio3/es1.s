#letture di un intero e correzione di possibili errori

        .data
        
str1:   .asciiz "Inserire un carattere: "
str2:   .asciiz "\nInserire un altro carattere: "
err:    .asciiz "\nCarattere inserito non valido"
strend: .asciiz "\nTermine del programma"

num:    .space 40
        
        .text
        .globl main
        .ent main
        
main:
        la $a0, str1
        li $v0, 4
        syscall
    
loop:   
        li $v0, 12
        syscall
        move $t0, $v0
        beq $t0, 10, end
        bgt $t0, 57, p_err
        blt $t0, 48, p_err
        
new:
        la $a0, str2
        li $v0, 4
        syscall
        j loop

p_err:  
        la $a0, err
        li $v0, 4
        syscall
        j new

end:    
        la $a0, strend
        li $v0, 4
        syscall
        li $v0, 10
        syscall
        .end main