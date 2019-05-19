// flip R0 & R1

// R0 -> temp
@R0
D=M
@temp
M=D
// R1 => R0
@R1
D=M
@R0
M=D
// temp => R1
@temp
D=M
@R1
M=D

(END)
@END
0;JMP