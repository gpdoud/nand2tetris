using System;
using System.Collections.Generic;

namespace vmtranslator {

    class Code {

        private Parser parser { get; set; }
        List<string> codeLines = new List<string>();
        public string[] ToAsm() { return codeLines.ToArray(); }

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
        private void Gt() {
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
                    "M=M-D   // if R13 > 0 then true else false",
                    "@32767  // set to chk negative bit",
                    
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
                    "M=M+1"                }
            );
        }
        private void Lt() {
            codeLines.AddRange(
                new string[] {

                }
            );
        }
        private void And() {
            codeLines.AddRange(
                new string[] {

                }
            );
        }
        private void Or() {
            codeLines.AddRange(
                new string[] {

                }
            );
        }
        private void Not() {
            codeLines.AddRange(
                new string[] {

                }
            );
        }
        private void PushLocal() {
            // @nbr
            codeLines.AddRange(
                new string[] {
                }
            );
        }
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
        private void PushStatic() {
            // @nbr
            codeLines.AddRange(
                new string[] {
                }
            );
        }
        // Push temp reg to stack
        private void PushTemp() {
            // @nbr
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
        // Pop off the stack and store on local
        private void PopLocal() {
            var regOffset = parser.Nbr;
            codeLines.AddRange(
                new string[] {
                    $"// *** pop local {regOffset} ***",
                    $"// stor R13 in local 1",
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
        // Pop off the stack and store on costant
        private void PopConstant() {
            var regOffset = parser.Nbr;
            codeLines.AddRange(
                new string[] {
                }
            );
        }
        // Pop off the stack and store on static
        private void PopStatic() {
            var regOffset = parser.Nbr;
            codeLines.AddRange(
                new string[] {
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
                    }
                    break;
                    
                case LineType.Pop: // pop segment nbr
                    switch(parser.Segment) {
                        case SegmentType.Local:     PopLocal();         break;
                        case SegmentType.Constant:  PopConstant();      break;
                        case SegmentType.Static:    PopStatic();        break;
                        case SegmentType.Temp:      PopTemp();          break;
                    }
                    break;
            }

        }

        public Code(Parser parser) {
            this.parser = parser;
            Generate();
        }
    }
}