#   mips-32 lab 0, es 4
#
#costruzione di un vettore, somma degli elementi del vettore
#
#======================================================================================



        .data
wVett:  .word 5, 7, 3, 4
wResult:.space 4

        
        .text
        .globl main
        .ent main

main:
        li $t1, 0           #inizializzazione del valore somma a zero
        la $t0, wVett       #carico l'indirizzo del primo elemento
        lw $t2, ($t0)       #carico il contenuto dell'indirizzo del primo elemeto
        add $t1, $t1, $t2   #sommo il primo valore
        add $t0, $t0, 4     #mi posto di 4 bit per pescare il secondo valore nel vettore
                            #ripeto il tutto per quanti sono i valori nel vettore
        lw $t2, ($t0)
        add $t1, $t1, $t2
        add $t0, $t0, 4
        
        lw $t2, ($t0)
        add $t1, $t1, $t2
        add $t0, $t0, 4
        
        lw $t2, ($t0)
        add $t1, $t1, $t2
        
        sw $t1, wResult
        
        li $v0, 10
        syscall
        
        .end main