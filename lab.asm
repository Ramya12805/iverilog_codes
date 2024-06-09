.data
prompt1: .asciiz "Enter 1 if the individual has valid ticket: "
prompt2: .asciiz "Enter 1 if the individual has appropriate identification: "
eligible: .asciiz "Grant permission for the person to enter the event"
not_eligible: .asciiz "Donot grant permission to the person to enter the event"

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
	
	and $s2,$s0,$s1
	
	beq $s2,1,eligible_to_enter
	
	j not_eligible_to_enter
	
	
	eligible_to_enter:
		li $v0,4
		la $a0,eligible
		syscall
		j end
		
	not_eligible_to_enter:
		li $v0,4
		la $a0,not_eligible
		syscall
		j end
	

	end:
	li $v0,10
	syscall








