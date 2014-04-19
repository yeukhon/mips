# File:         input_demo.asm
# Written by:   Yeukhon Wong, October. 31, 2011
# Version: 		1.0
# This file contains a MIPS assembly language program and is tested under
# Windows 7 and QtSpim 9.14.2011
#
#
# Functionality:
#	Prompt user to enter a string and display the entered string.
#
# It is intended to use in CSC342
#

	.data
str1:	.asciiz "Please enter a string:\n"
str2:	.asciiz "You just entered:\n\n"

myString:	.space 32
myString2:	.byte
myString3:  .space 1
	
	.text
	.align 2
	.globl main

main:
	li		$v0, 4			# "print_string"
	la		$a0, str1		# load str1
	syscall
	
	li		$v0, 8			# "read_string"
	la		$a0, myString	# locate myString
	li		$a1, 32			# max characters to read in
	syscall
	addi	$t0, $a0, 0		# copy a0 to t0
	
	la		$a0, myString2	# locate myString2	
	la		$a0, myString3	# locate myString3
	
	li		$v0, 4			# "print_string"
	la 		$a0, str2		# load str2
	syscall
	
	li		$v0, 4			# "print_string"
	addi	$a0, $t0, 0		# copy t0 to a0
	syscall
	
	li		$v0, 4			# "print_string"
	la		$a0, str3		# load str3
	syscall
	jr		$ra				# jump-return