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

push/pop *segment* *n* (Memory)

label *x*, goto *x*, if-goto *x* (Branching)

function *name* *nVars*, call *name* *nVars*, return (Function)