.data
numbers: .word 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12
result: .asciiz "The sum of 12 natural numbers is: "

.text
.globl main
main:
la $t0,numbers
li $t1,0
li $t2,0

loop:
	lw $t3,0($t0)
	add $t1,$t1,$t3
	addi $t0,$t0,4
	addi $t2,$t2,1
	bne $t2,12,loop

li $v0,4
la $a0,result
syscall

li $v0,1
move $a0,$t1
syscall

li $v0,10
syscall

