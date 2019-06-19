// push constant 7
@7 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// push constant 5
@5 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// push constant 2
@2 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
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
// pop temp 0
@R5       // R5 is Temp
D=A       // sav in D
@R13      // R13 is temp reg
M=D       // stor R5 in R13
@0        // temp 2
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
