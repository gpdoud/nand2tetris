// Bootstrap code
@256 // Set SP=256
D=A
@0
M=D
@Sys.init$BEGIN // call Sys.init (doesn't return)
0;JMP
// VM:function main.add 0, CNT:0
(main.add$BEGIN) // Function main.add
// VM:return, CNT:1
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
