.data
prompt: .asciiz "Enter the number until where you need to find sum of natural numbers: "
final: .asciiz "the sum of natural numbers is: "
.globl main
.text
main:
li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall
move $t0,$v0

li $t1,2
addi $t2,$t0,1
mul $t3,$t0,$t2
div $t4,$t3,$t1


li $v0,4
la $a0,final
syscall

li $v0,1
move $a0,$t4
syscall


li $v0,10
syscall