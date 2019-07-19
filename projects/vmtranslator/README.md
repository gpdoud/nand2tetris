RAM Mapping

   0 : SP
   1 : LCL (local)
   2 : ARG
   3 : THIS
   4 : THAT
   5 : TEMP
     : |
  12 : TEMP
  13 : Gen Regs
     : |
  15 : Gen Regs
  16 : STATIC
     : |
 255 : STATIC
 256 : STACK
     : |
2047 : STACK

VM Commands

add, sub, neg, eq, gt, lt, and, or, not (Arithmetic/Logical)

push/pop *segment* *n* (Memory) [Note: n 0 <= *n*]

push/pop pointer 0 (THIS) / 1 (THAT)

label *x*, goto *x*, if-goto *x* (Branching)

function *name* *nVars*, call *name* *nVars*, return (Function)

# functions

When a function is called, it has pushed n arguments onto the stack. The @ARG pointer must be set to point to the location of the stack that holds the arguments. i.e. Starting from a clean stack, if a function pushes two arguments, the @ARG must point to the top of the stack where the args begin.

The function's 'frame' (return address, LCL, ARG, THIS, THAT) [2.4 10:09] is the state of the caller including the segments being used. The frame must be saved before the call is done.

Callee starts by setting up n local vars on the stack and assigning LCL to the location. A function always pushes a return value on the stack before issuing RETURN.

## Executing RETURN

starts by copying the return value to ARG 0 (1st location on the stack).

Restore segment pointers to the caller (LCL, ARG, THIS, THAT)

Clear the stack back to ARG 0 (return value)

Set SP to ARG 0 + 1

         STACK
         val
         val
ARG ->   val   ARG 0
         val   ARG 1
         ...
         return addr  --|
         saved LCL      |
         saved ARG      - caller frame
         saved THIS     |
         saved THAT   --|
LCL ->   0     LCL 0
         0     LCL 1
         ...
         val   callee stack
         val   "
SP ->    0
         0
         ...

Unit 2.4 recap at 22:00

*"Any sufficiently advanced technology is indistinguishable from magic"*
- Authur C Clark (1963)

## Compiling a directory

Assumed that one VM file in a directory will be called Main.vm and it will have a function 
called Main.main

Each vm program should start with bootstrap code that calls Sys.init

      SP=256
      call Sys.init

## Symbol names

static variable should be translated Main._j_ where _j_ is incremented with each encounter

labels within functions should be (_functionname_$_label_)
returns should be (_functionname_$_ret_._n_) // functions called multiple times