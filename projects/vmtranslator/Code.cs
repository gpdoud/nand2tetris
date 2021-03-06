using System;
using System.Collections.Generic;

namespace vmtranslator {

    class Code {

        static string functionName;

        static bool isSetup = false;
        private int lineCnt;
        private Parser parser { get; set; }
        List<string> codeLines = new List<string>();
        public string[] ToAsm() { return codeLines.ToArray(); }
        private void Setup() {
            codeLines.AddRange(
                new string[] {
                    "// Bootstrap code",
                    "@256 // Set SP=256",
                    "D=A",
                    "@0",
                    "M=D",
                    "@Sys.init$BEGIN // call Sys.init (doesn't return)",
                    "0;JMP"
                }
            );
        }
        // pop top 2 from stack; add them; push result to stack
        private void Add() {
            codeLines.AddRange(
                new string[] {
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"@R13",
                    $"M=D",
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"@R13",
                    $"M=M+D // add",
                    $"D=M // sav in D",
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
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"@R13",
                    $"M=D",
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"@R13",
                    $"D=D-M // sav to D",
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
                    "@SP   // get the SP",
                    "M=M-1  // ptr to top of stk",
                    "A=M   // ptr to top",
                    "D=M   // sav val in D",
                    "@R13",
                    "M=D  // sto in R13",
                    "@SP",
                    "M=M-1   // SP--",
                    "A=M   // *SP",
                    "D=M   // sav val in D",
                    "@R13",
                    "D=M-D   // if zero; equal",
                   $"@EQ{lineCnt}",
                    "D;JEQ  // jmp if zero",
                    "D=0   // else set to false",
                   $"@FINI{lineCnt}",
                    "0;JMP  // go to end",
                   $"(EQ{lineCnt})",
                    "D=-1  // equal; set to true",
                   $"(FINI{lineCnt})",
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
        // set a label
        private void Label() {
            codeLines.AddRange(
                new string[] {
                    $"({parser.Filename}${parser.Label})"
                }
            );
        }
        // set a label
        private void GoTo() {
            codeLines.AddRange(
                new string[] {
                    $"@{parser.Filename}${parser.Label}",
                    "0;JMP"
                }
            );
        }
        // set a label
        private void IfGoTo() {
            codeLines.AddRange(
                new string[] {
                    "@SP",
                    "M=M-1",
                    "A=M",
                    "D=M",
                    $"@{parser.Filename}${parser.Label}",
                    "D;JNE"
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
                    "@SP",
                    "A=M",
                    "M=D      // push D",
                    "@SP",
                    "M=M+1"  
                }
            );
        }
        // push argument *n* value onto stack
        private void PushArgument() {
            codeLines.AddRange(
                new string[] {
                    $"@{parser.Nbr} // @nbr",
                    "D=A  // store nbr in D",
                    "@2  // @ARG",
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
        private void PushConstant(int n = 0) {
            // @nbr
            codeLines.AddRange(
                new string[] {
                    $"@{n} // Push Constant {n}",
                    $"D=A  // store nbr in D",
                    $"@SP  // addr SP",
                    $"A=M  // set ptr to new A",
                    $"M=D  // store nbr in A",
                    $"@SP  // addr SP",
                    $"M=M+1  // inc SP"
                }
            );
        }
        // push pointer 0|1 onto stack
        private void PushPointer() {
            // 0 = this addr[3], 1 = that addr[4]
            var thisthat = parser.Nbr + 3;
            codeLines.AddRange(
                new string[] {
                   $"// {parser.Line}",
                   $"@{thisthat}  // 0 = this, 1 = that",
                    "D=M  // sav to D",
                    "@SP  // @SP",
                    "A=M  // deref",
                    "M=D  // sto D to SP",
                    "@SP",
                    "M=M+1"
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
            codeLines.AddRange(
                new string[] {
                    $"@{parser.Nbr}  // temp reg",
                    "D=A  // store nbr in D",
                    "@R5  // addr SP",
                    "A=A+D  // set ptr to new A",
                    "D=M  // store nbr in D",
                    "@SP",
                    "A=M",
                    "M=D",
                    "@SP",
                    "M=M+1"
                }
            );
        }
        // Push this *n* on the stack :: this = R3
        private void PushThis() {
            codeLines.AddRange(
                new string[] {
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
        // pop argument n
        private void PopArgument() {
            var regOffset = parser.Nbr;
            codeLines.AddRange(
                new string[] {
                    $"@{regOffset}      // local offset",
                    $"D=A     // store offset in D",
                    $"@2      // @ARG",
                    $"A=M+D   // offset to arg n",
                    $"D=A     // D pts to arg n",
                    $"@R13",
                    $"M=D",
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"@R13",
                    $"A=M",
                    $"M=D"
                }
            );
        }
        // pop local n
        private void PopLocal(int n = 0) {
            var regOffset = parser.Nbr;
            codeLines.AddRange(
                new string[] {
                    $"@{n}    // Pop Local {n}",
                    $"D=A     // store offset in D",
                    $"@1      // @LCL",
                    $"A=M+D   // offset to arg n",
                    $"D=A     // D pts to arg n",
                    $"@R13",
                    $"M=D",
                    $"@SP   // get the SP",
                    $"M=M-1   // ptr to top of stk",
                    $"A=M   // ptr to top",
                    $"D=M   // sav val in D",
                    $"@R13",
                    $"A=M",
                    $"M=D"
                }
            );
        }
        // push pointer 0|1 onto stack
        private void PopPointer() {
            // 0 = this addr[3], 1 = that addr[4]
            var thisthat = parser.Nbr + 3;
            codeLines.AddRange(
                new string[] {
                   $"// {parser.Line}",
                    "@SP",
                    "M=M-1",
                    "A=M",
                    "D=M",
                   $"@{thisthat}  // 0 = this, 1 = that",
                    "M=D  // sav to this/that"
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
            codeLines.Add($"// VM:{parser.Line}, CNT:{lineCnt}"); // change vm code into comment
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
                        case SegmentType.Argument:  PushArgument();                 break;
                        case SegmentType.Constant:  PushConstant(parser.Nbr);       break;
                        case SegmentType.Local:     PushLocal();                    break;
                        case SegmentType.Pointer:   PushPointer();                  break;
                        case SegmentType.Static:    PushStatic();                   break;
                        case SegmentType.Temp:      PushTemp();                     break;
                        case SegmentType.That:      PushThat();                     break;
                        case SegmentType.This:      PushThis();                     break;
                    }
                    break;
                    
                case LineType.Pop: // pop segment nbr
                    switch(parser.Segment) {
                        case SegmentType.Argument:  PopArgument();                  break;
                        case SegmentType.Constant:  PopConstant();                  break;
                        case SegmentType.Local:     PopLocal(parser.Nbr);           break;
                        case SegmentType.Pointer:   PopPointer();                   break;
                        case SegmentType.Static:    PopStatic();                    break;
                        case SegmentType.Temp:      PopTemp();                      break;
                        case SegmentType.That:      PopThat();                      break;
                        case SegmentType.This:      PopThis();                      break;
                    }
                    break;

                case LineType.Label:                Label();            break;
                case LineType.GoTo:                 GoTo();             break;
                case LineType.IfGoTo:               IfGoTo();           break;

                case LineType.Function:             Function();         break;
                case LineType.Call:                 Call();             break;
                case LineType.Return:               Return();           break;
            }
        }

        private void Function() {
            functionName = parser.FunctionName;
            codeLines.AddRange(
                new string[] {
                    $"({parser.FunctionName}$BEGIN) // Function {parser.FunctionName}"
                }
            );
            var nbrLclVars = parser.Nbr;
            for(var idx = 0; idx < nbrLclVars; idx++) {
                PushConstant(0);
                // PopLocal(idx);
            }
        }

        private void Call() {
            codeLines.AddRange(
                new string[] {
                    $"@{parser.FunctionName}$RETURN",
                     "D=A // save return addr",
                     "@SP",
                     "A=M",
                     "M=D",
                     "@SP",
                     "M=M+1",
                     "@1 // LCL addr",
                     "D=M",
                     "// push LCL onto stack",
                     "@SP",
                     "A=M",
                     "M=D",
                     "@SP",
                     "M=M+1",
                     "@2 // ARG addr",
                     "D=M",
                     "// push ARG onto stack",
                     "@SP",
                     "A=M",
                     "M=D",
                     "@SP",
                     "M=M+1",
                     "@3 // THIS addr",
                     "D=M",
                     "// push THIS onto stack",
                     "@SP",
                     "A=M",
                     "M=D",
                     "@SP",
                     "M=M+1",
                     "@4 // THAT addr",
                     "D=M",
                     "// push THAT onto stack",
                     "@SP",
                     "A=M",
                     "M=D",
                     "@SP",
                     "M=M+1",
                     "@SP // set ARG to 1st arg on stack: ARG = SP - 5 - N",
                     "D=M",
                     "@5",
                     "D=D-A",
                    $"@{parser.Nbr}",
                     "D=D-A",
                     "@2 // ARG",
                     "M=D",
                     "@SP // set LCL = SP",
                     "D=M",
                     "@1",
                     "M=D",
                    $"@{parser.FunctionName}$BEGIN // Call {parser.FunctionName} {parser.Nbr}",
                     "0;JMP // jump to function",
                    $"({parser.FunctionName}$RETURN) // location to return"
                }
            );
        }

        private void Return() {
            codeLines.AddRange(
                new string[] {
                    "@1 // save endframe (LCL) to R13",
                    $"D=M",
                    $"@R13",
                    $"M=D",
                    $"@5 // get return addr to R14 : LCL - 5",
                    $"D=A",
                    $"@1",
                    $"A=M-D",
                    $"D=M",
                    $"@R14",
                    $"M=D",
                    $"@SP // pop SP (return value) to store in ARG 0",
                    $"M=M-1",
                    $"A=M",
                    $"D=M",
                    $"@2",
                    $"A=M",
                    $"M=D",
                    $"@2 // set SP to ARG 1",
                    $"D=M+1",
                    $"@SP",
                    $"M=D",
                    $"@R13 // reset THAT, THIS, ARG, LCL (endframe - 1, 2, 3, 4)",
                    $"M=M-1",
                    $"A=M",
                    $"D=M",
                    $"@4 // THAT",
                    $"M=D",
                    $"@R13",
                    $"M=M-1",
                    $"A=M",
                    $"D=M",
                    $"@3 // THIS",
                    $"M=D",
                    $"@R13",
                    $"M=M-1",
                    $"A=M",
                    $"D=M",
                    $"@2 // ARG",
                    $"M=D",
                    $"@R13",
                    $"M=M-1",
                    $"A=M",
                    $"D=M",
                    $"@1 // LCL",
                    $"M=D",
                    $"@R14 // jump to return addr",
                    $"A=M",
                    $"0;JMP",
                    $"@{parser.FunctionName}$RETURN // place to return",
                    "0;JMP"
                }
            );
        }

        public Code(Parser parser, int lineCnt) {
            this.lineCnt = lineCnt;
            this.parser = parser;
            if(!isSetup) {
                Setup();
                isSetup = true;
            }
            Generate();
        }
    }
}