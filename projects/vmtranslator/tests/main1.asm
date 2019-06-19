// *** pop local 1 ***
// stor R13 in local 1
@1      // local 1
D=A     // store 1 in D
@1      // @LCL (local 0)
A=M+D   // local 1
D=A     // D pts to local 1
@R13
M=D
// pop from stack
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// store D in R14
@R13
A=M
M=D