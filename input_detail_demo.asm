# File:         input_detail_demo.asm
# Written by:   Yeukhon Wong, October. 31, 2011
# Version: 		1.0
# This file contains a MIPS assembly language program and is tested under
# Windows 7 and QtSpim 9.14.2011
#
# DETAIL EXPLAINTION OF input_demo.asm
#
# Functionality:
#	Prompt user to enter a string and display the entered string.
#
# It is intended to use in CSC342
#

	.data
str1:	.asciiz "Please enter a string:\n"
str2:	.asciiz "You just entered:\n\n"
myString:	.space 32		# allocate 32 bytes
myString2:	.byte
myString3:  .space 1

# END OF DATA SEGEMENT

	.text					# below this is the functionality, like in VHDL :)
	.align 2				# stack alignment: 4 bytes, it's 2^n.
	
	# Basic idea: alignment of variables in memory. This is done for historical reason.
	# I believe on GCC the alignment is 16 bytes by default. I don't know about Intel / MS compiler.
	
	.globl main

main:
	li		$v0, 4				# '4' is the syscall code for "print_string"
	la		$a0, str1			# load the address of str1 into $a0 register
	syscall						# invoke system call, and executes '4' or print_string
	
	li		$v0, 8				# '8' is the syscall code for "read_string"
	la		$a0, myString		# load the address of myString into $a0
	li		$a1, 32				# tell the system the max characters can be read in
	syscall						# call to accept the string just entered by the user
	addi	$t0, $a0, 0			# copy the content in a0 to t0
	
	# note: this is "addi", we adds a constant zero to $t0 with $a0. 
	# We can use "add" if we use $0 register (which has the hardwired value '0'.
	# add	$t0, $0, $a0
	# we could also do use the MOVE command
	
	# I just want to demonstrate memory allocation
	# Look at the instruction codes in QtSPIM, and you will notice something like this
	#
	la		$a0, myString2		# locate myString2
	la		$a0, myString3		# locate myString3
	
	li		$v0, 4				# "print_string"
	la 		$a0, str2			# load str2
	syscall
	
	li		$v0, 4				# "print_string"
	addi	$a0, $t0, 0			# copy t0 to a0
	syscall
	
	li		$v0, 4				# "print_string"
	la		$a0, str3			# load str3
	syscall
	
	jr		$ra					# jump-return to the beginning of main
	
	# you can call the following to exit the program
	#li		$v0, 10
	#syscall