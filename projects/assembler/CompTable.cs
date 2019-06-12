using System;
using System.Text;

namespace HackAssembler {
    struct CompTable {

        public string comp { get; set; }
        public char a { get; set; }
        public char c1 { get; set; }
        public char c2 { get; set; }
        public char c3 { get; set; }
        public char c4 { get; set; }
        public char c5 { get; set; }
        public char c6 { get; set; }

        public string ToHack() {
            var hack = new StringBuilder();
            hack.Append(a);
            hack.Append(c1);
            hack.Append(c2);
            hack.Append(c3);
            hack.Append(c4);
            hack.Append(c5);
            hack.Append(c6);
            return hack.ToString();
        }

        public CompTable(string comp, char a, char c1, char c2, char c3, char c4, char c5, char c6) {
            this.comp = comp;
            this.a = a;
            this.c1 = c1;
            this.c2 = c2;
            this.c3 = c3;
            this.c4 = c4;
            this.c5 = c5;
            this.c6 = c6;
        }
    }
}