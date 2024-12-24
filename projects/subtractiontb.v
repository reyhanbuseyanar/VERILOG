module subtractiontb;

    // Inputs
    reg [3:0] A, B;
    reg CarryIN;

    // Outputs
    wire [3:0] Y;
    wire CarryOUT;


    // Instantiate the subtraction module
    subtraction uut (
        .A(A),
        .B(B),
        .CarryIN(CarryIN),
        .Y(Y),
        .CarryOUT(CarryOUT)
    );

    // Test sequences
    initial begin
        $dumpfile("subdmp.vcd");
        $dumpvars;
        // Apply test cases
        A = 4'b0001; B = 4'b0010; CarryIN = 0;#10;
        A = 4'b0101; B = 4'b0011; CarryIN = 1;#10;
        A = 4'b1000; B = 4'b0111; CarryIN = 0;#10;
        A = 4'b1111; B = 4'b0001; CarryIN = 1;#10;
        A = 4'b1000; B = 4'b1100; CarryIN = 0;#10;

        // Finish the test
        $finish;
    end
    
endmodule
