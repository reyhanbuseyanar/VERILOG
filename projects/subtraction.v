module subtraction (
    input [3:0] A, B,
    input CarryIN,
    output [3:0] Y,
    output CarryOUT
);

wire [3:0] notB;
wire [3:0] Y1;

// B'nin 2'nin tümleyeni: NOT B + 1
assign notB = ~B + 1;

// A - B işlemi: A + (-B)
addition a1 (.A(A), .B(notB), .CarryIN(CarryIN), .Y(Y1), .CarryOUT(CarryOUT));

// Taşma kontrolü

// Çıkış ataması
assign Y = Y1;

endmodule
