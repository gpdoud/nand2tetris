// VM:, CNT:0
// VM:, CNT:1
// VM:function Sys.init 0, CNT:2
(Sys.init$BEGIN) // Function Sys.init
// VM:push constant 4000	, CNT:3
@4000 // Push Constant 4000
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop pointer 0, CNT:4
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3  // 0 = this, 1 = that
M=D  // sav to this/that
// VM:push constant 5000, CNT:5
@5000 // Push Constant 5000
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop pointer 1, CNT:6
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4  // 0 = this, 1 = that
M=D  // sav to this/that
// VM:call Sys.main 0, CNT:7
@Sys.main$RETURN
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
@0
D=D-A
@2 // ARG
M=D
@SP // set LCL = SP
D=M
@1
M=D
@Sys.main$BEGIN // Call Sys.main 0
0;JMP // jump to function
(Sys.main$RETURN) // location to return
// VM:pop temp 1, CNT:8
@R5       // R5 is Temp
D=A       // sav in D
@R13      // R13 is temp reg
M=D       // stor R5 in R13
@1        // temp 2
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
// VM:label LOOP, CNT:9
(Sys$LOOP)
// VM:goto LOOP, CNT:10
@Sys$LOOP
0;JMP
// VM:, CNT:11
// VM:, CNT:12
// VM:function Sys.main 5, CNT:13
(Sys.main$BEGIN) // Function Sys.main
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
@0 // Push Constant 0
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 4001, CNT:14
@4001 // Push Constant 4001
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop pointer 0, CNT:15
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3  // 0 = this, 1 = that
M=D  // sav to this/that
// VM:push constant 5001, CNT:16
@5001 // Push Constant 5001
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop pointer 1, CNT:17
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4  // 0 = this, 1 = that
M=D  // sav to this/that
// VM:push constant 200, CNT:18
@200 // Push Constant 200
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop local 1, CNT:19
@1    // Pop Local 1
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
// VM:push constant 40, CNT:20
@40 // Push Constant 40
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop local 2, CNT:21
@2    // Pop Local 2
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
// VM:push constant 6, CNT:22
@6 // Push Constant 6
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop local 3, CNT:23
@3    // Pop Local 3
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
// VM:push constant 123, CNT:24
@123 // Push Constant 123
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:call Sys.add12 1, CNT:25
@Sys.add12$RETURN
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
@1
D=D-A
@2 // ARG
M=D
@SP // set LCL = SP
D=M
@1
M=D
@Sys.add12$BEGIN // Call Sys.add12 1
0;JMP // jump to function
(Sys.add12$RETURN) // location to return
// VM:pop temp 0, CNT:26
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
// VM:push local 0, CNT:27
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
// VM:push local 1, CNT:28
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
// VM:push local 2, CNT:29
@2 // @nbr
D=A  // store nbr in D
@1  // @LCL
A=M+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// VM:push local 3, CNT:30
@3 // @nbr
D=A  // store nbr in D
@1  // @LCL
A=M+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// VM:push local 4, CNT:31
@4 // @nbr
D=A  // store nbr in D
@1  // @LCL
A=M+D  // set ptr to new A
D=M  // sav local nbr to D
@SP
A=M  // addr of top
M=D  // push nbr
@SP
M=M+1
// VM:add, CNT:32
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
// VM:add, CNT:33
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
// VM:add, CNT:34
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
// VM:add, CNT:35
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
// VM:return, CNT:36
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
@Sys.main$RETURN // place to return
0;JMP
// VM:, CNT:37
// VM:, CNT:38
// VM:function Sys.add12 0, CNT:39
(Sys.add12$BEGIN) // Function Sys.add12
// VM:push constant 4002, CNT:40
@4002 // Push Constant 4002
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop pointer 0, CNT:41
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3  // 0 = this, 1 = that
M=D  // sav to this/that
// VM:push constant 5002, CNT:42
@5002 // Push Constant 5002
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop pointer 1, CNT:43
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4  // 0 = this, 1 = that
M=D  // sav to this/that
// VM:push argument 0, CNT:44
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
// VM:push constant 12, CNT:45
@12 // Push Constant 12
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:add, CNT:46
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
// VM:return, CNT:47
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
@Sys.add12$RETURN // place to return
0;JMP
