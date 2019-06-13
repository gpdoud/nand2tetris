using System;
using System.Collections.Generic;

namespace HackAssembler {

    class SymbolTable {

        int nextRegister = 16;
        IDictionary<string, int> symbolTable = null;

        public int this[string symbol] {
            get {
                if(!symbolTable.ContainsKey(symbol)) {
                    symbolTable[symbol] = nextRegister++;
                }
                return symbolTable[symbol];
            }
            set {
                symbolTable[symbol] = value;
            }
        }

        public SymbolTable() {
            symbolTable = new Dictionary<string, int>() {
                ["R0"]  = 0,   ["R1"] = 1,  ["R2"]  = 2,  ["R3"]  = 3,
                ["R4"]  = 4,   ["R5"] = 5,  ["R6"]  = 6,  ["R7"]  = 7,
                ["R8"]  = 8,   ["R9"] = 9,  ["R10"] = 10, ["R11"] = 11,
                ["R12"] = 12, ["R13"] = 13, ["R14"] = 14, ["R15"] = 15,

                ["SCREEN"] = 16384
            };
        }
    }

}