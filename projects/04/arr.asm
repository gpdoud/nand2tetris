// init arr[R0] with 1

// get the size of arr
@R0
D=M
// save as variable
@max
M=D
// start of arr
@R1
D=M
@start
M=D
// get init value
@R2
D=M
// save init value
@init
M=D
// setup index
@idx
M=0
(LOOP)
// get the start reg
@start
D=M
// get the idx
@idx
// calc reg addr
D=M+D
// A is next arr entry; set to init
A=D
M=-1
// inc @idx
@idx
M=M+1
D=M
// sub @idx from @max
@max
D=M-D
// loop if idx - max > 0
@LOOP
D;JGT

(END)
@END
0;JMP