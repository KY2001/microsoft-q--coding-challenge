namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[]) : Int {
      let N = Length(qs);
      for (i in 0..N-1){
        if (M(qs[i]) == One) {
          return 1;
        }
      }
      return 0;
    }
}
