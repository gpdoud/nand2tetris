using System;

namespace vmtranslator {
    
    class Parser {


        public string Line {get; set; }
        public LineType Type;
        public string OpCode { get; set; }
        public SegmentType Segment { get; set; }
        public int Nbr { get; set; }
        public string Label { get; set; }
        public string FunctionName { get; set; }
        public int NbrArgs { get; set; }
        public string Filename { get; set; }

        private void Parse() {
            // reset all properties
            OpCode = Label = FunctionName = null;
            Nbr = NbrArgs = -1;
            // parse
            var parts = Line.Split(' ');
            switch(parts[0].ToLower()) {
                // arithmetic/logical
                case "add":         Type = LineType.Add;    break;
                case "sub":         Type = LineType.Sub;    break;
                case "neg":         Type = LineType.Neg;    break;
                case "eq":          Type = LineType.Eq;     break;
                case "gt":          Type = LineType.Gt;     break;
                case "lt":          Type = LineType.Lt;     break;
                case "and":         Type = LineType.And;    break;
                case "or":          Type = LineType.Or;     break;
                case "not":         Type = LineType.Not;    break;
                // memory access
                case "push":        
                    Type = LineType.Push; 
                    Segment = GetSegmentType(parts[1]); 
                    Nbr = GetNumberParm(parts[2]); 
                    break;
                case "pop":         
                    Type = LineType.Pop;  
                    Segment = GetSegmentType(parts[1]); 
                    Nbr = GetNumberParm(parts[2]); 
                    break;
                // branching
                case "label":       Type = LineType.Label;      Label = parts[1]; break;
                case "goto":        Type = LineType.GoTo;       Label = parts[1]; break;
                case "if-goto":     Type = LineType.IfGoTo;     Label = parts[1]; break;
                // functions
                case "function":    
                    Type = LineType.Function;   
                    FunctionName = parts[1];
                    Nbr = GetNumberParm(parts[2]); 
                    break;
                case "call":
                    Type = LineType.Call;
                    FunctionName = parts[1];
                    Nbr = GetNumberParm(parts[2]);
                    break;
                case "return":      Type = LineType.Return;     break;
                // just return, no code gen needed
                case "//":          Type = LineType.Comment;    return;
                default:            Type = LineType.Unknown;    return;
            }
            OpCode = parts[0];
            
        }

        private int GetNumberParm(string nbrStr) {
            int aNbr;
            var rc = int.TryParse(nbrStr, out aNbr);
            return rc ? aNbr : -1;         
        }

        private SegmentType GetSegmentType(string segment) {
            switch(segment.ToLower()) {
                case "local": return SegmentType.Local;
                case "argument": return SegmentType.Argument;
                case "this": return SegmentType.This;
                case "that": return SegmentType.That;
                case "constant": return SegmentType.Constant;
                case "static": return SegmentType.Static;
                case "pointer": return SegmentType.Pointer;
                case "temp": return SegmentType.Temp;
                default: return SegmentType.Unknown;
            }
        }

        public Parser(string sourceLine, string filename) {
            this.Line = sourceLine;
            this.Filename = filename;
            Parse();
        }
    }
}