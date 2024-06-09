.data
newline:     .asciiz "\n"    # Newline character
space:       .asciiz " "     # Space character
star:        .asciiz "*"     # Star character

.text
.globl main

main:
    # Initialize variables
    li $t0, 3          # n = 5 (number of rows for the upper half)
    li $t1, 0            # i = 0 (row index)

    # Print the upper half of the diamond
upper_half:
    bge $t1, $t0, lower_half # if i >= n, go to lower_half
    sub $t2, $t0, $t1       # t2 = n - i
    sub $t2, $t2, 1         # t2 = n - i - 1

    # Print leading spaces
print_spaces_upper:
    beqz $t2, print_stars_upper  # if t2 == 0, go to print_stars_upper
    li $v0, 4                   # print space
    la $a0, space
    syscall
    sub $t2, $t2, 1             # t2 -= 1
    j print_spaces_upper

print_stars_upper:
    add $t3, $t1, $t1           # t3 = 2 * i
    add $t3, $t3, 1             # t3 = 2 * i + 1

    # Print stars
print_star_upper_loop:
    beqz $t3, print_newline     # if t3 == 0, go to print_newline
    li $v0, 4                   # print star
    la $a0, star
    syscall
    sub $t3, $t3, 1             # t3 -= 1
    j print_star_upper_loop

print_newline:
    li $v0, 4                   # print newline
    la $a0, newline
    syscall
    addi $t1, $t1, 1            # i += 1
    j upper_half

    # Print the lower half of the diamond
lower_half:
    sub $t1, $t0, 2             # i = n - 2

lower_half_loop:
    bltz $t1, end               # if i < 0, go to end
    sub $t2, $t0, $t1           # t2 = n - i
    sub $t2, $t2, 1             # t2 = n - i - 1

    # Print leading spaces
print_spaces_lower:
    beqz $t2, print_stars_lower # if t2 == 0, go to print_stars_lower
    li $v0, 4                   # print space
    la $a0, space
    syscall
    sub $t2, $t2, 1             # t2 -= 1
    j print_spaces_lower

print_stars_lower:
    add $t3, $t1, $t1           # t3 = 2 * i
    add $t3, $t3, 1             # t3 = 2 * i + 1

    # Print stars
print_star_lower_loop:
    beqz $t3, print_newline_lower # if t3 == 0, go to print_newline_lower
    li $v0, 4                    # print star
    la $a0, star
    syscall
    sub $t3, $t3, 1              # t3 -= 1
    j print_star_lower_loop

print_newline_lower:
    li $v0, 4                   # print newline
    la $a0, newline
    syscall
    sub $t1, $t1, 1             # i -= 1
    j lower_half_loop

end:
    li $v0, 10                  # exit program
    syscall