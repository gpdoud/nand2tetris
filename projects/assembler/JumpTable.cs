using System;
using System.Text;

namespace HackAssembler {
    struct JumpTable {
        public string jump { get; set; }
        public char j1 { get; set; }
        public char j2 { get; set; }
        public char j3 { get; set; }

        public string ToHack() {
            var sb = new StringBuilder();
            sb.Append(j1);
            sb.Append(j2);
            sb.Append(j3);
            return sb.ToString();
        }

        public JumpTable(string jump, char j1, char j2, char j3) {
            this.jump = jump;
            this.j1 = j1;
            this.j2 = j2;
            this.j3 = j3;
        }
    }
}