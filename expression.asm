.data
prompt: .asciiz ""
.globl main
.text
main:
li $t0,5
li $t1,3
li $t2,7
li $t3,2
li $t4,6

add $s0,$t0,$t1
sub $s1,$t2,$t3
mul $s2, $t4,$t4

mul $s3,$s0,$s1
mul $s4,$s3,$s2

addi $s4,$s4,12

li $v0,1
move $a0,$s4
syscall


li $v0,10
syscall