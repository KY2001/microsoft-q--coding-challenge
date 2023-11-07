namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
 
    operation Solve(qs : Qubit[], index : Int) : Unit {
        if (index == 0) {

        } elif (index == 1){
            X(qs[0]);
        } elif (index == 2){
            X(qs[1]);
        } elif (index == 3){
            X(qs[0]);
            X(qs[1]);
        }
        H(qs[0]);
        CNOT(qs[0], qs[1]);
    }
}

namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
 
    operation Solve(qs : Qubit[], index : Int) : Unit {
        H(qs[0]);
        CNOT(qs[0], qs[1]);
        if (index % 2 == 1) {
          Z(qs[0]);
        }
        if (index / 2 == 1){
          X(qs[1]);
        }
    }
}
