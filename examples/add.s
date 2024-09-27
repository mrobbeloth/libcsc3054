.data

.text
.global _start
_start:
 	li x5, 4
	li x6, 5
	add x4, x5, x6
	
	# call printNum
	add a0, x0, x4	
	jal printNum // note with void return type just this format
	
	# exit the program
	jal x0, terminate

terminate:
        addi    a0, x0, 0   # Use 0 return code
        addi    a7, x0, 93  # Service command code 93 terminates
        ecall               # Call linux to terminate the program
