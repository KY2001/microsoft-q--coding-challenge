namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
 
    operation Solve(qs : Qubit[], bits : Bool[]) : Unit {
      let N = Length(qs);
      H(qs[0]);
      for (i in 1..N-1){
        if (bits[i] == true) {
          CNOT(qs[0], qs[i]);
        }
      }
    }
}