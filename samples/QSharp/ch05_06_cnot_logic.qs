namespace QSharp.Chapter5
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Example 5-6: Logic using CNOT gates

    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;

    operation CNOTLogic () : Unit {
        Message("c = ~c");
        use (a, b, c) = (Qubit(), Qubit(), Qubit());
        Message($"Input: c = {M(c)}");
        X(c);
        Message($"Output: c = {M(c)}");
        Reset(c);
    
        // ------------------------------------------------------
        Message("");
        Message("if (b) then c = ~c");
        // initialize input
        X(b);
        Message($"Input: b = {M(b)}, c = {M(c)}");

        CNOT(b, c);
        Message($"Output: b = {M(b)}, c = {M(c)}");

        ResetAll([b, c]);
    
        // ------------------------------------------------------
        Message("");
        Message("if (a and b) then c = ~c");
        // initialize input
        X(a);
        X(b);
        Message($"Input: a = {M(a)}, b = {M(b)}, c = {M(c)}");

        (Controlled X)([a, b], c);
        Message($"Output: a = {M(a)}, b = {M(b)}, c = {M(c)}");

        ResetAll([a, b, c]);
    }
}