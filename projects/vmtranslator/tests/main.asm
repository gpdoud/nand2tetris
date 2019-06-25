// VM:push constant 57, CNT:0
@57 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 31, CNT:1
@31 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 53, CNT:2
@53 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:add, CNT:3
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
// VM:push constant 112, CNT:4
@112 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:sub, CNT:5
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
// VM:neg, CNT:6
@SP
M=M-1 // SP--
A=M
D=M  // sto in D
D=!D // negate
D=D+1  // add 1
M=D   // stor back in SP
@SP
M=M+1     // SP++
// VM:and, CNT:7
@SP     // addr 0
M=M-1
A=M
D=M     // pop in D
@R13
M=D     // sto D in R13
@SP
M=M-1
A=M
D=M&D     // pop in D
@SP
A=M
M=D      // push D
@SP
M=M+1
// VM:push constant 82, CNT:8
@82 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:or, CNT:9
@SP     // addr 0
M=M-1
A=M
D=M     // pop in D
@R13
M=D     // sto D in R13
@SP
M=M-1
A=M
D=M|D     // pop in D
@SP
A=M
M=D      // push D
@SP
M=M+1
// VM:not, CNT:10
@SP     // addr 0
M=M-1
A=M
D=M     // pop in D
D=!D    // NOT
@SP
A=M
M=D      // push D
@SP
M=M+1
