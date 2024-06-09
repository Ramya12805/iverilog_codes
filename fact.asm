.data
prompt: .asciiz "Enter a number: "
result: .asciiz "The factorial of the given number is: "
.globl main
.text

main:

li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall
move $t0,$v0

li $t1,1
li $t2,1

addi $t3,$t0,1

factorial_loop:
	beq $t2,$t3,fact_end
	mul $t1,$t1,$t2
	addi $t2,$t2,1
	j factorial_loop

fact_end:
	li $v0,4
	la $a0,result
	syscall
	
	li $v0,1
	move $a0,$t1
	syscall
	j end
	

end:
	li $v0,10
	syscall
