namespace Solution {
  open Microsoft.Quantum.Convert;
  open Microsoft.Quantum.Arrays;
  open Microsoft.Quantum.Diagnostics;
  open Microsoft.Quantum.Intrinsic;
  open Microsoft.Quantum.Canon;
  open Microsoft.Quantum.Math;

    operation Mod (x : Qubit[], ancilla: Qubit[]) : Unit {
        body (...) {
            let N = Length(x);
            for (i in 0..N-1){
                X(ancilla[1]);
                CCNOT(x[i], ancilla[1], ancilla[0]);
                X(ancilla[1]);

                X(ancilla[0]);
                CCNOT(x[i], ancilla[0], ancilla[1]);
                X(ancilla[0]);
            }
        }
        adjoint auto;
    }

    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            let N = Length(x);
            using (ancilla = Qubit[2]) {
                Mod(x, ancilla);
                
                ApplyToEachA(X, ancilla);
                CCNOT(ancilla[0], ancilla[1], y);
                ApplyToEachA(X, ancilla);

                Adjoint Mod(x, ancilla);
            }
        }
        adjoint auto;
    }
}
