namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;

    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        mutable answer = 0;
        using (qs = Qubit[2]) {
            X(qs[0]);
            unitary(qs);
            let Mresult = ResultArrayAsInt(MultiM(qs));
            if (Mresult == 3) {
                set answer = 1;
                ApplyToEachA(X, qs);
            } elif (Mresult == 2) {
                set answer = 3;
                X(qs[1]);
            } else {
                ApplyToEachA(X, qs);
                unitary(qs);
                let Mresult2 = ResultArrayAsInt(MultiM(qs));
                if (Mresult2 == 3) {
                    set answer = 2;
                    ApplyToEachA(X, qs);
                } else {
                    set answer = 0;
                    X(qs[1]);
                }
            }
        }
        return answer;
    }
}
