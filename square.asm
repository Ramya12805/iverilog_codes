.data
prompt: .asciiz "Enter the number to be squared: "
final: .asciiz "The final answer is: "
.globl main
.text
main:

li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall
move $t0,$v0

mul $t1,$t0,$t0

li $v0,4
la $a0,final
syscall

li $v0,1
move $a0,$t1
syscall

li $v0,10
syscall