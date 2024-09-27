.data
    beg: .word 0
    end: .word 100

 start:
	

.global _start
.text

_start:
    la x5, beg
    lw x28, 0(x5)
    la x6, end
    lw x29, 0(x6)
    
loop:   addi x28, x28, 1
        mv x10, x28
        jal x1, printNumLineFeed
        bge x28, x29, terminate
        jal x0, loop
    
    # exit the program
    jal x0, terminate

terminate:
        addi    a0, x0, 0   # Use 0 return code
        addi    a7, x0, 93  # Service command code 93 terminates
        ecall               # Call linux to terminate the program
