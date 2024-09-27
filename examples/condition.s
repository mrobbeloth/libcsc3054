.data
  value1: 
	.word 77
  value2: 
	.word 78
  result: 
	.ascii "v1 less than v2\n"

.global _start
.text

_start:
    la x5, value1
    lw x28, 0(x5)
    la x6, value2
    lw x29, 0(x6)
    blt x28, x29, lessthan

    # exit the program
    jal x0, terminate
lessthan:
    addi a0, x0, 1
    la a1, result
    addi a2, x0, 16
    addi a7, x0, 64
    ecall
terminate:
        addi    a0, x0, 0   # Use 0 return code
        addi    a7, x0, 93  # Service command code 93 terminates
        ecall               # Call linux to terminate the program
