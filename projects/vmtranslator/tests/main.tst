
load main.asm,
output-file main.out,
compare-to main.cmp,
output-list RAM[0]%D1.6.1 RAM[1]%D1.6.1 RAM[2]%D1.6.1 
            RAM[3]%D1.6.1 RAM[4]%D1.6.1 RAM[5]%D1.6.1;

set RAM[0] 256,   // initializes the stack pointer
set RAM[1] 300,   // initializes the stack pointer
set RAM[2] 400,   // initializes the stack pointer
set RAM[3] 3000,   // initializes the stack pointer
set RAM[4] 3010;   // initializes the stack pointer

repeat 300 {      // enough cycles to complete the execution
  ticktock;
}

// outputs the stack base, this, that, and
// some values from the the this and that segments

output;
