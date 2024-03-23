length_of_file:
#function to find length of data read from file
#arguments: a1=bufferAdress holding file data
#return file length in a0
	
#Start your coding here
##########################################################################
# Created by:Anshul Kolli
#
#
#
# Assignment:length of file function
# Cruz ID: 2025018
# 14 March 2024
# Lab 4: Simple CSV File Analysis
# CSE 12, Computer Systems and Assembly Language
# UC Santa Cruz, Winter 2024
#
#
# Description: This program returns the length of a file
#
# Notes: This program is intended to be run from RARS.
##########################################################################
li a0, 0
#if no student code provided, this function just returns 0 in a0


bytecounter:		#Loop to count the number of bytes

    lb t0, 0(a1)	#load the byte into t0
    beq t0, zero, End	#check if the byte is null and if it is then end the count since there are no more bytes to be counted
    addi a0, a0, 1	#increment the counter by one
    addi a1, a1, 1	#change which byte will be evaluated to the next one
    j bytecounter	#go back to the start of the loop
End:
#End your coding here
	
	ret
#######################end of length_of_file###############################################	
