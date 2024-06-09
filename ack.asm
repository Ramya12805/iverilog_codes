.data
inp: .asciiz "Enter a number: "
final: .asciiz "The cube of the number given by user is: "
ack: .asciiz "Use has given the input"
newline: .asciiz "\n"
.globl main
.text
main:

li $v0,4
la $a0,inp
syscall

li $v0,5
syscall
move $t1,$v0

mul $t2,$t1,$t1
mul $t0,$t2,$t1

li $v0,4
la $a0,ack
syscall

li $v0,4
la $a0,newline
syscall

li $v0,4
la $a0,final
syscall

li $v0,1
move $a0,$t0
syscall


li $v0,10
syscall