namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve(N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[] {
      mutable ans = new Int[N];
      using(qs = Qubit[N+1]){
        Uf(qs[0..N-1], qs[N]);
        mutable res = N;
        if (M(qs[N]) == One) {
          set res += 1;
        }
        if (ModulusI(res, 2) == 1) {
          set ans w/= 0 <- 1;
        }
        ResetAll(qs);
      }
      return ans;
    }
}
