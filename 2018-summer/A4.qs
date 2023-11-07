namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation GetK(N: Int) : Int {
      for (i in 0..4){
        if (2^i == N) {
          return i;
        }
      }
      return 0;
    }

    operation IsPowerOfTwo(Num: Int) : Bool {
      for (i in 0..4){
        if (2^i == Num) {
          return true;
        }
      }
      return false;
    }

    operation Solve(qs : Qubit[]) : Unit {
      let N = Length(qs);
      mutable k = GetK(N);
      if (k == 0) {
        X(qs[0]);
      } else {
        ApplyToEach(H, qs[0..k-1]);

        ApplyToEach(X, qs[0..k-1]);
        Controlled X(qs[0..k-1], qs[k]);
        ApplyToEach(X, qs[0..k-1]);
        
        mutable idx = k + 1;
        for (i in 1..N-1){
          if (not IsPowerOfTwo(i)){
            // Message(IntAsString(i) + " " + IntAsString(idx));
            for (j in 0..k-1) {
              if (((i >>> j) &&& 1) == 0) {
                X(qs[j]);
              }
            }
            Controlled X(qs[0..k-1], qs[idx]);
            for (j in 0..k-1) {
              if (((i >>> j) &&& 1) == 0) {
                X(qs[j]);
              }
            }
            for (j in 0..k-1) {
              if (((i >>> j) &&& 1) != 0) {
                CNOT(qs[idx], qs[j]);
              }
            }
            set idx += 1;
          }
        }
      }
    }
}

namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[]) : Unit {
      let N = Length(qs);
      if (N == 1) {
        X(qs[0]);
      } else {
        Solve(qs[0..N/2-1]);
        using(ancilla = Qubit()){
          H(ancilla);
          for (i in 0..N/2-1){
            (Controlled SWAP)([ancilla], (qs[i], qs[i+N/2]));
          }
          for (i in N/2..N-1) {
            CNOT(qs[i], ancilla);
          }
        }
      }
    }
}
