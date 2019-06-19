// Push Temp 2 (push the value at temp2 onto the stack)
// R0 points to stack
// temp starts at R5
// init temp0 to 88
@88
D=A // sav 88 in D
@R7 // temp2
M=D // save 88 to Temp0
// *** setup stack ***
@10 // top of stack
D=A // sav in D
@R0 // SP
M=D // sto 10 in SP
// *** end of setup ***
@2
D=A
@R5
A=A+D
D=M // sto temp in D
@R0 // SP
A=M // ptr to SP (should point to 10)
M=D // sto temp in stack
@R0
M=M+1 // SP should be 11