module halfadder (
    input A,
    input B,
    output carry_out,
    output sum
);
    xor x1(sum, A, B);
    and a1(carry_out, A, B);
endmodule