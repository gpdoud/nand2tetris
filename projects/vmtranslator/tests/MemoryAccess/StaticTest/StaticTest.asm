// VM:, CNT:0
// VM:push constant 111, CNT:1
@111 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 333, CNT:2
@333 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 888, CNT:3
@888 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop static 8, CNT:4
@SP
M=M-1
A=M  // addr of top
D=M  // save to D
@R13 // temp
M=D
@8
D=A
@R16 // @STATIC 0
D=A+D  // D pts to addr static n
@R14
M=D     // pts to addr static n
@R13
D=M
@R14
A=M
M=D
// VM:pop static 3, CNT:5
@SP
M=M-1
A=M  // addr of top
D=M  // save to D
@R13 // temp
M=D
@3
D=A
@R16 // @STATIC 0
D=A+D  // D pts to addr static n
@R14
M=D     // pts to addr static n
@R13
D=M
@R14
A=M
M=D
// VM:pop static 1, CNT:6
@SP
M=M-1
A=M  // addr of top
D=M  // save to D
@R13 // temp
M=D
@1
D=A
@R16 // @STATIC 0
D=A+D  // D pts to addr static n
@R14
M=D     // pts to addr static n
@R13
D=M
@R14
A=M
M=D
// VM:push static 3, CNT:7
@3 // @nbr
D=A  // store nbr in D
@16  // @STATIC
A=A+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// VM:push static 1, CNT:8
@1 // @nbr
D=A  // store nbr in D
@16  // @STATIC
A=A+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// VM:sub, CNT:9
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
@R13
M=D
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
@R13
D=D-M // sav to D
@SP
A=M
M=D
@SP   // SP++
M=M+1
// VM:push static 8, CNT:10
@8 // @nbr
D=A  // store nbr in D
@16  // @STATIC
A=A+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// VM:add, CNT:11
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
@R13
M=D
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
@R13
M=M+D // add
D=M // sav in D
@SP
A=M
M=D
@SP
M=M+1
