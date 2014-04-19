# File:         print_string.asm
# Written by:   Yeukhon Wong, Novemeber. 02, 2011
# Version: 		1.0
# This file contains a MIPS assembly language program and is tested under
# Windows 7 and QtSpim 9.14.2011
#
#
# Functionality:
#	Print a string on the screen.
#
# It is intended to use in CSC342
#

	.data
msg:	.asciiz "NYAN NYAN NYAN"

	.text
	.align 2
	.globl main

main:
	li		$v0, 4			# syscall code for "print_string"
	la		$a0, msg		# load address of msg in memory to $a0
	syscall					# will print a string since $v0 = '4'

	li		$v0, 10			# syscall code for exit
	syscall					# program will terminate
