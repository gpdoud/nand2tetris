using System;
using System.Collections.Generic;
using System.IO;

namespace HackAssembler {
    class Source {
        public string Filename { get; set; }
        private int current = -1;
        private string[] src = null;
        public string Line { get { return src[current]; }}

        public bool Next() {
            current++;
            if(current == -1 || current >= src.Length) {
                return false;
            }
            return true;
        }
        public void Reset() {
            current = -1;
        }

        public void Read() {
            src = File.ReadAllLines(this.Filename);
        }

        public Source (string filename)
        {
            this.Filename = filename;
            Reset();
            
        }
    }
}