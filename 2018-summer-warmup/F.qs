namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : Int {
      let N = Length(qs);
      mutable bits0_int = 0;
      for (i in 0 .. N-1) {
        if (bits0[i] == true) {
          set bits0_int += 2^i;
        }
      }
      mutable qs_int = 0;
      for (i in 0 .. N-1){
        if (M(qs[i]) == One) {
          set qs_int += 2^i;
        }
      }
      if (qs_int == bits0_int) {
        return 0;
      }
      return 1;
    }
}
