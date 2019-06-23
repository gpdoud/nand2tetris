using System;
using System.Collections.Generic;

namespace vmtranslator {

    class Program {

        string inFilename = null;
        string outFilename = null;

        void Run(string[] args) {
            if(args.Length > 0) { inFilename = args[0]; }
            outFilename = inFilename.Substring(0, inFilename.LastIndexOf('.')) + ".asm";
            // read the source file
            var source = new Source(inFilename);
            // create collection for generated ASM
            List<string> asm = new List<string>();
            // count each input line
            var lineCnt = 0;
            // process each line
            while(source.Read()) {
                var parser = new Parser(source.Current);
                var code = new Code(parser, lineCnt);
                asm.AddRange(code.ToAsm());
                lineCnt++;
            }
            // done translating; write out file
            System.IO.File.WriteAllLines(outFilename, asm.ToArray());
        }
        static void Main(string[] args) {
            (new Program()).Run(args);
        }
    }
}