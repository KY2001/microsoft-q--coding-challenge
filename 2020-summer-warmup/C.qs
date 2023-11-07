namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;

    operation Solve (qs : Qubit[]) : Unit {
        using (ancilla = Qubit()) {
            repeat {
                ApplyToEachA(H, qs);
                CCNOT(qs[0], qs[1], ancilla);
            } until (M(ancilla) == Zero)
            fixup {
                ApplyToEachA(X, qs);
                X(ancilla);
            }
        }
        ApplyToEachA(X, qs);
    }
}
