namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Math;

    operation Uf(qs : Qubit[], q : Qubit) : Unit {
      let N = Length(qs);
      let b = [0, 1, 0, 1];
      for (i in 0..N-1){
        if (b[i] == 1) {
          CNOT(qs[i], q);
        }
      }
    }

    operation Solve(N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[] {
      mutable ans = new Int[N];
      using(qs = Qubit[N+1]){
        ApplyToEach(H, qs[0..N-1]);
        Uf(qs[0..N-1], qs[N]);
        Z(qs[N]);
        ApplyToEach(H, qs[0..N-1]);
        for (i in 0..N-1){
          if (M(qs[i]) == One) {
            set ans w/= i <- 1;
          }
        }
        ResetAll(qs);
      }
      return ans;
    }

    operation RunQsharp() : Bool {
      let N = 4;
      let ans = Solve(N, Uf);
      Message($"ans = {ans}");
      return true;
    }
}

namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve(N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[] {
      mutable ans = new Int[N];
      using(qs = Qubit[N+1]){
        ApplyToEach(H, qs[0..N-1]);

        X(qs[N]);
        H(qs[N]);
        Uf(qs[0..N-1], qs[N]);

        ApplyToEach(H, qs[0..N-1]);
        for (i in 0..N-1){
          if (M(qs[i]) == One) {
            set ans w/= i <- 1;
          }
        }
        ResetAll(qs);
      }
      return ans;
    }
}
