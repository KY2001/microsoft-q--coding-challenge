namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve(x : Qubit[], y : Qubit) : Unit {
        body (...) {
          let N = Length(x);
          if (N == 1) {
            X(y);
          } else {
            using(qs = Qubit[N/2]){
              for (a in 0..N/2-1) {
                let b = N - 1 - a;
                CNOT(x[a], qs[a]);
                CNOT(x[b], qs[a]);
                X(qs[a]);
              }
              Controlled X(qs, y);
              for (a in 0..N/2-1) {
                let b = N - 1 - a;
                CNOT(x[a], qs[a]);
                CNOT(x[b], qs[a]);
                X(qs[a]);
              }
            }
          }
        }
        adjoint auto;
    }
}
