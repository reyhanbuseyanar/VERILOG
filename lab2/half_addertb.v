module half_addertb ();
    reg A, B;
    wire sum, carry_out;

half_adder uut(
    .A(A), 
    .B(B), 
    .sum(sum), 
    .carry_out(carry_out)
);

initial begin
    $dumpfile("hadmp.vcd");
    $dumpvars;
    A = 1'b0; B = 1'b0; #10; 
    A = 1'b0; B = 1'b1; #10;
    A = 1'b1; B = 1'b0; #10;
    A = 1'b1; B = 1'b1; #10;
    $finish;
end
endmodule