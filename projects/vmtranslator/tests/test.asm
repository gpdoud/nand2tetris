// SETUP
    @5000
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
// VM:push constant 1, CNT:0
    @1010
    @4 // @nbr
    D=A  // store nbr in D
    @SP  // addr SP
    A=M  // set ptr to new A
    M=D  // store nbr in A
    @SP  // addr SP
    M=M+1  // inc SP
// VM:push constant 2, CNT:1
@1020
    @7 // @nbr
    D=A  // store nbr in D
    @SP  // addr SP
    A=M  // set ptr to new A
    M=D  // store nbr in A
    @SP  // addr SP
    M=M+1  // inc SP
// VM:call test.add 2, CNT:2
    // get return address
@1030
    @CALLRET
    D=A
    // push onto stack
    @SP
    A=M
    M=D
    @SP
    M=M+1
    // push LCL onto the stack
@1040
    @1 // LCL addr
    D=M
    // push onto stack
    @SP
    A=M
    M=D
    @SP
    M=M+1
    // push ARG onto the stack
@1050
    @2 // ARG addr
    D=M
    // push onto stack
    @SP
    A=M
    M=D
    @SP
    M=M+1
    // push THIS onto the stack
@1060
    @3 // THIS addr
    D=M
    // push onto stack
    @SP
    A=M
    M=D
    @SP
    M=M+1
    // push THAT onto the stack
@1070
    @4 // THAT addr
    D=M
    // push onto stack
    @SP
    A=M
    M=D
    @SP
    M=M+1
    // set ARG to 1st arg on stack: ARG = SP - 5 - N
@1080
    @SP
    D=M
    @5
    D=D-A
    @2
    D=D-A
    @2 // ARG
    M=D
    // set LCL = SP
@1090
    @SP
    D=M
    @1
    M=D
    // jump to function
@1100
    @TESTADD
    0;JMP
    (CALLRET)
    @FINI
    0;JMP
// VM:function test.add 0, CNT:3
@1110
    (TESTADD) // Function test.add
// VM:push argument 0
    @0
    D=A
    @2 // ARG 0
    A=M+D
    D=M
    // push to SP
    @SP
    A=M
    M=D
    @SP
    M=M+1
// VM:push argument 1
@1120
    @1
    D=A
    @2 // ARG 0
    A=M+D
    D=M
    // push to SP
    @SP
    A=M
    M=D
    @SP
    M=M+1
// VM:add, CNT:4
@1130
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
// VM:end of add
    // set return value in ARG 0
@1140
    @SP
    M=M-1
    A=M
    D=M
    @2 // ARG 0
    A=M
    M=D
    // store reset SP in R13
@1150
    @2
    D=M+1
    @13
    M=D
    // resetore THAT = SP - 1
@1160
    @SP
    AM=M-1 // pts to THAT
    D=M
    @4 // THAT
    M=D
    // restore THIS
@1170
    @SP
    AM=M-1 // pts to THAT
    D=M
    @3 // THAT
    M=D
    // restore ARGS
@1180
    @SP
    AM=M-1 // pts to ARGS
    D=M
    @2 // ARGS
    M=D
    // restore LCL
@1190
    @SP
    AM=M-1 // pts to LCL
    D=M
    @1 // LCL
    M=D
    // restore SP from R13
@1200
    @13
    D=M
    @SP
    M=D
// VM:return, CNT:5
@1210
    @CALLRET
    0;JMP
// FINI
@1210
    (FINI)
    @FINI
    0;JMP