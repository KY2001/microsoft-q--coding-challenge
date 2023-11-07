namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;

    // @EntryPoint()
    // operation HelloQ() : Unit {
    //     let res = Solve(MinusXZ);
    //     Message($"res: {res}");
    //     Message("Hello quantum world!");
    // }

    // operation MinusY(target: Qubit) : Unit is Adj + Ctl {
    //     let matrix = [
    //         [Complex(0.0, 0.0), Complex(0.0, 1.0)],
    //         [Complex(0.0, -1.0), Complex(0.0, 0.0)]
    //     ];
    //     ApplyUnitary(matrix, LittleEndian([target]));
    // }

    // operation XZ(target: Qubit) : Unit is Adj + Ctl {
    //     Z(target);
    //     X(target);
    // }

    // operation MinusXZ(target: Qubit) : Unit is Adj + Ctl {
    //     Z(target);
    //     X(target);
    //     let matrix = [
    //         [Complex(-1.0, 0.0), Complex(0.0, 0.0)],
    //         [Complex(0.0, 0.0), Complex(-1.0, 0.0)]
    //     ];
    //     ApplyUnitary(matrix, LittleEndian([target]));
    // }

    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable answer = 0;
        using (qs = Qubit[2]) {
            H(qs[0]);
            Controlled H([qs[0]], qs[1]);
            Controlled unitary([qs[0]], qs[1]);
            Controlled unitary([qs[0]], qs[1]);
            Controlled H([qs[0]], qs[1]);
            H(qs[0]);

            if (M(qs[0]) == Zero) {
                // Y or -Y -> YがYの逆行列じゃない？
                H(qs[0]);
                Controlled unitary([qs[0]], qs[1]);
                Controlled Y([qs[0]], qs[1]);
                H(qs[0]);
                if (M(qs[0]) == Zero) {
                    // Y
                    set answer = 0;
                } else {
                    // -Y
                    set answer = 2;
                    X(qs[0]);
                }
            } else {
                X(qs[0]);
                // -XZ or XZ
                H(qs[0]);
                Controlled unitary([qs[0]], qs[1]);
                Controlled Z([qs[0]], qs[1]);
                Controlled X([qs[0]], qs[1]);
                H(qs[0]);
                if (M(qs[0]) == Zero) {
                    // XZ
                    set answer = 1;
                } else {
                    // -XZ
                    set answer = 3;
                    X(qs[0]);
                }
            }
        }
        return answer;
    }
}
