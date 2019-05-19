// sum 1 to R0

// get  R0
@R0
D=M
// save the max
@NBR
M=D
// init @sum with the max
@SUM
M=D

(LOOP)
// dec @NBR
@NBR
M=M-1
D=M
// jmp to end if zero
@END
D;JEQ
// add to @sum
@SUM
M=D+M
// jmp to loop
@LOOP
0;JMP



(END)
@END
0;JMP