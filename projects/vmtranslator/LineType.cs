using System;

namespace vmtranslator {
    
    public enum LineType { 
        Add, 
        Sub, 
        Neg, 
        Eq, 
        Gt, 
        Lt, 
        And, 
        Or, 
        Not, 
        
        Push, 
        Pop, 

        Label,
        GoTo,
        IfGoTo,

        Function,
        Call,
        Return,

        Comment, 
        Unknown
    };


}