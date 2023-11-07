namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve(x : Qubit[], y : Qubit) : Unit {
      let N = Length(x);
      X(y);

      ApplyToEach(X, x);
      Controlled X(x, y);
      ApplyToEach(X, x);

      for (i in 0..N-1) {
        ApplyToEach(X, x);
        X(x[i]);
        Controlled X(x, y);
        ApplyToEach(X, x);
        X(x[i]);
      }
    }
}
