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
// VM:, CNT:0
// VM:, CNT:1
// VM:push argument 1, CNT:2
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
// VM:pop pointer 1           , CNT:3
// pop pointer 1           
@SP
M=M-1
A=M
D=M
@4  // 0 = this, 1 = that
M=D  // sav to this/that
// VM:, CNT:4
// VM:push constant 0, CNT:5
@0 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop that 0              , CNT:6
@SP  // SP
M=M-1
A=M
D=M
@R13    // contains popped value
M=D
@0
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
// VM:push constant 1, CNT:7
@1 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop that 1              , CNT:8
@SP  // SP
M=M-1
A=M
D=M
@R13    // contains popped value
M=D
@1
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
// VM:, CNT:9
// VM:push argument 0, CNT:10
@0 // @nbr
D=A  // store nbr in D
@2  // @ARG
A=M+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// VM:push constant 2, CNT:11
@2 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:sub, CNT:12
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
// VM:pop argument 0          , CNT:13
@0      // local offset
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
// VM:, CNT:14
// VM:label MAIN_LOOP_START, CNT:15
(MAIN_LOOP_START)
// VM:, CNT:16
// VM:push argument 0, CNT:17
@0 // @nbr
D=A  // store nbr in D
@2  // @ARG
A=M+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// VM:if-goto COMPUTE_ELEMENT , CNT:18
@SP
M=M-1
A=M
D=M
@COMPUTE_ELEMENT
D;JNE
// VM:goto END_PROGRAM        , CNT:19
@END_PROGRAM
0;JMP
// VM:, CNT:20
// VM:label COMPUTE_ELEMENT, CNT:21
(COMPUTE_ELEMENT)
// VM:, CNT:22
// VM:push that 0, CNT:23
@0
D=A
@R4 // @THAT
A=D+M
D=M  // stor val in D
@SP  // SP
A=M
M=D  // stor D on stack
@SP
M=M+1  // SP++
// VM:push that 1, CNT:24
@1
D=A
@R4 // @THAT
A=D+M
D=M  // stor val in D
@SP  // SP
A=M
M=D  // stor D on stack
@SP
M=M+1  // SP++
// VM:add, CNT:25
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
// VM:pop that 2              , CNT:26
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
// VM:, CNT:27
// VM:push pointer 1, CNT:28
// push pointer 1
@4  // 0 = this, 1 = that
D=M  // sav to D
@SP  // @SP
A=M  // deref
M=D  // sto D to SP
@SP
M=M+1
// VM:push constant 1, CNT:29
@1 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:add, CNT:30
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
// VM:pop pointer 1           , CNT:31
// pop pointer 1           
@SP
M=M-1
A=M
D=M
@4  // 0 = this, 1 = that
M=D  // sav to this/that
// VM:, CNT:32
// VM:push argument 0, CNT:33
@0 // @nbr
D=A  // store nbr in D
@2  // @ARG
A=M+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// VM:push constant 1, CNT:34
@1 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:sub, CNT:35
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
// VM:pop argument 0          , CNT:36
@0      // local offset
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
// VM:, CNT:37
// VM:goto MAIN_LOOP_START, CNT:38
@MAIN_LOOP_START
0;JMP
// VM:, CNT:39
// VM:label END_PROGRAM, CNT:40
(END_PROGRAM)
