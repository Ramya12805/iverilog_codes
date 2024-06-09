.data
prompta: .asciiz "Enter 1st number: "
promptb: .asciiz "Enter 2nd number: "
final_msg: .asciiz "The final answer is: "
.text
main:

li $v0,4
la $a0,prompta
syscall

li $v0,5
syscall
move $t0,$v0


li $v0,4
la $a0,promptb
syscall

li $v0,5
syscall
move $t1,$v0

add $t2,$t1,$t0

li $v0,4
la $a0,final_msg
syscall

li $v0,1
move $a0,$t2
syscall

li $v0,10
syscall