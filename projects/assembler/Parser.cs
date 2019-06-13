using System;
using System.Text;
namespace HackAssembler {
    class Parser {

        public bool IsAInst { get; set; } = false;
        public bool IsAAddr { get; set; } = false;
        public bool IsASymb { get; set; } = false;
        public string Line { get; set; } = null;
        public int Addr { get; set; } = -1;
        public string Symb { get; set; } = null;
        public string Comp { get; set; } = null;
        public string Dest { get; set; } = null;
        public string Jump { get; set; } = null;

        void Parse() {
            IsAInst = false;
            // if Line[0] is @ then A Instruction
            if(Line[0] == '@') {
                IsAInst = true;
                if( char.IsDigit(Line[1]) ) {
                    IsAAddr = true;
                    Addr = int.Parse(Line.Substring(1));
                } else {
                    IsASymb = true;
                    Symb = Line.Substring(1);
                }
                return;
            }
            // otherwise a C instruction (both = and ; are optional)
            // M=D | M=D;JEQ | 0;JMP 
            var hasEqual = Line.Contains('=');
            var hasSemicolon = Line.Contains(';');
            var parts = Line.Split(new char[] { '=', ';' });
            if(hasEqual && hasSemicolon) { // M=D;JEQ 
                Dest = parts[0];
                Comp = parts[1];
                Jump = parts[2];
            } else if(hasEqual) { // M=D
                Dest = parts[0];
                Comp = parts[1];
                Jump = "null";
            } else { // 0;JMP
                Dest = "null";
                Comp = parts[0];
                Jump = parts[1];
            }
        }

        public Parser(string Line) {
            this.Line = Line;
            Parse();
        }
    }
}