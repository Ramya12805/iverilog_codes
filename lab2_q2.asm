.data
var_a: .word 5
var_b: .word 3
var_c: .word 7
var_d: .word 2
var_e: .word 6
res: .asciiz "The final answer is: "
.text
.globl main

main:
lw $t0,var_a
lw $t1,var_b
lw $t2,var_c
lw $t3,var_d
lw $t4,var_e

add $s0,$t0,$t1
sub $s1,$t2,$t3
mul $s2,$t4,$t4
mul $s3,$s0,$s1
mul $s4,$s3,$s2

addi $s5,$s4,12

li $v0,4
la $a0,res
syscall

li $v0,1
move $a0,$s5
syscall

li $v0,10
syscall
