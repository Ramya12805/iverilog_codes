.data
prompt1: .asciiz "Enter 1 if you are a student: "
prompt2: .asciiz "Enter 1 if you completed the homework: "
elig: .asciiz "You are eligible to take the quiz \n"
non: .asciiz "You are not eligible to take the quiz \n"

.globl main
.text
main:
li $v0,4
la $a0,prompt1
syscall

li $v0,5
syscall
move $s0,$v0

li $v0,4
la $a0,prompt2
syscall

li $v0,5
syscall
move $s1,$v0

and $t2,$s0,$s1

beq $t2,1,eligible
j not_eligible

eligible:
	li $v0,4
	la $a0,elig
	syscall
	j end
not_eligible:
	li $v0,4
	la $a0,non
	syscall
	j end

end:
	li $v0,10
	syscall