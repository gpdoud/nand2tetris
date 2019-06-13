using System;
using System.Text;
using System.Collections.Generic;
namespace HackAssembler {
    public enum InstructionType { A_REGISTER, A_SYMBOL, C };
    public class Code {

        IDictionary<string, CompTable> compTable = new Dictionary<string, CompTable> () {
            ["0"]       = new CompTable { comp = "0", a = '0', c1 = '1', c2 = '0', c3 = '1', c4 = '0', c5 = '1', c6 = '0'},
            ["1"]       = new CompTable { comp = "1", a = '0', c1 = '1', c2 = '1', c3 = '1', c4 = '1', c5 = '1', c6 = '1'},
            ["-1"]      = new CompTable { comp = "-1", a = '0', c1 = '1', c2 = '1', c3 = '1', c4 = '0', c5 = '1', c6 = '0'},
            ["D"]       = new CompTable { comp = "D", a = '0', c1 = '0', c2 = '0', c3 = '1', c4 = '1', c5 = '0', c6 = '0'},
            ["A"]       = new CompTable { comp = "A", a = '0', c1 = '1', c2 = '1', c3 = '0', c4 = '0', c5 = '0', c6 = '0'},
            ["!D"]       = new CompTable { comp = "!D", a = '0', c1 = '0', c2 = '0', c3 = '1', c4 = '1', c5 = '0', c6 = '1'},
            ["!A"]       = new CompTable { comp = "!A", a = '0', c1 = '1', c2 = '1', c3 = '0', c4 = '0', c5 = '0', c6 = '1'},
            ["-D"]       = new CompTable { comp = "-D", a = '0', c1 = '0', c2 = '0', c3 = '1', c4 = '1', c5 = '1', c6 = '1'},
            ["-A"]       = new CompTable { comp = "-A", a = '0', c1 = '1', c2 = '1', c3 = '0', c4 = '0', c5 = '1', c6 = '1'},
            ["D+1"]       = new CompTable { comp = "D+1", a = '0', c1 = '0', c2 = '1', c3 = '1', c4 = '1', c5 = '1', c6 = '1'},
            ["A+1"]       = new CompTable { comp = "A+1", a = '0', c1 = '1', c2 = '1', c3 = '0', c4 = '1', c5 = '1', c6 = '1'},
            ["D-1"]       = new CompTable { comp = "D-1", a = '0', c1 = '0', c2 = '0', c3 = '1', c4 = '1', c5 = '1', c6 = '0'},
            ["A-1"]       = new CompTable { comp = "A-1", a = '0', c1 = '1', c2 = '1', c3 = '0', c4 = '0', c5 = '1', c6 = '0'},
            ["D+A"]       = new CompTable { comp = "D+A", a = '0', c1 = '0', c2 = '0', c3 = '0', c4 = '0', c5 = '1', c6 = '0'},
            ["D-A"]       = new CompTable { comp = "D-A", a = '0', c1 = '0', c2 = '1', c3 = '0', c4 = '0', c5 = '1', c6 = '1'},
            ["A-D"]       = new CompTable { comp = "A-D", a = '0', c1 = '0', c2 = '0', c3 = '0', c4 = '1', c5 = '1', c6 = '1'},
            ["D&A"]       = new CompTable { comp = "D&A", a = '0', c1 = '0', c2 = '0', c3 = '0', c4 = '0', c5 = '0', c6 = '0'},
            ["D|A"]       = new CompTable { comp = "D|A", a = '0', c1 = '0', c2 = '1', c3 = '0', c4 = '1', c5 = '0', c6 = '1'},


            ["M"]       = new CompTable { comp = "M", a = '1', c1 = '1', c2 = '1', c3 = '0', c4 = '0', c5 = '0', c6 = '0'},
            ["!M"]       = new CompTable { comp = "!M", a = '1', c1 = '1', c2 = '1', c3 = '0', c4 = '0', c5 = '0', c6 = '1'},
            ["-M"]       = new CompTable { comp = "-M", a = '1', c1 = '1', c2 = '1', c3 = '0', c4 = '0', c5 = '1', c6 = '1'},
            ["M+1"]       = new CompTable { comp = "M+1", a = '1', c1 = '1', c2 = '1', c3 = '0', c4 = '1', c5 = '1', c6 = '1'},
            ["M-1"]       = new CompTable { comp = "M-1", a = '1', c1 = '1', c2 = '1', c3 = '0', c4 = '0', c5 = '1', c6 = '0'},
            ["D+M"]       = new CompTable { comp = "D+M", a = '1', c1 = '0', c2 = '0', c3 = '0', c4 = '0', c5 = '1', c6 = '0'},
            ["D-M"]       = new CompTable { comp = "D-M", a = '1', c1 = '0', c2 = '1', c3 = '0', c4 = '0', c5 = '1', c6 = '1'},
            ["M-D"]       = new CompTable { comp = "M-D", a = '1', c1 = '0', c2 = '0', c3 = '0', c4 = '1', c5 = '1', c6 = '1'},
            ["D&M"]       = new CompTable { comp = "D&M", a = '1', c1 = '0', c2 = '0', c3 = '0', c4 = '0', c5 = '0', c6 = '0'},
            ["D|M"]     = new CompTable { comp = "D|M", a = '1', c1 = '0', c2 = '1', c3 = '0', c4 = '1', c5 = '0', c6 = '1'}
        };

