# File:         load_byte_demo.asm
# Written by:   Yeukhon Wong, October. 31, 2011
# Version: 		1.0
# This file contains a MIPS assembly language program and is tested under
# Windows 7 and QtSpim 9.14.2011
#
#
# Functionality:
#	Load a byte from str stored in memory, using offset.
#
# It is intended to use in CSC342.
#

	.data
str1:	.asciiz "AB CD EF"
	
	.text
	.align 2
	.globl main

main:
	li		$v0, 4			# "print_string"
	la		$a0, str1		# load str1
	syscall
	
	
	lb		$t0, 4($a0)		# t0 = Mem($a0+4) = C
	li		$v0, 11			# "print_char"
	move	$a0, $t0		# move $t0 to $a0
	syscall

#	la		$t0, str1
#	lb		$a0, 1($t0)
#	li		$v0, 11
#	syscall
	