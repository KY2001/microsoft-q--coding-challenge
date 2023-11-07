namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(x : Qubit[], y : Qubit) : Unit {
      let N = Length(x);
      for (i in 0 .. N - 1) {
        CNOT(x[i], y);
      }
    }
}
