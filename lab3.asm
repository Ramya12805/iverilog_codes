.data
prompt: .asciiz "Enter a positive integer: "
true_msg: .asciiz "true\n"
false_msg: .asciiz "false\n"
newline: .asciiz "\n"
error_msg: .asciiz "The number you entered is not positive"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0         
    move $t1, $v0         
    li $t2, 0           
	
	blt $t0,0,error_end
	
reverse:
    beqz $t1, check_palindrome
    rem $t3, $t1, 10      
    div $t1, $t1, 10      
    mul $t2, $t2, 10      
    add $t2, $t2, $t3   
    j reverse

check_palindrome:
    beq $t0, $t2, print_true
    j print_false

print_true:
    li $v0, 4
    la $a0, true_msg
    syscall
    j end

print_false:
    li $v0, 4
    la $a0, false_msg
    syscall
	j end

error_end:
	li $v0,4
	la $a0,error_msg
	syscall
	j end
end:
    li $v0, 10
    syscall
