maxIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0: heap memory pointer to actual  location of the record stock name in the file buffer

	#if empty file, return 0 for both a0, a1
	bnez a1, maxIncome_fileNotEmpty # maxIncome Function
	li a0, 0
	ret

 maxIncome_fileNotEmpty:
	
	# Start your coding from here!
##########################################################################
# Created by:Anshul Kolli
#
#
#
# Assignment:max income
# Cruz ID: 2025018
# 14 March 2024
# Lab 4: Simple CSV File Analysis
# CSE 12, Computer Systems and Assembly Language
# UC Santa Cruz, Winter 2024
#
#
# Description: This program returns the address of the name of the stock with the highest income
#
# Notes: This program is intended to be run from RARS.
##########################################################################
pushw(ra)			#push return address
	mv s11, a0		#stores address for name of highest stock that is currently greatest
	addi s9, a0, 8		#stores address for name of current stock that the highest is being compared to
	mv s8, a1		#a counter to make sure I do not compare too many times
	addi s8, s8, -1		#reduce by one initially since I compare number of rows minus one times
	addi a0, a0, 4		#set a0 to the address of the first number
	addi s5, a0, 8		#address for the stock value of the one being compared
	jal income_from_record  #set a0 to the value of the stock
	mv s7, a0		#set the value of the highest stock to s7
	
compare:
	beqz s8, ending		#if a1 has been decremented to 0, the max has been finalized
	mv a0, s5		#load the address of the stock value into a0 to make sure that the income from record is correct
	jal income_from_record	#set a0 to the income of that row
	mv s6, a0		#move the value of the current income into s6
	bgt s6, s7, change	#compare the current max to the possible new max and if the new max is greater then move to change function
part3:
	addi s9, s9, 8		#move to next row name address
	addi s8, s8, -1		#decrement the comparision counter by one
	addi s5, s5, 8		#move to next row to find the next income for comparision
	j compare		#go back to the start of the loop
	
change:
	mv s11, s9		#change the current max address to the new max address for name
	mv s7, s6		#change the value of the highest stock to the new highest stock
	j part3			#go to the other part of the loop
	#if no student code entered, a0 just returns 0x10040010 always :(
ending:
	mv a0, s11		#move the address of the name of the highest stock into a0
popw(ra)			#pop return address
# End your  coding  here!
	
	ret
#######################end of maxIncome###############################################
