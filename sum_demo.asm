# File:         demo_sum.asm
# Written by:   Yeukhon Wong, October. 31, 2011
# Version: 		1.0
# This file contains a MIPS assembly language program and is tested under
# Windows 7 and QtSpim 9.14.2011
#
#
# Functionality:
#	Store constant integer '5', add to itself, and display sum = 10.
#
# It is intended to use in CSC342
#

	.data
str1:	.asciiz "The sum is:\n"
	
	.text
	.align 2
	.globl main

main:
	li		$v0, 4				# "print_string"
	la		$a0, str1			# load str1
	syscall
	
	li		$v0, 1				# "integer"
	la		$a0, 5
	add		$a0, $a0, $a0		# sum = sum + sum
	syscall						# invoke to print "integer"
	