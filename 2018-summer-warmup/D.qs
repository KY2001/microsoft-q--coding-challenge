namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
 
    operation Solve(q : Qubit) : Int {
      H(q);
      let result = M(q);
      if (result == Zero) {
        return 1;
      }
      return -1;
    }
}

namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
 
    operation Solve(q : Qubit) : Int {
      // 計算基底を(|0>, |1>) から (|+>, |->)に変更する 
      // 通常はPauli-Zによる測定
      // Pauli-Xによる測定は状態にHゲートをかけてからPauli-Xゲートによる測定を行うことと等価
      // なお、Pauli-Yによる測定は状態にHS*ゲートをかけてからPauli-Xゲートによる測定を行うことと等価
      if (Measure([PauliX], [q]) == Zero) {
        return 1;
      }
      return -1;
    }
}
