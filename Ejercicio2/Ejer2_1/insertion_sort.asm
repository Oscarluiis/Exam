; $a0 -> *n1
; $a1 -> *n2
; $a2 ->  numbers[]
; $a3 ->  size
; t0 -> i
    


.global main

swap_function:
    

; int temp = *n1;
; *n1 = *n2;

; *n2 = temp;


insertionSort:
    ; t0 -> i
    
    ; t1 -> j
    
    li $t0, 1
    for_sort:
            ; i < size
            slt $t1, $a3, end_for_sort
            ; j = i
            
            move $t2, $t0
            
            while_medio:
            ; j > 0
            slt $t3, $t2 ,$zero
            beq $t3, $zero,continue_while
            
           
            continue_while:
            ; guardar una copia de j
            add $t4, $t1, $zero
            ; numbers [j - 1]
            
            addi $t1, $t1, -1
            sll $t5, $t1, 2
            add $t5, $t4, $a2
            
            ; j > 0 && numbers[j-1]
            and $t6, $t3, $t5
            
            ; numbers [j]
            
            sll $s0, $t4, 2
            add $s0, $t4, $a2
            
            ;  > 0 && numbers[j - 1] > numbers[j]
            slt $s1, $t6, $s0 
            beq $s1,$zero,end_for_sort
            
            ;&numbers[j - 1]
             addi $a2, $sp, $t1
             ¿¡!?
            ;  &numbers[j]);
             addi $a2, $sp, $t4
             ¿¡!?
            ;j--;
            addi $t1, $t1, -1
    
    
    end_for_sort
    jr $ra

    
    
    
