.data
final : .asciiz "The final result is: "
.globl main
.text
main:
li $t0,2
li $t1,3
li $t2,6
li $t3,9

add $s0,$t0,$t2
addi $s0,$s0,-5

mul $s1,$t1,$t3

bgt $s0,$s1,exp1

mul $t4,$t3,$t3
mul $t5,$t4,$t3
li $v0,4
la $a0,final
syscall

li $v0,1
move $a0,$t5
syscall

j end

exp1:
	mul $t6,$t2,$t2
	li $v0,4
	la $a0,final
	syscall

li $v0,1
move $a0,$t6
syscall
j end

end:
li $v0,10
syscall