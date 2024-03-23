minIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for both a0, a1
	bnez a1, minIncome_fileNotEmpty # minIncome function
	li a0, 0
	ret

 minIncome_fileNotEmpty:
 
##########################################################################
# Created by:Anshul Kolli
#
#
#
# Assignment:minimum income
# Cruz ID: 2025018
# 14 March 2024
# Lab 4: Simple CSV File Analysis
# CSE 12, Computer Systems and Assembly Language
# UC Santa Cruz, Winter 2024
#
#
# Description: This program returns the address of the name of the stock with the lowest income
#
# Notes: This program is intended to be run from RARS.
##########################################################################
pushw(ra)			#push return address
	mv s10, a0		#stores address for name of lowest value stock
	addi s7, a0, 8		#stores address for name of current stock that the lowest stock is being compared to
	mv s8, a1		#a counter to make sure I do not compare too many times
	addi a0, a0, 4		#set a0 to the address of the first number
	addi s5, a0, 8		#address for the stock value of the one being minCompared
	jal income_from_record  #set a0 to the value of the stock
	mv s9, a0		#set the value of the highest stock to s9
	li s11, 1		#load s11 with 1
	
minCompare:
	beq s8, s11, minEnding		#if a1 has been decremented to 1, the max has been finalized
	mv a0, s5			#load the address of the stock value into a0 to make sure that the income from record is correct
	jal income_from_record		#set a0 to the income of that row
	mv s6, a0			#move the value of the current income into s6
	blt s6, s9, minChange		#compare the current minimum to the possible new minimum and if the new minimum is low then move to change function

part2:
	addi s7, s7, 8			#move to next row name address
	addi s8, s8, -1			#decrement the comparision counter by one
	addi s5, s5, 8			#move to next row to find the next income for comparision
	j minCompare			#go back to the start of the loop
	
minChange:
	mv s10, s7			#change the current min address to the new min address for name
	mv s9, s6			#change the value of the lowest performing stock to the new lowest performing stock
	j part2				#continue the loop
	#if no student code entered, a0 just returns 0x10040010 always :(
minEnding:
	mv a0, s10			#move the address of the name of the lowest value stock into a0
popw(ra)				#pop return address

	ret
#######################end of minIncome###############################################
