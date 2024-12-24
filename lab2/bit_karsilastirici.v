module bit_karsilastirici(
    input A,
    input B,
    output AkB,  // A < B
    output AeB,  // A == B
    output AbB   // A > B
);

wire A1, B1;


    // NOT Kapıları
    not n1 (A1, A);
    not n2 (B1, B);

    // AND Kapıları
    and a1 (AkB, A1, B);
    and a2 (AbB, A, B1);
    // NOR Kapısı
    nor nor1 (AeB, AbB, AkB);

endmodule
