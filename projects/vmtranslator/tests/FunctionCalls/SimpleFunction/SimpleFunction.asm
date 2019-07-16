// VM:, CNT:0
// VM:function SimpleFunction.test 2, CNT:1
(SimpleFunction.test$BEGIN) // Function SimpleFunction.test
@0 // Push Constant 0
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
@0 // Push Constant 0
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push local 0, CNT:2
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
// VM:push local 1, CNT:3
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
// VM:add, CNT:4
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
// VM:not, CNT:5
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
// VM:push argument 0, CNT:6
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
// VM:add, CNT:7
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
// VM:push argument 1, CNT:8
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
// VM:return, CNT:10
@1 // save endframe (LCL) to R13
D=M
@R13
M=D
@5 // get return addr to R14 : LCL - 5
D=A
@1
A=M-D
D=M
@R14
M=D
@SP // pop SP (return value) to store in ARG 0
M=M-1
A=M
D=M
@2
A=M
M=D
@2 // set SP to ARG 1
D=M+1
@SP
M=D
@R13 // reset THAT, THIS, ARG, LCL (endframe - 1, 2, 3, 4)
M=M-1
A=M
D=M
@4 // THAT
M=D
@R13
M=M-1
A=M
D=M
@3 // THIS
M=D
@R13
M=M-1
A=M
D=M
@2 // ARG
M=D
@R13
M=M-1
A=M
D=M
@1 // LCL
M=D
@R14 // jump to return addr
A=M
0;JMP
@SimpleFunction.test$RETURN // place to return
0;JMP
