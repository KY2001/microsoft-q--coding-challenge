namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;

    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (qs = Qubit[2]) {
            H(qs[0]);
            Controlled unitary([qs[0]], qs[1]);
            H(qs[0]);
            if (M(qs[0]) == One) {
                X(qs[0]);
                return 1;
            }
        }
        return 0;
    }
}
