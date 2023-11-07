namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve(x : Qubit[], y : Qubit, b : Int[]) : Unit {
      let N = Length(x);
      for (i in 0..N-1) {
        if (b[i] == 1) {
          CNOT(x[i], y);
        } else {
          X(x[i]);
          CNOT(x[i], y);
          X(x[i]);
        }
      }
    }
}
