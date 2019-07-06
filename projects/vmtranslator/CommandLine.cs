using System;
using System.Collections.Generic;

namespace vmtranslator {

    // program -o outfile.exe -i source1.cs source2.cs ...
    class CommandLine {
        
        List<string> args = null;

        public CommandLine(string[] args) {
            this.args = new List<string>(args);
        }
    }
}