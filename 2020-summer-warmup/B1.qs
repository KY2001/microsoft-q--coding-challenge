namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;

    operation Solve (register : LittleEndian) : Unit is Adj+Ctl {
        let N = Length(register!);
        for (i in N-2..-1..0) {
            Controlled X(register![0..i], register![i+1]);
        }
        X(register![0]);
    }
}
