using System;
using System.Collections.Generic;

namespace vmtranslator {

    struct SourceLine {
        public string Line;
        public LineType Type;

        public SourceLine(string line, LineType type) {
            Line = line;
            Type = type;
        }
    } 

    class Source {
        
        IList<string> source = null;
        int current = -1;

        public string Current {
            get { 
                var line = source[current]; 
                return line;
            }
        }
        public bool Read() {
            current++;
            if(current >= source.Count) return false;
            return true;
        }
        public void Reset() {
            current = -1;
        }
        private void Strip() {
            var src = new List<string>(source);
            source.Clear();
            foreach(var line in src) {
                var pos = line.IndexOf(@"//");
                if(pos == -1) { source.Add(line); }
                if(pos > 0) { // deletes an entire line comment
                    source.Add(line.Substring(0, pos));
                }
            }
        }
        public Source(string filename) {
            source = new List<string>(System.IO.File.ReadAllLines(filename));
            Strip();
            Reset();
        }
    }
}