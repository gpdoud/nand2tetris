// Multiplies R0 and R1 and stores the result in R2.
// will loop adding R0 to R2 R1 number of times

// zero R2
@R2
M=0
// init index
@i
M=0
(LOOP)
// loop while i < R1
@R1
D=M
// calc R1 - i
@i
D=D-M
// if R1 - i = 0 END
@END
D;JEQ
// else add R0 to R2
@R0
D=M
@R2
M=M+D
// increment i
@i
M=M+1
@LOOP
0;JMP

(END)
@END
0;JMP
