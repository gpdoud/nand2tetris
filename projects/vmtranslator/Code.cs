using System;
using System.Collections.Generic;

namespace vmtranslator {

    class Code {

        private int lineCnt;
        private Parser parser { get; set; }
        List<string> codeLines = new List<string>();
        public string[] ToAsm() { return codeLines.ToArray(); }
        // pop top 2 from stack; add them; push result to stack
        private void Add() {
            codeLines.AddRange(
                new string[] {
                    $"// pop",
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"// store D in R1",
                    $"@R13",
                    $"M=D",
                    $"// pop",
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"// add to R13",
                    $"@R13",
                    $"M=M+D // add",
                    $"D=M // sav in D",
                    $"// push R13",
                    $"@SP",
                    $"A=M",
                    $"M=D",
                    $"@SP",
                    $"M=M+1"
                }
            );
        }
        // pop top 2 from stack; subtract them; push result to stack
        private void Sub() {
            codeLines.AddRange(
                new string[] {
                    $"// pop",
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"// store D in R1",
                    $"@R13",
                    $"M=D",
                    $"// pop",
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"// add to R13",
                    $"@R13",
                    $"M=D-M // sub",
                    $"D=M // sav in D",
                    $"// push D",
                    $"@SP",
                    $"A=M",
                    $"M=D",
                    $"@SP   // SP++",
                    $"M=M+1"
                }
            );
        }
        // pop top of stack; negate; push result to stack
        private void Neg() {
            codeLines.AddRange(
                new string[] {
                    "// neg (pop, negate, push)",
                    $"@SP",
                    $"M=M-1 // SP--",
                    $"A=M",
                    $"D=M  // sto in D",
                    $"D=!D // negate",
                    $"D=D+1  // add 1",
                    $"M=D   // stor back in SP",
                    $"@SP",
                    $"M=M+1     // SP++",
                }
            );
        }
        // pop 2 from stack; if equal push -1 else push 0 to stack
        private void Eq() {
            codeLines.AddRange(
                new string[] {
                    "// eq (true is 0; false = -1)",
                    "// pop",
                    "@SP   // get the SP",
                    "M=M-1   // ptr to top of stk",
                    "A=M   // ptr to top",
                    "D=M   // sav val in D",
                    "// store D in R1",
                    "@R13 //",
                    "M=D     //",
                    "// pop",
                    "@SP   // get the SP",
                    "M=M-1   // ptr to top of stk",
                    "A=M   // ptr to top",
                    "D=M   // sav val in D",
                    "// 1st pop is in R13, 2nd in D",
                    "@R13",
                    "M=M-D   // if zero; equal",
                    "@R14",
                    "M=0",
                    "D=M",
                    "@R13",
                    "M=M|D   // if zero; true else false",
                    "D=M",
                    "// push onto SP",
                    "@SP",
                    "A=M",
                    "M=D",
                    "@SP",
                    "M=M+1"
                }
            );
        }
        // pop 2 from stack; if 1st > 2nd push -1 else push 0 to stack
        private void Gt() {
            codeLines.AddRange(
                new string[] {
                    "@SP     // addr 0",
                    "M=M-1",
                    "A=M",
                    "D=M",
                    "@R13",
                    "M=D",
                    "@SP",
                    "M=M-1",
                    "A=M",
                    "D=M",
                    "@R14",
                    "M=D",
                    "D=M",
                    "@14",
                    "M=0    // default to false",
                    "@R13",
                    "M=D-M",
                    "D=M",
                    $"@GT{lineCnt}",
                    "D;JGT",
                    $"@FINI{lineCnt}",
                    "0;JMP",
                    $"(GT{lineCnt})",
                    "@R14",
                    "M=-1",
                    $"(FINI{lineCnt})",
                    "@R14",
                    "D=M",
                    "@SP",
                    "A=M",
                    "M=D",
                    "@SP",
                    "M=M+1"
                }
            );
        }
        // pop 2 from stack; if 1st < 2nd push -1 else push 0 to stack
        private void Lt() {
            codeLines.AddRange(
                new string[] {
                    "@SP     // addr 0",
                    "M=M-1",
                    "A=M",
                    "D=M",
                    "@R13",
                    "M=D",
                    "@SP",
                    "M=M-1",
                    "A=M",
                    "D=M",
                    "@R14",
                    "M=D",
                    "D=M",
                    "@14",
                    "M=0    // default to false",
                    "@R13",
                    "M=D-M",
                    "D=M",
                    $"@LT{lineCnt}",
                    "D;JLT",
                    $"@FINI{lineCnt}",
                    "0;JMP",
                    $"(LT{lineCnt})",
                    "@R14",
                    "M=-1",
                    $"(FINI{lineCnt})",
                    "@R14",
                    "D=M",
                    "@SP",
                    "A=M",
                    "M=D",
                    "@SP",
                    "M=M+1"                }
            );
        }
        // pop top 2 from stack; AND them; push result to stack
        private void And() {
            codeLines.AddRange(
                new string[] {
                    "@SP     // addr 0",
                    "M=M-1",
                    "A=M",
                    "D=M     // pop in D",
                    "@R13",
                    "M=D     // sto D in R13",
                    "@SP",
                    "M=M-1",
                    "A=M",
                    "D=M&D     // pop in D",
                    "@SP",
                    "A=M",
                    "M=D      // push D",
                    "@SP",
                    "M=M+1"
                }
            );
        }
        // pop top 2 from stack; OR them; push result to stack
        private void Or() {
            codeLines.AddRange(
                new string[] {
                    "@SP     // addr 0",
                    "M=M-1",
                    "A=M",
                    "D=M     // pop in D",
                    "@R13",
                    "M=D     // sto D in R13",
                    "@SP",
                    "M=M-1",
                    "A=M",
                    "D=M|D     // pop in D",
                    "@SP",
                    "A=M",
                    "M=D      // push D",
                    "@SP",
                    "M=M+1"                
                }
            );
        }
        // pop top of stack; NOT; push result to stack
        private void Not() {
            codeLines.AddRange(
                new string[] {
                    "@SP     // addr 0",
                    "M=M-1",
                    "A=M",
                    "D=M     // pop in D",
                    "D=!D    // NOT",
                    "D=D+1   // 2's complement",
                    "@SP",
                    "A=M",
                    "M=D      // push D",
                    "@SP",
                    "M=M+1"  
                }
            );
        }
        // push local *n* value onto stack
        private void PushLocal() {
            codeLines.AddRange(
                new string[] {
                    $"@{parser.Nbr} // @nbr",
                    "D=A  // store nbr in D",
                    "@1  // @LCL",
                    "A=M+D  // set ptr to new A",
                    "D=M  // sav local nbr to D",
                    "@SP",
                    "A=M  // addr of top",
                    "M=D  // push nbr",
                    "@SP",
                    "M=M+1"
                }
            );
        }
        // push constant value onto stack
        private void PushConstant() {
            // @nbr
            codeLines.AddRange(
                new string[] {
                    $"@{parser.Nbr} // @nbr",
                    $"D=A  // store nbr in D",
                    $"@SP  // addr SP",
                    $"A=M  // set ptr to new A",
                    $"M=D  // store nbr in A",
                    $"@SP  // addr SP",
                    $"M=M+1  // inc SP"
                }
            );
        }
        // push static (R16) *n* value onto stack
        private void PushStatic() {
            codeLines.AddRange(
                new string[] {
                    $"@{parser.Nbr} // @nbr",
                    "D=A  // store nbr in D",
                    "@16  // @STATIC",
                    "A=A+D  // set ptr to new A",
                    "D=M  // sav local nbr to D",
                    "@SP",
                    "A=M  // addr of top",
                    "M=D  // push nbr",
                    "@SP",
                    "M=M+1"
                }
            );
        }
        // Push temp reg to stack
        private void PushTemp() {
            var tempReg = 5 + parser.Nbr;
            codeLines.AddRange(
                new string[] {
                    $"@{tempReg}            // temp reg",
                    $"A=A+D          // ptr to temp reg",
                    $"D=M            // sto temp reg in D",
                    $"@SP            // SP",
                    $"A=M            // ptr to SP",
                    $"M=D            // sto temp in stack",
                    $"@SP            // stack ptr",
                    $"M=M+1          // SP++"
                }
            );
        }
        // Push this *n* on the stack :: this = R3
        private void PushThis() {
            codeLines.AddRange(
                new string[] {
                    $"// push this {parser.Nbr}",
                    $"@{parser.Nbr}",
                    "D=A",
                    "@R3 // @THIS",
                    "A=D+M",
                    "D=M  // stor val in D",
                    "@SP  // SP",
                    "A=M",
                    "M=D  // stor D on stack",
                    "@SP",
                    "M=M+1  // SP++"
                }
            );
        }
        // Push that *n* on the stack :: that = R4
        private void PushThat() {
            codeLines.AddRange(
                new string[] {
                    $"// push that {parser.Nbr}",
                    $"@{parser.Nbr}",
                    "D=A",
                    "@R4 // @THAT",
                    "A=D+M",
                    "D=M  // stor val in D",
                    "@SP  // SP",
                    "A=M",
                    "M=D  // stor D on stack",
                    "@SP",
                    "M=M+1  // SP++"
                }
            );
        }
        private void PopLocal() {
            var regOffset = parser.Nbr;
            codeLines.AddRange(
                new string[] {
                    $"// *** pop local {regOffset} ***",
                    $"@{regOffset}      // local offset",
                    $"D=A     // store offset in D",
                    $"@1      // @LCL (local 0)",
                    $"A=M+D   // local 1",
                    $"D=A     // D pts to local 1",
                    $"@R13",
                    $"M=D",
                    $"// pop from stack",
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"// store D in R1",
                    $"@R13",
                    $"A=M",
                    $"M=D"
                }
            );
        }
        // Pop off the stack and store on constant
        private void PopConstant() {
            var regOffset = parser.Nbr;
            codeLines.AddRange(
                new string[] {
                    $"// pop constant {parser.Nbr} - NOT VALID "
                }
            );
        }
        // Pop off the stack and store on static
        private void PopStatic() {
            var regOffset = parser.Nbr;
            codeLines.AddRange(
                new string[] {
                    "// pop static 3 (pop from sp & stor in static (R16) + n)",
                    "@SP",
                    "M=M-1",
                    "A=M  // addr of top",
                    "D=M  // save to D",
                    "@R13 // temp",
                    "M=D",
                    $"@{parser.Nbr}",
                    "D=A",
                    "@R16 // @STATIC 0",
                    "D=A+D  // D pts to addr static n",
                    "@R14",
                    "M=D     // pts to addr static n",
                    "@R13",
                    "D=M",
                    "@R14",
                    "A=M",
                    "M=D"
                }
            );
        }
        // Pop off the stack and store in temp
        private void PopTemp() {
            var tempReg = 5 + parser.Nbr;
            codeLines.AddRange(
                new string[] {
                    $"@R5       // R5 is Temp",
                    $"D=A       // sav in D",
                    $"@R13      // R13 is temp reg",
                    $"M=D       // stor R5 in R13",
                    $"@{parser.Nbr}        // temp 2",
                    $"D=A       // stor nbr in D",
                    $"@R13      // switch to R13",
                    $"M=M+D     // R13 points to temp n",
                    $"@SP       // pop from stack",
                    $"M=M-1     // dec SP to pt to top",
                    $"A=M       // addr top SP",
                    $"D=M       // stor val in D",
                    $"@R13      // switch to R13",
                    $"A=M       // get R13 addr",
                    $"M=D       // stor D in temp n"
                }
            );
        }
        // Pop this *n* on the stack :: this = R3
        private void PopThis() {
            codeLines.AddRange(
                new string[] {
                    $"// pop this {parser.Nbr}",
                    "@SP  // SP",
                    "M=M-1",
                    "A=M",
                    "D=M",
                    "@R13    // contains popped value",
                    "M=D",
                   $"@{parser.Nbr}",
                    "D=A",
                    "@R3 // @THIS",
                    "A=D+M",
                    "D=A  // D is addr of this 1",
                    "@R14  // addr of this 1",
                    "M=D",
                    "@R13",
                    "D=M",
                    "@R14",
                    "A=M",
                    "M=D"
                }
            );
        }
        // Pop that *n* on the stack :: that = R4
        private void PopThat() {
            codeLines.AddRange(
                new string[] {
                    $"// pop that {parser.Nbr}",
                    "@SP  // SP",
                    "M=M-1",
                    "A=M",
                    "D=M",
                    "@R13    // contains popped value",
                    "M=D",
                   $"@{parser.Nbr}",
                    "D=A",
                    "@R4 // @THAt",
                    "A=D+M",
                    "D=A  // D is addr of this 1",
                    "@R14  // addr of this 1",
                    "M=D",
                    "@R13",
                    "D=M",
                    "@R14",
                    "A=M",
                    "M=D"
                }
            );
        }
        private void Generate() {
            codeLines.Add($"// {parser.Line}"); // change vm code into comment
            switch (parser.Type) {
                case LineType.Add:                  Add();              break;
                case LineType.Sub:                  Sub();              break;
                case LineType.Neg:                  Neg();              break;
                case LineType.Eq:                   Eq();               break;
                case LineType.Gt:                   Gt();               break;
                case LineType.Lt:                   Lt();               break;
                case LineType.And:                  And();              break;
                case LineType.Or:                   Or();               break;
                case LineType.Not:                  Not();              break;

                case LineType.Push: // push segment nbr
                    switch (parser.Segment) {
                        case SegmentType.Local:     PushLocal();        break;
                        case SegmentType.Constant:  PushConstant();     break;
                        case SegmentType.Static:    PushStatic();       break;
                        case SegmentType.Temp:      PushTemp();         break;
                        case SegmentType.This:      PushThis();         break;
                        case SegmentType.That:      PushThat();         break;
                    }
                    break;
                    
                case LineType.Pop: // pop segment nbr
                    switch(parser.Segment) {
                        case SegmentType.Local:     PopLocal();         break;
                        case SegmentType.Constant:  PopConstant();      break;
                        case SegmentType.Static:    PopStatic();        break;
                        case SegmentType.Temp:      PopTemp();          break;
                        case SegmentType.This:      PopThis();          break;
                        case SegmentType.That:      PopThat();          break;
                    }
                    break;
            }
        }

        public Code(Parser parser, int lineCnt) {
            this.lineCnt = lineCnt;
            this.parser = parser;
            Generate();
        }
    }
}