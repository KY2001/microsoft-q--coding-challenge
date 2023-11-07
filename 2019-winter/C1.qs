namespace Solution {
  open Microsoft.Quantum.Convert;
  open Microsoft.Quantum.Arrays;
  open Microsoft.Quantum.Diagnostics;
  open Microsoft.Quantum.Intrinsic;
  open Microsoft.Quantum.Canon;
  open Microsoft.Quantum.Math;

  operation Solve (x : Qubit[], y : Qubit) : Unit {
    body (...) {
      let N = Length(x);

      using (ancilla1 = Qubit[N-1]) {
        for (P in 1..N-1) {
          using (ancilla2 = Qubit[N-P]){
            for (i in 0..N-P-1) {
              Toffoli(x[i], x[i+P], ancilla2[i]);
              X(x[i]);
              X(x[i+P]);
              Toffoli(x[i], x[i+P], ancilla2[i]);
              X(x[i]);
              X(x[i+P]);
            }
            Controlled X(ancilla2, ancilla1[P-1]);
            for (i in 0..N-P-1) {
              Toffoli(x[i], x[i+P], ancilla2[i]);
              X(x[i]);
              X(x[i+P]);
              Toffoli(x[i], x[i+P], ancilla2[i]);
              X(x[i]);
              X(x[i+P]);
            }
          }
        }

        ApplyToEachA(X, ancilla1);
        X(y);
        Controlled X(ancilla1, y);
        ApplyToEachA(X, ancilla1);

        for (P in 1..N-1) {
          using (ancilla2 = Qubit[N-P]){
            for (i in 0..N-P-1) {
              Toffoli(x[i], x[i+P], ancilla2[i]);
              X(x[i]);
              X(x[i+P]);
              Toffoli(x[i], x[i+P], ancilla2[i]);
              X(x[i]);
              X(x[i+P]);
            }
            Controlled X(ancilla2, ancilla1[P-1]);
            for (i in 0..N-P-1) {
              Toffoli(x[i], x[i+P], ancilla2[i]);
              X(x[i]);
              X(x[i+P]);
              Toffoli(x[i], x[i+P], ancilla2[i]);
              X(x[i]);
              X(x[i+P]);
            }
          }
        }
      }
    }
    adjoint auto;
  }
}
