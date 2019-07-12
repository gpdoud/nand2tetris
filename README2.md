# Nand2Tetris Part 2

## Stack commands

add, sub, neg, eq, gt, lt, and, or, not

All operate on either the top 2 or 1 items on the stack

## Virtual memory segments (argument, local, static)

i.e push static 0, 
    push argument 1, 
    add, 
    pop local 2

adding constant segment

i.e. push constant 17
     pop local 2
     pop static 5
     push argument 3

adding other segments: local, argument, **this**, **that**, constant, static, **pointer**, **temp**

    // D=*p
    @p
    A=M
    D=M

    // *SP=17
    // SP++
    @17     // constant 17
    D=A     // save in D
    @SP     // sp
    A=M     // put value in A
    M=D     // store D in A
    @SP     // sp
    M=M+1   // increment SP

### Memory map

      00 SP
      01 LCL (local)
      02 ARG
      03 THIS
      04 THAT
      05 TEMP
      ..  ||
      12 TEMP
      13 R13
      ..  ||
      15 R15
      16 STATIC REGISTERS (foo.i)
      ..  ||
     255 STATIC REGISTERS
     256 STACK
      ..  ||
    2047 STACK

### Pointer

    push pointer 0/1 (0:THIS)
    pop pointer 0/1 (1:THAT)

### Translator Code

* Parser class
  * returns type of source line
* CodeWriter class
  *
* Main class

### Functions

calling function must push N args onto the stack

`call function N` where N is nbr of args pushed onto the stack

pushed onto the stack are: return addr, LCL, ARG, THIS, THAT

set current ARG ptr set to position of 1st arg on the stack (ARG = SP - 5 - N)

LCL = SP (to setup local vars in called function)

Then goto Function

* must put return value (always required) in location of arg 0 
* SP must point to location after arg 0