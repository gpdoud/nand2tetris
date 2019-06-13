using System;
using System.IO;
using System.Collections.Generic;

namespace HackAssembler
{
    class Program
    {
        string ParseCommandLine(string[] args) {
            if(args.Length == 0) {
                throw new ArgumentException("HackAssembler requires input file name.");
            }
            return args[0];
        }
        string CreateHackFilename(string asmFilename) {
            var len = asmFilename.IndexOf('.');
            var hackFilename = $"{asmFilename.Substring(0, len)}.hack";
            return hackFilename;
        }
        void Run(string[] args)
        {
            var asmFilename = ParseCommandLine(args);
            var hackFilename = CreateHackFilename(asmFilename);
            var hackLines = new List<string>();

            var src = new Source(asmFilename);
            src.Read();
            while(src.Next()) { 
                Code code = null;
                var parser = new Parser(src.Line);
                if(!parser.IsAInst) { // Is a C instruction
                    code = new Code(parser.Comp, parser.Dest, parser.Jump);
                } else if (parser.IsAAddr) {
                    code = new Code(parser.Addr);
                } else if (parser.IsASymb) {
                    code = new Code(parser.Symb);
                }
                var hack = code.ToHack();
                hackLines.Add($"{hack}");
                Console.WriteLine(hack);
            }
            File.WriteAllLines(hackFilename, hackLines);
            
        }
        static void Main(string[] args)
        {
            (new Program()).Run(args);
        }
    }
}
