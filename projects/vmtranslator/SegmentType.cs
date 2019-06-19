using System;

namespace vmtranslator {

    public enum SegmentType {
        Local,
        Argument,
        This, 
        That, 
        Constant, 
        Static, 
        Pointer, 
        Temp,
        Unknown
    }
}