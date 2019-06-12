using System;
using System.IO;

namespace HackAssembler {
    class Source {
        public string Filename { get; set; }
        private int idx = 0;
        private string[] src = null;

        public string Next() {
            if(idx >= src.Length) {
                return null;
            }
            return src[idx++];
        }
        public void Reset() {
            idx = 0;
        }

        public Source (string filename)
        {
            this.Filename = filename;
            src = File.ReadAllLines(this.Filename);
            Reset();
            
        }
    }
}