// display black screen while any key is pressed
// otherwise display white screen

// clear R0
@R0
M=0

(LOOP)
@KBD
D=A
@SCREEN
D=D-A
@R0
M=D

@KBD
D=M // save scan code in D
// JMP White if zero

@WHITE
D;JEQ
// JMP Black if not zero
@BLACK
D;JNE

(WHITE)
@color
M=0 // set color to white
// JMP to Paint
@PAINT
0;JMP
// Can fall thru here

(BLACK)
@color
M=-1 // set color to black

(PAINT)

@SCREEN // set start of screen map
D=A // save Screen address
@R1
M=D // save screen address to R1

(ITERATE)
@color
D=M
@R1 // next reg to set
A=M // set to A
M=D // set curr reg to color
A=A+1 // inc reg
D=A // save to D
@R1
M=D // save the next reg to set
@R0
M=M-1 // dec counter
D=M
@ITERATE
D;JNE // done painting

@R1
M=0

@LOOP
0;JMP