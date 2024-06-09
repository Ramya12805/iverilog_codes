.data
prompt: .asciiz "Enter a number to find whether it is even or odd: "
even_res: .asciiz "The entered number is even"
odd_res: .asciiz "The entered number is odd"
.globl main
.text
main:
li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall
move $t0,$v0

andi $t1,$t0,1
beq $t1,0,even
j odd

even:
	li $v0,4
	la $a0,even_res
	syscall
	j end
odd:
	li $v0,4
	la $a0,odd_res
	syscall
	j end

end:
	li $v0,10
	syscall