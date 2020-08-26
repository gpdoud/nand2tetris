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

`call` pops the args off the stack and onto the ARG

pushed onto the stack are: return addr, LCL, ARG, THIS, THAT

set current ARG ptr set to position of 1st arg on the stack (ARG = SP - 5 - N)

LCL = SP (to setup local vars in called function)

Then goto Function

* must put return value (always required) in location of arg 0 
* SP must point to location after arg 0

# Compiling

The `Symbol Table` is where all the variables are maintained during compilation and tracks `name`, `type (int, char, bool, etc.)`, `kind (local, static, argument, etc.)`, and `scope`.

Each compilation unit will have its own symbol table (i.e. one for the class and one for each method being compiled).

When compiling a class method, the current object, `this` must be added to the symbol table as an argument.

The `class` and `subroutine` symbol tables can be reset for each class compiled.

When a variable is encountered during compilation, it is looked up first in the subroutine symbol table. If not found, it is looked up in the class symbol table. If not found in the class symbol table, it can ba assumed to not exist.

When a language features unlimited scoping (i.e. new scopes can be created by simply adding a new statement block), each scope requires its own symbol table. The symbol tables are then loaded into a linked list and variables are searched starting with the inner-most symbol table. If not found, the next level symbol table is searched. The search continue through the more general scopes up to and including the class symbol table.

## Expressions

    expression:         term (op term)*
    term:               IntegerConstant | StringConstant | keywordConstant:     | VarName |
                        VarName '[' expression ']' | SubroutineCall | '(' expression ')' |
                        UnaryOp term
    subroutineCall:     subroutineName '(' expressionList ')' |
                        ( className | varName ) '.' subroutineName '(' expressionList ')'
    expressionList:     (expression ( ',' expression)* )?
    op:                 '+'|'-'|'*'|'/'|'&'|'|'|'<'|'>'|'='
    unaryOp:            '-'|'~'
    keywordConstant:    'true'|'false'|'null'|'this'

To compile an infix expression using a method `eval()`, if the expression is a:

    number n:           `push _n_`

    variable var:       `push var`
    
    exp1 op exp2:       eval exp1
                        eval exp2
                        output op

    op exp1:            eval exp1
                        output op

    f(exp1, exp2, ...): eval exp1
                        eval exp2
                        ...
                        output call f

## Statements

if(exp1) { statments1 } else { statements2 }

        eval exp1
        negate
        if-goto L1
        eval statements1
        goto L2
    label L1
        eval statements2
    label L2

while(exp1) { statements1 }

    label L1
        eval exp1
        negate
        if-goto L2
        eval statements1
        goto L1
    label L2

## Object creation

When an object is _declared_ (i.e. var Point p), the variable *p* will be stored on the stack. When the _new_ operator is executed to create an instance of the variable, the object will be allocated somewhere in the heap and the starting address will be stored in *p*.

No code is generated when a variable is declared. The symbol table is updated though.

## Object manipulation

When compiling a statement like: `var a = obj1.methodCall(obj2)`, you first must translate the call into a procedural-style call like `methodCall(obj1, obj2)` which makes the *this* the first argument of each call.

    push this // represents obj1
    push obj2
    call methodCall

## Arrays

To compile the statement like: `let arr[exp1] = exp2`

    push arr
    // compute exp1
    add
    // compute exp2
    pop temp 0 // top of stack is base arr addr
    pop pointer 1 // set THAT to base arr addr
    push temp 0 // eval of exp2
    pop that 0

