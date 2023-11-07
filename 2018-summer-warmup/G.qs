namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(x : Qubit[], y : Qubit, k : Int) : Unit {
      // 間違い。オラクルなので測定してはならない
      if (M(x[k]) == One) {
        X(y);
      }
    }
}

namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(x : Qubit[], y : Qubit, k : Int) : Unit {
      CNOT(x[k], y);
    }
}
