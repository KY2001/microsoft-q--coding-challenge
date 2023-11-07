namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;

    operation Solve (qs : Qubit[], bits : Bool[][]) : Unit {
      let m = 4;
      let n = Length(bits[0]);
      using(ancilla = Qubit[2]){
        ApplyToEach(H, ancilla);
        for (i in 0..m-1) {
          for (j in 0..1) {
            if (((i >>> j) &&& 1) == 0) {
              X(ancilla[j]);
            }
          }
          mutable targets = new Qubit[0];
          for (j in 0..n-1) {
            if (bits[i][j]) {
              Controlled X(ancilla, qs[j]);
            }
          }
          for (j in 0..n-1) {
            if (bits[i][j] == false) {
              X(qs[j]);
            }
          }
          for (j in 0..1) {
            if (((i >>> j) &&& 1) == 1) {
              Controlled X(qs, ancilla[j]);
            }
          }
          for (j in 0..n-1) {
            if (bits[i][j] == false) {
              X(qs[j]);
            }
          }
          for (j in 0..1) {
            if (((i >>> j) &&& 1) == 0) {
              X(ancilla[j]);
            }
          }
        }
      }
    }
}
