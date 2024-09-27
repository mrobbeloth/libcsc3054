.data
    beg: .word 0
    end: .word 100

 start:
	

.global _start
.text

_start:
    # load beginning value
    la x5, beg
    lw x28, 0(x5)
    # load ending value
    la x6, end
    lw x29, 0(x6)
    
        # add one to start
loop:   addi x28, x28, 1
        # move/copy inc val to first function argument
        mv x10, x28
        # call function in libcsc3054 static library
        jal x1, printNumLineFeed
        # if beg value equals ending value, end program
        bge x28, x29, terminate
        # else jump back to beginning of loop
        jal x0, loop
    
    # exit the program
    jal x0, terminate

terminate:
        addi    a0, x0, 0   # Use 0 return code
        addi    a7, x0, 93  # Service command code 93 terminates
        ecall               # Call linux to terminate the program
