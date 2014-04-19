# File:         main_myadd.asm
# Written by:   Yeukhon Wong, November 02, 2011
# Revised by:   Yeukhon Wong, November 06, 2011
# Version:      2.0
# 
# This file contains a MIPS assembly language program and is tested under
# Windows 7 and QtSPIM 9.14.2011, pcSPIM, 9.14.2011
#
# Registers used:
#   __Preserved__
#       $fp     - holds the frame pointer (preserved using stack)
#       $s0     - holds the value of varA
#       $s1     - holds the value of sum in MAIN
#               - holds the value of t in MYADD 
#       $ra     - holds the return address (preserved using stack)
#
#   __NotPreserved__
#       $a0     - holds the value of varA as an argument
#       $v0     - holds the return value
#       
# Functionality:
#       Add 1 to varA and return the result to main(). 
#       Print varA and sum.
#
# Value Table:
#                  DEC     HEX
#       |-------|-------|-------|
#       | varA  |  42   |  2A   |
#       |_______|_______|_______|
#       |  sum  |  31   |  1F   |
#       |_______|_______|_______|
# 
#       It is intended to use in CSC342
#

        .data
varA:   .word   42
str1:   .asciiz "\n"

        .text
        .globl main
main:   
        subu        $sp, $sp, 32        # create a frame size 32 bytes
        sw      $ra, 24($sp)        # save return address
        sw      $fp, 20($sp)        # save previous frame pointer (ebp)
        sw      $s0, 16($sp)        # preserve $s0
        sw      $s1, 12($sp)        # preserve $s1
        addiu       $fp, $sp, 28        # $fp points to the first word 
        
        lw      $s0, varA       # load varA value into $s0
        
        addi        $s1, $0, 31     # $s1 holds the constant 31
        
# Caller procedure
        add     $a0, $0, $s0        # varA is an argv
        jal     MYADD           # jump & link
# Return from procedure
        add     $s1, $0, $v0        # Save returned value in $s1
        
        li      $v0, 1          # syscall "integer"
        add     $a0, $0, $s1        # put sum in syscall
        syscall
        
        li      $v0, 4          # syscall "print_string"
        la      $a0, str1       # put str1 in syscalll
        syscall

        li      $v0, 1          # syscall "integer"
        add     $a0, $0, $s0        # put varA in syscall
        syscall
        
        lw      $s1, 12($sp)        # restore s1
        lw      $s0, 16($sp)        # restore s0
        lw      $fp, 20($sp)        # restore old frame pointer
        lw      $ra, 24($sp)        # restore return address
        addiu       $sp, $sp, 32        # pop frame
        jr      $ra             
        
MYADD:      
        subu        $sp, $sp, 32        
        sw      $ra, 24($sp)        # save return address
        sw      $fp, 20($sp)        # save previous frame pointer (ebp)
        sw      $s0, 16($sp)        # preserve $s0, varA = 42
        sw      $s1, 12($sp)        # preserve $s1, sum = 31
        addiu       $fp, $sp, 28        # $fp points to the first word
        
        li      $s1, 1          # t = 1
        add     $s0, $a0, $s1       # x = x + t  (use $s0 to store sum)
        add     $v0, $0, $s0        # add x to result register

        lw      $s1, 12($sp)        # restore s1
        lw      $s0, 16($sp)        # restore s0
        lw      $fp, 20($sp)        # restore old frame pointer
        lw      $ra, 24($sp)        # restore return address
        addiu       $sp, $sp, 32        # pop frame
        jr      $ra     
