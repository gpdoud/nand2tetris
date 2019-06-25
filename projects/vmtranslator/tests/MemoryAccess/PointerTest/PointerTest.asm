// VM:, CNT:0
// VM:push constant 3030, CNT:1
@3030 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop pointer 0, CNT:2
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3  // 0 = this, 1 = that
M=D  // sav to this/that
// VM:push constant 3040, CNT:3
@3040 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop pointer 1, CNT:4
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4  // 0 = this, 1 = that
M=D  // sav to this/that
// VM:push constant 32, CNT:5
@32 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop this 2, CNT:6
@SP  // SP
M=M-1
A=M
D=M
@R13    // contains popped value
M=D
@2
D=A
@R3 // @THIS
A=D+M
D=A  // D is addr of this 1
@R14  // addr of this 1
M=D
@R13
D=M
@R14
A=M
M=D
// VM:push constant 46, CNT:7
@46 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop that 6, CNT:8
@SP  // SP
M=M-1
A=M
D=M
@R13    // contains popped value
M=D
@6
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
// VM:push pointer 0, CNT:9
// push pointer 0
@3  // 0 = this, 1 = that
D=M  // sav to D
@SP  // @SP
A=M  // deref
M=D  // sto D to SP
@SP
M=M+1
// VM:push pointer 1, CNT:10
// push pointer 1
@4  // 0 = this, 1 = that
D=M  // sav to D
@SP  // @SP
A=M  // deref
M=D  // sto D to SP
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
// VM:push this 2, CNT:12
@2
D=A
@R3 // @THIS
A=D+M
D=M  // stor val in D
@SP  // SP
A=M
M=D  // stor D on stack
@SP
M=M+1  // SP++
// VM:sub, CNT:13
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
// VM:push that 6, CNT:14
@6
D=A
@R4 // @THAT
A=D+M
D=M  // stor val in D
@SP  // SP
A=M
M=D  // stor D on stack
@SP
M=M+1  // SP++
// VM:add, CNT:15
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
