namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;

    operation Solve (qs : Qubit[]) : Int {
      let w_theta = 2.0 * PI() / 3.0;

      R1(2.0 * w_theta, qs[1]);
      R1(w_theta, qs[2]);

      ApplyToEach(X, qs[0..1]);
      Controlled X(qs[0..1], qs[2]);
      ApplyToEach(X, qs[0..1]);

      X(qs[0]);
      Controlled H([qs[0]], qs[1]);
      X(qs[0]);

      Ry(9.0 / 2.0 * PI() - 2.0 * ArcCos(Sqrt(2.0 / 3.0)), qs[0]);

      H(qs[0]);
      
      let ret = ResultArrayAsInt([M(qs[0]), M(qs[1]), M(qs[2])]);
      if (ret == 0) {
        return 0;
      }
      return 1;
    }
}
