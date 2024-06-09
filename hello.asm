.data
prompt: .asciiz "Hello World"

.globl main
.text
main:
li $v0,4
la $a0,prompt
syscall

li $v0,10
syscall