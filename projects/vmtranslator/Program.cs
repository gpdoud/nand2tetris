using System;
using System.Collections.Generic;

namespace vmtranslator {

    class Program {

        bool isDirectory = false;
        string inFilename = null;
        string outFilename = null;
        List<string> vmfiles = null;

        void Run(string[] args) {
            if (args.Length > 0) { inFilename = args[0]; }
            // directory or single file
            isDirectory = IsDirectory(inFilename);
            // gen output file name
            outFilename = CreateOutFilename(inFilename, isDirectory);
            // get all *.vm if directory else single file
            var sourceFiles = LoadFiles(inFilename);
            // store in List
            vmfiles = new List<string>(sourceFiles);
            // create collection for generated ASM
            List<string> asm = new List<string>();
            // iterate files to compile
            foreach (var vmfile in vmfiles) {
                var filename = System.IO.Path.GetFileNameWithoutExtension(vmfile);
                // read the source file
                var source = new Source(vmfile);
                // count each input line
                var lineCnt = 0;
                // process each line
                while (source.Read()) {
                    var parser = new Parser(source.Current, filename);
                    var code = new Code(parser, lineCnt);
                    asm.AddRange(code.ToAsm());
                    lineCnt++;
                }
            }
            // done translating; write out file
            System.IO.File.WriteAllLines(outFilename, asm.ToArray());
        }
        string[] LoadFiles(string inFilename) {
            if (!isDirectory) {
                return new string[] { inFilename };
            }
            // get all source files from directory
            return System.IO.Directory.GetFiles(inFilename, "*.vm");
        }
        string CreateOutFilename(string filename, bool isDirectory) {
            if (isDirectory) { // is a directory
                var len = filename.Length;
                if (filename[len - 1] == '\\' || filename[len - 1] == '/') {
                    filename = filename.Substring(0, len - 1);
                    var segments = filename.Split('/');
                    var newfilename = segments[segments.Length-1];
                    filename = string.Join('/', segments) + $"/{newfilename}.asm";
                    /*
                        Need to get the directory name then create a filename
                        using the directory name in the directory being parsed.
                        i.1. ./test/GD/ => ./test/GD/GD.asm
                    */
                    return filename;
                }
            } // else it is a file
            return filename.Substring(0, filename.LastIndexOf('.')) + ".asm";
        }
        bool IsDirectory(string filename) {
            var attr = System.IO.File.GetAttributes(inFilename);
            if ((attr & System.IO.FileAttributes.Directory) != 0) {
                return true;
            }
            return false;
        }
        static void Main(string[] args) {
            (new Program()).Run(args);
        }
    }
}