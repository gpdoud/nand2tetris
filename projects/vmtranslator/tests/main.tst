
load main.asm,
//output-file main.out,
//compare-to main.cmp,
//output-list RAM[0]%D1.6.1 RAM[256]%D1.6.1 RAM[257]%D1.6.1,
//            RAM[3]%D1.6.1 RAM[4]%D1.6.1 RAM[3032]%D1.6.1 RAM[3046]%D1.6.1;

set RAM[0] 256;   // initializes the stack pointer

//repeat 100 {      // enough cycles to complete the execution
//  ticktock;
//}

// outputs the stack base, this, that, and
// some values from the the this and that segments

//output;
