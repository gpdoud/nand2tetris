// SETUP
@256 // SP
D=A
@0
M=D
@300 // LCL
D=A
@1
M=D
@400 // ARG
D=A
@2
M=D
@3000 // THIS
D=A
@3
M=D
@3010 // THAT
D=A
@4
M=D
// VM:push constant 10, CNT:0
@10 // Push Constant 10
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop local 0, CNT:1
@0    // Pop Local 0
D=A     // store offset in D
@1      // @LCL
A=M+D   // offset to arg n
D=A     // D pts to arg n
@R13
M=D
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
@R13
A=M
M=D
// VM:push constant 21, CNT:2
@21 // Push Constant 21
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 22, CNT:3
@22 // Push Constant 22
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop argument 2, CNT:4
@2      // local offset
D=A     // store offset in D
@2      // @ARG
A=M+D   // offset to arg n
D=A     // D pts to arg n
@R13
M=D
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
@R13
A=M
M=D
// VM:pop argument 1, CNT:5
@1      // local offset
D=A     // store offset in D
@2      // @ARG
A=M+D   // offset to arg n
D=A     // D pts to arg n
@R13
M=D
@SP   // get the SP
M=M-1   // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
@R13
A=M
M=D
// VM:push constant 36, CNT:6
@36 // Push Constant 36
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop this 6, CNT:7
@SP  // SP
M=M-1
A=M
D=M
@R13    // contains popped value
M=D
@6
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
// VM:push constant 42, CNT:8
@42 // Push Constant 42
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 45, CNT:9
@45 // Push Constant 45
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop that 5, CNT:10
@SP  // SP
M=M-1
A=M
D=M
@R13    // contains popped value
M=D
@5
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
// VM:pop that 2, CNT:11
@SP  // SP
M=M-1
A=M
D=M
@R13    // contains popped value
M=D
@2
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
// VM:push constant 510, CNT:12
@510 // Push Constant 510
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop temp 6, CNT:13
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
// VM:push local 0, CNT:14
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
// VM:push that 5, CNT:15
@5
D=A
@R4 // @THAT
A=D+M
D=M  // stor val in D
@SP  // SP
A=M
M=D  // stor D on stack
@SP
M=M+1  // SP++
// VM:add, CNT:16
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
// VM:push argument 1, CNT:17
@1 // @nbr
D=A  // store nbr in D
@2  // @ARG
A=M+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// VM:sub, CNT:18
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
// VM:push this 6, CNT:19
@6
D=A
@R3 // @THIS
A=D+M
D=M  // stor val in D
@SP  // SP
A=M
M=D  // stor D on stack
@SP
M=M+1  // SP++
// VM:push this 6, CNT:20
@6
D=A
@R3 // @THIS
A=D+M
D=M  // stor val in D
@SP  // SP
A=M
M=D  // stor D on stack
@SP
M=M+1  // SP++
// VM:add, CNT:21
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
// VM:sub, CNT:22
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
// VM:push temp 6, CNT:23
@6  // temp reg
D=A  // store nbr in D
@R5  // addr SP
A=A+D  // set ptr to new A
D=M  // store nbr in D
@SP
A=M
M=D
@SP
M=M+1
// VM:add, CNT:24
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
