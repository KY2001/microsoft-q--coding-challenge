namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;

    operation Solve (theta : Double, unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable answer = 0;
        using (qubit = Qubit()) {
            mutable sum = 0.0;
            let delta = 0.05;
            repeat {
                set sum += theta;
                unitary(qubit);
                if (sum > 2.0 * PI()) {
                    set sum -= 2.0 * PI();
                }
            } until (AbsD(sum - PI()) < delta);
            if (M(qubit) == One) {
                set answer = 1;
                X(qubit);
            }
        }
        return answer;
    }
}
