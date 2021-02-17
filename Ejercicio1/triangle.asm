; test no hueco falta adaptarlo, no sirve para nada...

addi $v0, $zero, 5 ; para el input del usuario
syscall ; llamada al sistema
add $t0, $zero, $v0 ; guardar el valor del registro v0 en t0
addi $t1, $t0, -1 ; variable filasEspacio=t0-1
addi $t2, $zero, 0 ; variable filasCaracter=0
addi $t3, $zero, 0 ; varible espaciador=0

; fail no sirve...



draw_triangle:
ciclo_altura:
    beq $t2, $t0, fin_cicloAltura ; ir validando la altura
        
        ciclo_espacio:
            beq $t3, $t1, fin_cicloEspacio ; si t3 < t2
            addi $v0, $zero, 11 ; avisar que imprimira
            addi $a0, $zero, 32 ; caracter espacio
            syscall ; llamada al sistema
            addi $t3, $t3, 1 ; aumenta una unida a t3
            j ciclo_espacio ; repetir el ciclo del espacio
        fin_cicloEspacio: ; fin ciclo espacio
        
        addi $t3, $zero, 0 ; regresar el valor t3 a 0
        
        ciclo_caracter:
            slt $t4, $t2, $t3 ; validar si t2 es < t3
            bne $t4, $zero, fin_cicloCaracter ; si t4 ! 0
            addi $v0, $zero, 11 ; indicar impresion
            addi $a0, $zero, 32 ; asignar espacio
            syscall ; se llama al sistema
            addi $v0, $zero, 11 ; indicar impresion 
            addi $a0, $zero, 42 ; se imprime el caracter *
            syscall ; llamada al sistema
            addi $t3, $t3, 1 ; aumentar una unidad a t3
            j ciclo_caracter ; regresar el ciclo del caracter
        fin_cicloCaracter: ; fin ciclo caracter
        
        addi $t3, $zero, 0 ; regresar t3 a 0
        addi $v0, $zero, 11 ; indicar impresion
        addi $a0, $zero, 10 ; ser imprime salto de linea
        syscall ; llamada al sistema
        addi $t1, $t1, -1 ; restar una unidad a t1
        addi $t2, $t2, 1 ; aumentar una unidad a t2
        j ciclo_altura ; regresar al ciclo altura

 fin_cicloAltura:   ; fin ciclo altura y fin ejecucion
    jr $ra
    
    
main:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4
