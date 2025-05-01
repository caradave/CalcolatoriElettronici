#
#   mips_0-1
# 
# Scrittura di un valore in un registro e sua verifica su QtSpim
#
# =======================================================================================


        .data

        .text
        .globl main
        .ent main
main:

        li  $t0, 10     #mette nel registro t0 il valore 10
        li  $s0, 0xdc   #mette nel registro s0 il valore ESADECIMALE dc

        li $v0, 10      #chiamata di terminazione del programma
        syscall 

        .end main
