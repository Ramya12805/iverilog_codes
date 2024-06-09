.data
prompt: .asciiz "Enter a number: "
ack: .asciiz "Received the input"

.text
.globl main

main:

li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall
move $s0,$v0

li $v0,4
la $a0,ack
syscall

mul $t0,$s0,$s0
li $v0,10
syscall
