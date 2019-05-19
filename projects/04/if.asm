// simulate: if R0>0 ? R1=1 : R1=0

// 0
@R0 // 0
D=M // 1

// 2 GT 0 true
@R8 // 2
D;JLE // 3

// test R0 > 0
@R1 // 4
M=1 // 5
@R10 // 6
0;JMP // 7

// R0 <= 0
@R1 // 8
M=0 // 9

// Infinite loop
@R10 // 10
0;JMP // 11
