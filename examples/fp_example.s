.data
   const5: .single 5.0
   const9: .single 9.0
   const32: .single 32.0
   fahr: .single 100.0
   zero: .single 0.0
 start:
	

.global _start
.text
_start:
    la x5, const5
    flw f0, 0(x5)
    la x6, const9
    flw f1, 0(x6)
    fdiv.s f0, f0, f1
    la x7, const32
    flw f1, 0(x7)
    la x7, fahr
    flw f10, 0(x7)
    fsub.s f10, f10, f1
    fmul.s f10, f0, f10

    # call printNum
    jal printFloat

    # exit the program
    jal x0, terminate

terminate:
        addi    a0, x0, 0   # Use 0 return code
        addi    a7, x0, 93  # Service command code 93 terminates
        ecall               # Call linux to terminate the program
