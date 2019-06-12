using System;
using System.Text;
namespace HackAssembler {
    class Parser {

        public bool IsAInst { get; set; } = false;
        public bool IsAAddr { get; set; } = false;
        public bool IsASymb { get; set; } = false;
        public string Line { get; set; } = null;
        public string Addr { get; set; } = null;
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
                    Addr = Line.Substring(1);
                } else {
                    IsASymb = true;
                    Symb = Line.Substring(1);
                }
                return;
            }
            // otherwise a C instruction
            var parts = Line.Split("=;");
            Dest = parts[0];
            Comp = parts[1];
            Jump = parts[2];
        }

        public Parser(string Line) {
            this.Line = Line;
            Parse();
        }
    }
}