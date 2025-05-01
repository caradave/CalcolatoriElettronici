#   mips-32 lab 0, es 2
#
#dichiarazione di una variabile decimele e scrittura in una cella di memoria
#
#======================================================================================

        .data
wVar:   .word 3
        
        .text
        .globl main
        .ent main
        
main:
        li $t0, 10      #carica  nel registro t0 il valore 10
        lw $t1, wVar    #carica il valore salvato nella variabile wVar nel registro t1
    
        
        
        li $v0, 10
        syscall
        
        .end main