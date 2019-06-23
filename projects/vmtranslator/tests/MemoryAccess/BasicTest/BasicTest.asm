// 
// push constant 10
@10 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// pop local 0
// *** pop local 0 ***
@0      // local offset
D=A     // store offset in D
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
// store D in R1
@R13
A=M
M=D
// push constant 21
@21 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// push constant 22
@22 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// pop argument 2
// pop argument 1
// push constant 36
@36 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// pop this 6
// push constant 42
@42 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// push constant 45
@45 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// pop that 5
// pop that 2
// push constant 510
@510 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// pop temp 6
@R5       // R5 is Temp
D=A       // sav in D
@R13      // R13 is temp reg
M=D       // stor R5 in R13
@6        // temp 2
D=A       // stor nbr in D
@R13      // switch to R13
M=M+D     // R13 points to temp n
@SP       // pop from stack
M=M-1     // dec SP to pt to top
A=M       // addr top SP
D=M       // stor val in D
@R13      // switch to R13
A=M       // get R13 addr
M=D       // stor D in temp n
// push local 0
@0 // @nbr
D=A  // store nbr in D
@1  // @LCL
A=M+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// push that 5
// add
// pop
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// store D in R1
@R13
M=D
// pop
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// add to R13
@R13
M=M+D // add
D=M // sav in D
// push R13
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
// sub
// pop
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// store D in R1
@R13
M=D
// pop
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// add to R13
@R13
M=D-M // sub
D=M // sav in D
// push D
@SP
A=M
M=D
@SP   // SP++
M=M+1
// push this 6
// push this 6
// add
// pop
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// store D in R1
@R13
M=D
// pop
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// add to R13
@R13
M=M+D // add
D=M // sav in D
// push R13
@SP
A=M
M=D
@SP
M=M+1
// sub
// pop
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// store D in R1
@R13
M=D
// pop
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// add to R13
@R13
M=D-M // sub
D=M // sav in D
// push D
@SP
A=M
M=D
@SP   // SP++
M=M+1
// push temp 6
@11            // temp reg
A=A+D          // ptr to temp reg
D=M            // sto temp reg in D
@SP            // SP
A=M            // ptr to SP
M=D            // sto temp in stack
@SP            // stack ptr
M=M+1          // SP++
// add
// pop
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// store D in R1
@R13
M=D
// pop
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
// add to R13
@R13
M=M+D // add
D=M // sav in D
// push R13
@SP
A=M
M=D
@SP
M=M+1
