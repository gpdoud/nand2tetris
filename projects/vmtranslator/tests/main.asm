// push constant 444
@444 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// pop that 4
// pop that 4
@SP  // SP
M=M-1
A=M
D=M
@R13    // contains popped value
M=D
@4
D=A
@R4 // @THAt
A=D+M
D=A  // D is addr of this 1
@R14  // addr of this 1
M=D
@R13
D=M
@R14
A=M
M=D
