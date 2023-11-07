namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[]) : Int {
      let N = Length(qs);
      mutable count = 0;
      for (i in 0..N-1){
        if (M(qs[i]) == One) {
          set count += 1;          
        }
      }
      if (count == 0 or count == N) {
        return 0;
      }
      return 1;
    }
}
