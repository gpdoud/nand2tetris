// VM:push temp 6, CNT:0
@6  // temp reg
D=A  // store nbr in D
@R5  // addr SP
A=A+D  // set ptr to new A
D=M  // store nbr in D
@SP
A=M
M=D
@SP
M=M+1
