using System;
using System.Text;

namespace HackAssembler {
    public struct DestTable {
        public string dest;
        public char d1;
        public char d2;
        public char d3;

        public string ToHack() {
            var str = new StringBuilder();
            str.Append(d1);
            str.Append(d2);
            str.Append(d3);
            return str.ToString();
        }

        public DestTable(string dest, char d1, char d2, char d3) {
            this.dest = dest;
            this.d1 = d1;
            this.d2 = d2;
            this.d3 = d3;
        }
    }
}