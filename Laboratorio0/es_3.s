#   mips-32 lab 0, es 3
#
#somma di due valori contenuti in due operanti
#
#
#======================================================================================


        .data
wOpd1:  .word 10
wOpd2:   .word 24
wResult: .space 4


        .text
        .globl main
        .ent main
        
main:
        lw $t0, wOpd1       #caricamento dei valori nei registri
        lw $t1, wOpd2
        
        add $t2, $t0, $t1   #somma dei due valori e salvataggio in memoria
        
        sw $t2, wResult     #salvataggio dei risultato all'interno della variabile
        
        
        li $v0, 10
        syscall
        .end main