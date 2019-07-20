// Bootstrap code
@256 // Set SP=256
D=A
@0
M=D
@Sys.init$BEGIN // call Sys.init (doesn't return)
0;JMP
// VM:function Main.main 0, CNT:0
(Main.main$BEGIN) // Function Main.main
// VM:call Main.add 0, CNT:1
@Main.add$RETURN
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
@Main.add$BEGIN // Call Main.add 0
0;JMP // jump to function
(Main.add$RETURN) // location to return
// VM:return, CNT:2
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
@$RETURN // place to return
0;JMP
// VM:function Main.add 0, CNT:3
(Main.add$BEGIN) // Function Main.add
// VM:push constant 777, CNT:4
@777 // Push Constant 777
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:pop temp 0, CNT:5
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
// VM:return, CNT:6
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
@$RETURN // place to return
0;JMP
// VM:function Sys.init 0, CNT:0
(Sys.init$BEGIN) // Function Sys.init
// VM:call Main.main 0, CNT:1
@Main.main$RETURN
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
@Main.main$BEGIN // Call Main.main 0
0;JMP // jump to function
(Main.main$RETURN) // location to return
// VM:label forever, CNT:2
(Sys$forever)
// VM:goto forever, CNT:3
@Sys$forever
0;JMP
