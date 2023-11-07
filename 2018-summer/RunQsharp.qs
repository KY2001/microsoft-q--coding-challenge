namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve(qs : Qubit[]) : Int {
      DumpMachine();
      ApplyToEach(H, qs);
      return ResultArrayAsInt([M(qs[0]), M(qs[1])]);
    }

    operation RunQsharp() : Bool {
        using(qs = Qubit[2]){
            mutable ret = 0;

            ApplyToEach(H, qs);
            set ret = Solve(qs);
            Message("0: " + IntAsString(ret));

            X(qs[0]);
            ApplyToEach(H, qs);
            set ret = Solve(qs);
            Message("1: " + IntAsString(ret));
            X(qs[0]);

            X(qs[1]);
            ApplyToEach(H, qs);
            set ret = Solve(qs);
            Message("2: " + IntAsString(ret));
            X(qs[1]);

            X(qs[0]);
            X(qs[1]);
            ApplyToEach(H, qs);
            set ret = Solve(qs);
            Message("3: " + IntAsString(ret));
            X(qs[0]);
            X(qs[1]);
        }
        return true;
    }
}
