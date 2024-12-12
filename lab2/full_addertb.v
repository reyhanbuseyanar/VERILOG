module full_addertb ();
reg r1,r2,r3;
wire w1,w2;

full_adder uut(
    .A(r1),
    .B(r2),
    .Cin(r3),
    .S(w1),
    .Cout(w2)
);

initial begin
    $dumpfile("fdmp.vcd");
    $dumpvars;
    r1= 1'b0;   r2= 1'b0;   r3= 1'b0; #10; 
    r1= 1'b0;   r2= 1'b0;   r3= 1'b1; #10;
    r1= 1'b0;   r2= 1'b1;   r3= 1'b0; #10;
    r1= 1'b0;   r2= 1'b1;   r3= 1'b1; #10;
    r1= 1'b1;   r2= 1'b0;   r3= 1'b0; #10; 
    r1= 1'b1;   r2= 1'b0;   r3= 1'b1; #10;
    r1= 1'b1;   r2= 1'b1;   r3= 1'b0; #10;
    r1= 1'b1;   r2= 1'b1;   r3= 1'b1; #10;

    $display(w1);
    $display(w2);
    $finish;
   

end

endmodule