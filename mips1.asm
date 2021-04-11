.data 
	enteringString:	.asciiz "\nWelcome to our MIPS project! \n"
	menuString:	.asciiz "Main Menu: \n 1. Count Alpabetic Characters \n 2. Sort Numbers \n 3. Prime (N) \n 4. Huffman Coding \n 5. Exit \n Please select an option: "
	userInput:	.space	100
	first:		.asciiz "\n Enter the String: \n "
	second:		.asciiz "You choose second option! \n"
	third:		.asciiz "You choose third option! \n"
	fourth:		.asciiz "You choose fourth option! \n"
	endMessage:	.asciiz "Program ends. Bye :)"
	occurencesString:	.asciiz "\nCharacter	Occurence\n"
	
.text 
	main:
	
		do:
			jal displayMessage
			jal menuMessage
		 
			li $v0, 5
        		syscall
        		
        		add $t0, $zero, $v0 
        		addi $t1, $zero, 1
        		addi $t2, $zero, 2
        		addi $t3, $zero, 3
        		addi $t4, $zero, 4
        		        		        		
        		beq $t0, $t1, firstOptionCall
        		beq $t0, $t2, secondOptionCall
        		beq $t0, $t3, thirdOptionCall
        		beq $t0, $t4, fourthOptionCall        	
        	while: 
        		beq $t0, 5, exit
        		j do
        	exit: 
        	 	li $v0, 4           
   			la $a0, endMessage 
    			syscall
        		
	#tell the program that the program is done. 
	li $v0, 10
 	syscall  
	
	displayMessage: 
		li $v0, 4
		la $a0, enteringString
		syscall
		
		jr $ra
		
	menuMessage: 
		li $v0, 4
		la $a0, menuString
		syscall
		
		jr $ra
	firstOptionCall:
		jal firstOption
		j do
	secondOptionCall:
		jal secondOption
		j do
	thirdOptionCall:
		jal thirdOption
		j do
	fourthOptionCall:
		jal fourthOption
		j do
	firstOption:
		li $v0, 4
		la $a0, first
		syscall
		
		li $v0, 8
		la $a0, userInput
		li $a1, 100
		syscall
		
		li $v0, 4
		la $a0, occurencesString
		syscall

		jr $ra
	secondOption:
		li $v0, 4
		la $a0, second
		syscall
		
		jr $ra
	thirdOption:
		li $v0, 4
		la $a0, third
		syscall
		
		jr $ra
	fourthOption:
		li $v0, 4
		la $a0, fourth
		syscall
		
		jr $ra
