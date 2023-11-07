namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[]) : Int {
      ApplyToEach(H, qs);
      let ret = ResultAsInt([M(qs[0]), M(qs[1])]);
      if (ret == 1){
        return 2;
      } elif (ret == 2) {
        return 1;
      }
      return ret;
    }
}

namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[]) : Int {
      ApplyToEach(H, qs);
      return ResultAsInt([M(qs[1]), M(qs[0])]);
    }
}
