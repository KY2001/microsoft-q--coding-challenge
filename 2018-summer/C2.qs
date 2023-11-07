namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve(q : Qubit) : Int {
      mutable ans = -1;
      using(qubit = Qubit()){
        H(qubit);
        if (M(qubit) == One){
          if (M(q) == One) {
            set ans = 1;            
          }
        } else {
          Ry(0.5 * PI(), q);
          if (M(q) == Zero) {
            set ans = 0;            
          }
        }
        Reset(qubit);
      }
      return ans;
    }
}
