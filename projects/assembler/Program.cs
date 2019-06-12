using System;

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
        void Run(string[] args)
        {
            var fileToParse = ParseCommandLine(args);
            var src = new Source(fileToParse);
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
            }
        }
        static void Main(string[] args)
        {
            (new Program()).Run(args);
        }
    }
}
