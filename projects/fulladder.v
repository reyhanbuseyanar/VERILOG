module fulladder (
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);
wire AxB, AnB1, AnB2;

halfadder h1(
    A,
    B,
    AxB,
    AnB1
);
halfadder h2(
    AxB,
    Cin,
    S,
    AnB2
);
or o1 (Cout,AnB2,AnB1);
endmodule
