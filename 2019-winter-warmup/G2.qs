namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
          X(y);
          ApplyToEach(X, x);
          Controlled X(x, y);
          ApplyToEach(X, x);
        }
        adjoint (...) {
            ApplyToEach(X, x);
            Controlled X(x, y);
            ApplyToEach(X, x);
            X(y);
        }
    }
}
