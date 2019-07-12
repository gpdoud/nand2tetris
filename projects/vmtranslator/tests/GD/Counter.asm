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
// VM:label BEGIN, CNT:0
(Counter$BEGIN)
// VM:push constant 1, CNT:1
@1 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop local 0, CNT:2
@0      // local offset
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
// VM:push constant 10, CNT:3
@10 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop local 1, CNT:4
@1      // local offset
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
// VM:label LOOP, CNT:5
(Counter$LOOP)
// VM:push local 0, CNT:6
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
// VM:push constant 1, CNT:7
@1 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:add, CNT:8
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
// VM:pop local 0, CNT:9
@0      // local offset
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
// VM:push local 0, CNT:10
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
// VM:push local 1, CNT:11
@1 // @nbr
D=A  // store nbr in D
@1  // @LCL
A=M+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
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
// VM:if-goto LOOP , CNT:13
@SP
M=M-1
A=M
D=M
@Counter$LOOP
D;JNE
// VM:label DONE, CNT:14
(Counter$DONE)
// VM:goto DONE, CNT:15
@Counter$DONE
0;JMP
