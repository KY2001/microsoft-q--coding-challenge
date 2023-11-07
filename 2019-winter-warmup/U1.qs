namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve(qs : Qubit[]) : Unit {
        body (...) {
          let N = Length(qs);
          for (i in 0..N-1) {
            X(qs[i]);
          }
        }
        adjoint auto;
    }
}