        IDictionary<string, DestTable> destTable = new Dictionary<string, DestTable> () {
            ["null"]    = new DestTable("null", '0', '0', '0'),
            ["M"]       = new DestTable("M", '0', '0', '1'),
            ["D"]       = new DestTable("D", '0', '1', '0'),
            ["MD"]       = new DestTable("MD", '0', '1', '1'),
            ["A"]       = new DestTable("A", '1', '0', '0'),
            ["AM"]       = new DestTable("AM", '1', '0', '1'),
            ["AD"]       = new DestTable("AD", '1', '1', '0'),
            ["AMD"]       = new DestTable("AMD", '1', '1', '1')
        };

        IDictionary<string, JumpTable> jumpTable = new Dictionary<string, JumpTable> () {
            ["null"] =  new JumpTable("null", '0', '0', '0'),
            ["JGT"]  =  new JumpTable("JGT", '0', '0', '1'),
            ["JEQ"]  =  new JumpTable("JEQ", '0', '1', '0'),
            ["JGE"]  =  new JumpTable("JGE", '0', '1', '1'),
            ["JLT"]  =  new JumpTable("JLT", '1', '0', '0'),
            ["JNE"]  =  new JumpTable("JNE", '1', '0', '1'),
            ["JLE"]  =  new JumpTable("JLE", '1', '1', '0'),
            ["JMP"]  =  new JumpTable("JMP", '1', '1', '1')
        };

        public string ToHack() {
            switch(this.instructionType) {
                case InstructionType.A_REGISTER:
                    return GenerateAInstruction(this.addr);
                case InstructionType.A_SYMBOL: 
                    return GenerateAInstruction(this.symb);
                case InstructionType.C: 
                    return GenerateCInstruction(this.comp, this.dest, this.jump);
            }
            return "Invalid instruction type";
        }
        string GenerateAInstruction(int address) {
            var hack = ConvertToBinary(address);
            return hack;
        }
        string GenerateAInstruction(string symbol) {
            return symbol;
        }
        string GenerateCInstruction(string comp, string dest, string jump) {
            var hack = new StringBuilder("111"); // all C-inst start this way
            var compStr = compTable[comp].ToHack();
            hack.Append(compStr);
            var destStr = destTable[dest].ToHack();
            hack.Append(destStr);
            var jumpStr = jumpTable[jump].ToHack();
            hack.Append(jumpStr);
            return hack.ToString();
        }
        string ConvertToBinary(int i) {
            var str = new StringBuilder("0");
            str.Append(((i & 0b0100_0000_0000_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0010_0000_0000_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0001_0000_0000_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_1000_0000_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0100_0000_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0010_0000_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0001_0000_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0000_1000_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0000_0100_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0000_0010_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0000_0001_0000) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0000_0000_1000) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0000_0000_0100) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0000_0000_0010) != 0) ? "1" : "0");
            str.Append(((i & 0b0000_0000_0000_0001) != 0) ? "1" : "0");
            return str.ToString();
        }

        int addr;
        string symb;
        string comp; 
        string dest; 
        string jump;
        InstructionType instructionType;

        public Code(int addr) {
            this.addr = addr;
            this.instructionType = InstructionType.A_REGISTER;
        }
        public Code(string symb) {
            this.symb = symb;
            this.instructionType = InstructionType.A_SYMBOL;
        }
        public Code(string comp, string dest, string jump) {
            this.comp = comp;
            this.dest = dest;
            this.jump = jump;
            this.instructionType = InstructionType.C;
        }

    }
}