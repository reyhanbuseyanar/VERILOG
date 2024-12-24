module addition (
    input [3:0] A, B,
    input CarryIN,
    output [3:0] Y,
    output CarryOUT
);

wire [3:0] Carry4;

fulladder f0(.A(A[0]), .B(B[0]), .Cin(CarryIN), .S(Y[0]), .Cout(Carry4[0]));
fulladder f1(.A(A[1]), .B(B[1]), .Cin(Carry4[0]), .S(Y[1]), .Cout(Carry4[1]));
fulladder f2(.A(A[2]), .B(B[2]), .Cin(Carry4[1]), .S(Y[2]), .Cout(Carry4[2]));
fulladder f3(.A(A[3]), .B(B[3]), .Cin(Carry4[2]), .S(Y[3]), .Cout(CarryOUT));




endmodule