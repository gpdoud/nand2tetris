# Nand to Tetris

This is the project for the Coursera course of the same name. There is a web site at http://nand2tetris.org where more information is.

The course is broken down into two sections. The first section is about building a computer called Hack by building the hardware components in software.

## Week 1 - 

In this first week, students are required to build the low level logic gates (i.e. and, or, not, etc.) that are the building blocks for a computer chip. The 'chips' are built using a Hardware Descriptor Language (HDL) that simulates the operation of a chip. The HDL code for each chip is run in a Hardware Simulator using a test script to verify that the chip works properly. The chips to be build in this week are:

### And
Logical and - result 1 if both inputs are 1

```
Truth table - And
a b And
0 0  0
0 1  0
1 0  0
1 1  1
```

### And16
Logical and - 16 bit inputs and outputs

```
Truth table - And16
a                b                And16
0000000000000000 0000000000000000 0000000000000000
0000000000000000 0000000000000001 0000000000000000
0000000000000001 0000000000000000 0000000000000000
0000000000000001 0000000000000001 0000000000000001
...
1111111111111111 1111111111111111 1111111111111111
```

### DMux
Two input in, sel, output a if sel 0 else output b

### DMux4Way

### DMux8Way

### Mux
Three inputs a, b, sel output is a if sel 0 else b

### Mux4Way16
Five inputs a, b, c, d, sel[2] ouptput a if sel 0, b if sel 1, c if sel 2, else d

### Mux8Way16
Nine inputs a, b, c, d, e, f, g, h, sel[3] output is a if sel 0, b if sel 1, c if sel 2, d if sel 3, e if sel 4, f if sel 5, g if sel 6, else h

### Mux16

### Not
output is !input

### Not16
16 bit Not

### Or
inputs a, b output is 1 if a is 1 or b is 1

### Or8Way
8 bit input output 1 if any bit is 1

### Or16
16 bit Or

### Xor
input a, b output is 1 if either a or b is 1 but not both
