module Adder3Bit(
    input[3:0] A,
    input[3:0] B,
    input Cin,
    output[3:0] S,
    output carry_out
);
wire C1,C2,C3;

halfAdder h1(
    .A(A[0]),
    .B(B[0]),
    .Cin(Cin),
    .S0(sum[0]),
    .carry_out(C1)
);

fullAdder f1(
    .A(A[1]),
    .B(B[1]),
    .Cin(C1),
    .S2(sum[1]),
    .carry_out(C2)
);

fullAdder f2(
    .A(A[2]),
    .B(B[2]),
    .Cin(C2),
    .S3(sum[2]),
    .carry_out(C3)

);

fullAdder f3(
    .A(A[3]),
    .B(B[3]),
    .Cin(C3),
    .S3(sum[3]),
    .carry_out(C4)
);

 
endmodule