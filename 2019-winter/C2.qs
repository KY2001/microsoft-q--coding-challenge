namespace Solution {
  open Microsoft.Quantum.Convert;
  open Microsoft.Quantum.Arrays;
  open Microsoft.Quantum.Diagnostics;
  open Microsoft.Quantum.Intrinsic;
  open Microsoft.Quantum.Canon;
  open Microsoft.Quantum.Math;

  operation Oracle(ancilla : Qubit[], x : Qubit[]) : Unit {
    body (...) {
        let N = Length(x);

        for (P in 1..N-1) {
            for (i in 0..N-P-1) {
                CNOT(x[i+P], x[i]);
            }
            (ControlledOnInt(0, X))(x[0..N-P-1], ancilla[P-1]);
            for (i in N-P-1..-1..0) {
                CNOT(x[i+P], x[i]);
            }
        }
    }

    adjoint auto;
  }

  operation Solve (x : Qubit[], y : Qubit) : Unit {
    body (...) {
      let N = Length(x);

      using (ancilla = Qubit[N-1]) {
        Oracle(ancilla, x);
        X(y);
        (ControlledOnInt(0, X))(ancilla, y);

        Adjoint Oracle(ancilla, x);
        }
    }

    adjoint auto;
  }
}
