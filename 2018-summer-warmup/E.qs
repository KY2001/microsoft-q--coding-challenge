namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[]) : Int {
      CNOT(qs[0], qs[1]);
      H(qs[0]);
      mutable res = new Result[2];
      mutable index = 0;
      for (i in 0 .. 1){
        set res w/= i <- M(qs[i]);
        if (res[i] != Zero) {
          set index += (1 <<< i); // 2^i でも OK
        }
      }
      return index;
    }
}

namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[]) : Int {
      CNOT(qs[0], qs[1]);
      H(qs[0]);
      return ResultAsInt([M(qs[0]), M(qs[1])]);
    }
}
