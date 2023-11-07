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
          Controlled X(x, y);
        }
        adjoint auto;
    }
}
