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
          X(qs[N-1]);
          for (i in 0..N-2) {
            CNOT(qs[N-1], qs[i]);
          }
          X(qs[N-1]);

          for (i in 0..N-2) {
            Controlled H([qs[N-1]], qs[i]);
          }
        }
        adjoint auto;
    }
}
