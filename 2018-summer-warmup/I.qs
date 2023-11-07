namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(N : Int, Uf : ((Qubit[], Qubit) => ())) : Bool {
      mutable ret = true;
      using(qubits = Qubit[N+1]){
        let x = qubits[0..N-1];
        let y = qubits[N];
        X(y);
        ApplyToEach(H, qubits);
        Uf(x, y);
        ApplyToEach(H, qubits);
        for (i in 0..N-1) {
          if (M(x[i]) != Zero){
            set ret = false;
          }
        }
        ResetAll(qubits);
      }
      return ret;
    }
}
