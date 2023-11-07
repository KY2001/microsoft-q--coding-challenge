namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : Unit {
      let N = Length(qs);
      mutable idx = 0;
      mutable bits_idx_zero = new Bool[N];
      mutable bits_idx_one = new Bool[N];
      for (i in 0..N-1){
        if (bits0[i] == true and bits1[i] == false){
          set idx = i;
          set bits_idx_zero = bits1;
          set bits_idx_one = bits0;
        } elif (bits0[i] == false and bits1[i] == true){
          set idx = i;
          set bits_idx_zero = bits0;
          set bits_idx_one = bits1;
        }
      }
      H(qs[idx]);
      for (i in 0..N-1){
        if (i != idx) {
          if (bits_idx_one[i] == true and bits_idx_zero[i] == true) {
            X(qs[i]);
          } elif (bits_idx_one[i] == true and bits_idx_zero[i] == false) {
            CNOT(qs[idx], qs[i]);
          } elif (bits_idx_one[i] == false and bits_idx_zero[i] == true) {
            X(qs[i]);
            CNOT(qs[idx], qs[i]);
          }
        }
      }
    }
}
