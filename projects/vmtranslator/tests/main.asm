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
// VM:push constant 11, CNT:0
@11 // Push Constant 11
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 22, CNT:1
@22 // Push Constant 22
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 33, CNT:2
@33 // Push Constant 33
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:call main.add 3, CNT:3
@main.add$RETURN
D=A // save return addr
@SP
A=M
M=D
@SP
M=M+1
@1 // LCL addr
D=M
// push LCL onto stack
@SP
A=M
M=D
@SP
M=M+1
@2 // ARG addr
D=M
// push ARG onto stack
@SP
A=M
M=D
@SP
M=M+1
@3 // THIS addr
D=M
// push THIS onto stack
@SP
A=M
M=D
@SP
M=M+1
@4 // THAT addr
D=M
// push THAT onto stack
@SP
A=M
M=D
@SP
M=M+1
@SP // set ARG to 1st arg on stack: ARG = SP - 5 - N
D=M
@5
D=D-A
@3
D=D-A
@2 // ARG
M=D
@SP // set LCL = SP
D=M
@1
M=D
@main.add$BEGIN // Call main.add 3
0;JMP // jump to function
(main.add$RETURN) // location to return
// VM:label fini, CNT:4
(main$fini)
// VM:goto fini, CNT:5
@main$fini
0;JMP
// VM:function main.add 2, CNT:6
(main.add$BEGIN) // Function main.add
@777 // Push Constant 777
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
@777 // Push Constant 777
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push argument 2, CNT:7
@2 // @nbr
D=A  // store nbr in D
@2  // @ARG
A=M+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
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
// VM:add, CNT:9
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
// VM:return, CNT:12
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
@main.add$RETURN // place to return
0;JMP
