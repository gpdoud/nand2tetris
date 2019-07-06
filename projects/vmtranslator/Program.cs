using System;
using System.Collections.Generic;

namespace vmtranslator {

    class Program {

        bool isDirectory = false;
        string inFilename = null;
        string outFilename = null;

        void Run(string[] args) {
            if(args.Length > 0) { inFilename = args[0]; }
            isDirectory = IsDirectory(inFilename);
            outFilename = CreateOutFilename(inFilename, isDirectory);
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
        string CreateOutFilename(string filename, bool isDirectory) {
            if(isDirectory) { // is a directory
                var len = filename.Length;
                if(filename[len-1] == '\\' || filename[len-1] == '/') {
                    filename = filename.Substring(0, len-2);
                    return filename + ".asm";
                }
            } // else it is a file
                return inFilename.Substring(0, filename.LastIndexOf('.')) + ".asm";
        }
        bool IsDirectory(string filename) {
            var attr = System.IO.File.GetAttributes(inFilename);
            if((attr & System.IO.FileAttributes.Directory) != 0) {
                return true;
            }
            return false;
        }
        static void Main(string[] args) {
            (new Program()).Run(args);
        }
    }
}