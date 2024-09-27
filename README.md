Project makes use of https://github.com/mpaland/printf repo

Build:
riscv64-unknown-elf-gcc -c -o libcsc3054.o csc3054.c
riscv64-unknown-elf-ar rcs libcsc3054.a libcsc3054.o

Program Example Use:
riscv64-unknown-elf-gcc -L. -o hello hello.c libcsc3054.a
or
riscv64-unknown-elf-gcc -L. -o hello hello.c libcsc3054.a printf/libprintf.a

Run:
spike /riscv64-unknown-elf/bin/pk hello

To get printf going:
riscv64-unknown-elf-gcc -c -o libprintf.o printf.c
riscv64-unknown-elf-ar rcs libprintf.a libprintf.o

For putchar implementation in mpland's printf, I used:
void _putchar(char c) {
   // Goal: write(1, &c, sizeof(c));
   asm volatile (
      "li a7, 64\n"
      "li a0, 1\n"
      "mv a1, %0\n"
      "mv a2, %1\n"
      "ecall\n"
      :
      : "r"(&c), "r"(1)
      : "a0", "a1", "a2", "a7"
   );
}

// unsigned char *uart = (unsigned char*)0x10000000; 
does not seem to work even though that's what the device tree dump for spike
gives me

To use in assembly code (call printNum)
        # call printNum
        add a0, x0, x4  // a0 maps to x10, first argument parameter
        jal printNum // note with void return type just this format
