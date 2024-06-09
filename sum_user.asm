.data
numbers: .space 48
result_msg: .asciiz "The sum of the numbers is:"
input: .asciiz "enter number: "
sum: .word 0

.text
.globl main

main:
	li $t1,12
	la $t0,numbers
	
read_input:
	beq $t1,0,process
	li $v0,4
	la $a0,input
	syscall
	
	li $v0,5
	syscall
	
	sw $v0,($t0)	
	addi $t0,$t0,4
	addi $t1,$t1,-1
	j read_input
	
process:
	la $t0,numbers
	li $t1,12
	li $t2,0
	
loop:
	beq $t1,0,end_loop
	lw $t3,($t0)
	add $t2,$t2,$t3
	
	addi $t0,$t0,4
	addi $t1,$t1,-1
	
	j loop
	
end_loop:
	sw $t2, sum
	# Code to print the result
    la $a0, result_msg # Load address of the result message
    li $v0, 4           # Syscall for print string
    syscall

    lw $a0, sum         # Load the sum into $a0
    li $v0, 1           # Syscall for print integer
    syscall

    li $v0, 10          # Syscall for exit
    syscall