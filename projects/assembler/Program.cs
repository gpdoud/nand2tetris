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
            var line = src.Next();
            while(line != null) {
                Console.WriteLine($"{line}");
                line = src.Next();
            }
        }
        static void Main(string[] args)
        {
            (new Program()).Run(args);
        }
    }
}
