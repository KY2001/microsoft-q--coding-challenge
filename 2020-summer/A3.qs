namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;

    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable answer = 1;
        using (qubit = Qubit()) {
            unitary(qubit);
            Z(qubit);
            unitary(qubit);
            if (M(qubit) == One) {
                set answer = 0;
                X(qubit);
            }
        }
        return answer;
    }
}
