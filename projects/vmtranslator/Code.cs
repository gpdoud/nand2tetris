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
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"@{tempReg}     // idx to temp",
                    $"M=D   // sav D to temp reg"
                }
            );
        }
        private void Generate() {
            codeLines.Add($"// {parser.Line}"); // change vm code into comment
            switch (parser.Type) {
                case LineType.Add:                  Add();              break;

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