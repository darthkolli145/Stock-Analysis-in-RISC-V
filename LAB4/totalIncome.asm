totalIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for  a0
	bnez a1, totalIncome_fileNotEmpty # totalIncome function
	li a0, 0
	ret

totalIncome_fileNotEmpty:

# Start your coding from here!
##########################################################################
# Created by:Anshul Kolli
#
#
#
# Assignment:total income
# Cruz ID: 2025018
# 14 March 2024
# Lab 4: Simple CSV File Analysis
# CSE 12, Computer Systems and Assembly Language
# UC Santa Cruz, Winter 2024
#
#
# Description: This program returns the combined income from all stocks
#
# Notes: This program is intended to be run from RARS.
##########################################################################
pushw(ra)			#push the return address
    li s6, 0			#running total will be s6, so make sure it is 0
    addi a0, a0, 4		#increment a0 by 4 to get to the pointer for how much money the stock is providing
    mv s7, a0			#make s7 hold this address
    addi s5, a1, 0		#s5 will be the counter to make sure the loop runs a correct number of times

totalincomeloop:
    beqz s5, exit		#when the counter is equal to 0, the total is complete
    jal income_from_record	#a0 becomes income of the current row
    add s6, s6, a0		#add the income to s6, the running total
    addi s7, s7, 8		#increment s7 to get to the next row's address
    mv a0, s7			#put this value into a0 to make sure the income_from_record is calculated properly
    addi s5, s5, -1		#decrement the counter by 1
    j totalincomeloop		#go back to the start of the loop

exit:				
    mv a0, s6			#move the value of total income into a0
    popw(ra)			#pop the return address
# End your  coding  here!
	
	ret
#######################end of nameOfMaxIncome_totalIncome###############################################
