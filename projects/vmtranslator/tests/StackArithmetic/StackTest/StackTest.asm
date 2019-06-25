// VM:push constant 17, CNT:0
@17 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 17, CNT:1
@17 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:eq, CNT:2
@SP   // get the SP
M=M-1  // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
@R13
M=D  // sto in R13
@SP
M=M-1   // SP--
A=M   // *SP
D=M   // sav val in D
@R13
D=M-D   // if zero; equal
@EQ2
D;JEQ  // jmp if zero
D=0   // else set to false
@FINI2
0;JMP  // go to end
(EQ2)
D=-1  // equal; set to true
(FINI2)
@SP
A=M
M=D
@SP
M=M+1
// VM:push constant 17, CNT:3
@17 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 16, CNT:4
@16 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:eq, CNT:5
@SP   // get the SP
M=M-1  // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
@R13
M=D  // sto in R13
@SP
M=M-1   // SP--
A=M   // *SP
D=M   // sav val in D
@R13
D=M-D   // if zero; equal
@EQ5
D;JEQ  // jmp if zero
D=0   // else set to false
@FINI5
0;JMP  // go to end
(EQ5)
D=-1  // equal; set to true
(FINI5)
@SP
A=M
M=D
@SP
M=M+1
// VM:push constant 16, CNT:6
@16 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 17, CNT:7
@17 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:eq, CNT:8
@SP   // get the SP
M=M-1  // ptr to top of stk
A=M   // ptr to top
D=M   // sav val in D
@R13
M=D  // sto in R13
@SP
M=M-1   // SP--
A=M   // *SP
D=M   // sav val in D
@R13
D=M-D   // if zero; equal
@EQ8
D;JEQ  // jmp if zero
D=0   // else set to false
@FINI8
0;JMP  // go to end
(EQ8)
D=-1  // equal; set to true
(FINI8)
@SP
A=M
M=D
@SP
M=M+1
// VM:push constant 892, CNT:9
@892 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 891, CNT:10
@891 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:lt, CNT:11
@SP     // addr 0
M=M-1
A=M
D=M
@R13
M=D
@SP
M=M-1
A=M
D=M
@R14
M=D
D=M
@14
M=0    // default to false
@R13
M=D-M
D=M
@LT11
D;JLT
@FINI11
0;JMP
(LT11)
@R14
M=-1
(FINI11)
@R14
D=M
@SP
A=M
M=D
@SP
M=M+1
// VM:push constant 891, CNT:12
@891 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 892, CNT:13
@892 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:lt, CNT:14
@SP     // addr 0
M=M-1
A=M
D=M
@R13
M=D
@SP
M=M-1
A=M
D=M
@R14
M=D
D=M
@14
M=0    // default to false
@R13
M=D-M
D=M
@LT14
D;JLT
@FINI14
0;JMP
(LT14)
@R14
M=-1
(FINI14)
@R14
D=M
@SP
A=M
M=D
@SP
M=M+1
// VM:push constant 891, CNT:15
@891 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 891, CNT:16
@891 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:lt, CNT:17
@SP     // addr 0
M=M-1
A=M
D=M
@R13
M=D
@SP
M=M-1
A=M
D=M
@R14
M=D
D=M
@14
M=0    // default to false
@R13
M=D-M
D=M
@LT17
D;JLT
@FINI17
0;JMP
(LT17)
@R14
M=-1
(FINI17)
@R14
D=M
@SP
A=M
M=D
@SP
M=M+1
// VM:push constant 32767, CNT:18
@32767 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 32766, CNT:19
@32766 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:gt, CNT:20
@SP     // addr 0
M=M-1
A=M
D=M
@R13
M=D
@SP
M=M-1
A=M
D=M
@R14
M=D
D=M
@14
M=0    // default to false
@R13
M=D-M
D=M
@GT20
D;JGT
@FINI20
0;JMP
(GT20)
@R14
M=-1
(FINI20)
@R14
D=M
@SP
A=M
M=D
@SP
M=M+1
// VM:push constant 32766, CNT:21
@32766 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 32767, CNT:22
@32767 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:gt, CNT:23
@SP     // addr 0
M=M-1
A=M
D=M
@R13
M=D
@SP
M=M-1
A=M
D=M
@R14
M=D
D=M
@14
M=0    // default to false
@R13
M=D-M
D=M
@GT23
D;JGT
@FINI23
0;JMP
(GT23)
@R14
M=-1
(FINI23)
@R14
D=M
@SP
A=M
M=D
@SP
M=M+1
// VM:push constant 32766, CNT:24
@32766 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 32766, CNT:25
@32766 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:gt, CNT:26
@SP     // addr 0
M=M-1
A=M
D=M
@R13
M=D
@SP
M=M-1
A=M
D=M
@R14
M=D
D=M
@14
M=0    // default to false
@R13
M=D-M
D=M
@GT26
D;JGT
@FINI26
0;JMP
(GT26)
@R14
M=-1
(FINI26)
@R14
D=M
@SP
A=M
M=D
@SP
M=M+1
// VM:push constant 57, CNT:27
@57 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 31, CNT:28
@31 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:push constant 53, CNT:29
@53 // @nbr
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
// VM:push constant 112, CNT:31
@112 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:sub, CNT:32
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
// VM:neg, CNT:33
@SP
M=M-1 // SP--
A=M
D=M  // sto in D
D=!D // negate
D=D+1  // add 1
M=D   // stor back in SP
@SP
M=M+1     // SP++
// VM:and, CNT:34
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
// VM:push constant 82, CNT:35
@82 // @nbr
D=A  // store nbr in D
@SP  // addr SP
A=M  // set ptr to new A
M=D  // store nbr in A
@SP  // addr SP
M=M+1  // inc SP
// VM:or, CNT:36
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
// VM:not, CNT:37
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
