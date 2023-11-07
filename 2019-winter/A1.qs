namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;

    operation Solve (qs : Qubit[]) : Unit {
        body (...) {
          Ry(2.0 * ArcCos(Sqrt(1.0 / 3.0)), qs[0]);
          Controlled H([qs[0]], qs[1]);
          X(qs[0]);
        }
        adjoint auto;
    }
}
