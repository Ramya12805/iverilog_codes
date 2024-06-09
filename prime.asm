.data
input:  .space 40       # Space for 10 integers (4 bytes each)
sum:    .word 0         # Variable to store the sum
message_input: .asciiz "Enter a number: "
message_result: .asciiz "The sum of the prime numbers is: "

.text
main:
    li $t1, 10          # Number of inputs to read
    la $t0, input       # Load address of the input array

read_input:
    beq $t1, 0, process # If 10 inputs are read, proceed to processing
    la $a0, message_input # Load address of the input prompt message
    li $v0, 4           # Syscall for print string
    syscall

    li $v0, 5           # Syscall for read integer
    syscall
    sw $v0, 0($t0)      # Store the input value in the array

    addi $t0, $t0, 4    # Move to the next array element
    addi $t1, $t1, -1   # Decrement the count
    j read_input        # Jump back to read next input

process:
    la $t0, input       # Load address of the input array
    li $t1, 10          # Number of elements to process
    li $t2, 0           # Initialize sum to 0

check_prime:
    beq $t1, 0, print_result # If all elements processed, print result
    lw $t3, 0($t0)      # Load current element into $t3

    # Check if the number is prime
    li $t4, 2           # Initialize divisor to 2
    li $t5, 1           # Flag to indicate prime (1 means prime)

div_loop:
    mul $t6, $t4, $t4   # t6 = t4 * t4
    bgt $t6, $t3, end_div # If divisor squared is greater than number, end loop

    rem $t7, $t3, $t4   # t7 = t3 % t4
    beq $t7, $zero, not_prime # If t3 is divisible by t4, not prime

    addi $t4, $t4, 1    # Increment divisor
    j div_loop          # Jump back to div_loop

not_prime:
    li $t5, 0           # Set flag to 0 (not prime)

end_div:
    beq $t5, 0, skip_add # If not prime, skip addition
    add $t2, $t2, $t3   # Add the prime number to sum

skip_add:
    addi $t0, $t0, 4    # Move to the next element in the array
    addi $t1, $t1, -1   # Decrement the count
    j check_prime       # Jump back to check next number

print_result:
    sw $t2, sum         # Store the result in the sum variable

    # Code to print the result
    la $a0, message_result # Load address of the result message
    li $v0, 4           # Syscall for print string
    syscall

    lw $a0, sum         # Load the sum into $a0
    li $v0, 1           # Syscall for print integer
    syscall

    li $v0, 10          # Syscall for exit
    syscall