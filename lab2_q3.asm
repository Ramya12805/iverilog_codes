.data
T0: .word 2
T1: .word 3
T2: .word 6
T3: .word 9 
res: .ascii "The result is: "

.text
.globl main

main:
lw $t0,T0
lw $t1,T1
lw $t2,T2
lw $t3,T3

add $s0,$t0,$t2
addi $s1,$s0,-5
mul $s2,$t1,$t3

bgt $s1, $s2, square_of_T2
j cube_of_T3

square_of_T2:
    mul $a0, $t2, $t2
    jal print_result
    j end

cube_of_T3:
    mul $a0, $t3, $t3
    mul $a0, $a0, $t3
    jal print_result
    j end
print_result:
li $v0,4
la $a1,res
syscall

li $v0,1
syscall

li $v0,10
syscall
