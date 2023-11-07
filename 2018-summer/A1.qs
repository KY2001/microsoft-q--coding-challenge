namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[]) : Unit {
      ApplyToEach(H, qs);
    }
}
