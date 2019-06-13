using System;
using System.Collections.Generic;
using System.IO;

namespace HackAssembler
{
    class Source
    {
        public string Filename { get; set; }
        private int current = -1;
        private IList<string> src = null;
        public string Line { get { return src[current]; } }
        private SymbolTable symbolTable = null;

        private void RemoveLabels(IList<string> src)
        {
            bool hasMoreLabels = true;
            while (hasMoreLabels)
            {
                hasMoreLabels = false;
                for (var idx = 0; idx < src.Count; idx++)
                {
                    var line = src[idx];
                    if (line.Length == 0) continue;
                    if (line[0] == '(')
                    { // a jump label
                        hasMoreLabels = true;
                        var label = line.Substring(1, line.Length - 2);
                        var addr = idx; // line for label will be deleted 
                        symbolTable[label] = addr;
                        src.RemoveAt(idx);
                        break;
                    }
                }
            }
        }
        private void ReplaceSymbols(IList<string> src)
        {
            for (var idx = 0; idx < src.Count; idx++)
            {
                var line = src[idx];
                if (line.Length == 0) continue;

                if (line[0] == '@')
                { // is an an A instruction?
                    if (char.IsLetter(line[1]))
                    { // if letter, it is a symbol
                        var symbol = line.Substring(1);
                        var reg = symbolTable[symbol]; // get the reg (create it if needed)
                        line = $"@{reg}";
                        src[idx] = line; // replace the line
                    }

                }
            }
        }
        private void Strip(IList<string> src)
        {
            var idxesToDelete = new List<int>();
            for (var idx = 0; idx < src.Count; idx++)
            {
                var line = src[idx];

                // strip blanks
                line = line.Replace(" ", "");

                // strip end-of-line comments
                var pos = line.IndexOf(@"//");
                if (pos > -1)
                {
                    line = line.Substring(0, pos);
                }

                // update the line (it may be empty)
                src[idx] = line;
            }
        }
        private void RemoveBlankLines(IList<string> src) {
            var nextloop = true;
            while(nextloop) {
                nextloop = src.Remove("");
            }
        }
        public bool Next()
        {
            current++;
            if (current == -1 || current >= src.Count)
            {
                return false;
            }
            return true;
        }
        public void Reset()
        {
            current = -1;
        }

        public void Read()
        {
            var lines = File.ReadAllLines(this.Filename);
            src = new List<string>(lines);
            Strip(src);
            RemoveBlankLines(src);
            RemoveLabels(src);
            ReplaceSymbols(src);
            RemoveBlankLines(src);
        }

        public Source(string filename)
        {
            symbolTable = new SymbolTable();
            src = new List<string>();
            this.Filename = filename;
            Reset();

        }
    }
}