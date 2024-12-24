module multitb;

    // Girişler
    reg [3:0] A; // 4 bitlik A
    reg [3:0] B; // 4 bitlik B

    // Çıktı
    wire [7:0] result;

    // Çarpma modülünü örnekleyelim
    multi uut (
        .A(A),
        .B(B),
        .result(result)
    );

    // Test prosedürü
    initial begin
        $dumpfile("muldmp.vcd");
        $dumpvars;
        // Test 1: A = 6, B = 3
        A = 4'b0110;
        B = 4'b0011;
        #10;

        // Test 2: A = 15, B = 15
        A = 4'b1111;  // En büyük 4 bitlik sayılar
        B = 4'b1111;
        #10;

        // Test 3: A = 9, B = 2
        A = 4'b1001;
        B = 4'b0010;
        #10;

        // Test 4: A = 12, B = 7
        A = 4'b1100;
        B = 4'b0111;
        #10;


        // Test 6: A = 4, B = 8
        A = 4'b0100;
        B = 4'b1000;
        #10;

        // Test 7: A = 2, B = 1
        A = 4'b0010;
        B = 4'b0001;
        #10;

        // Test 8: A = 7, B = 5
        A = 4'b0111;
        B = 4'b0101;
        #10;

        // Test 9: A = 15, B = 0 (En büyük * en küçük)
        A = 4'b1111;
        B = 4'b0000;
        #10;

        // Test 11: A = 0, B = 0 (En küçük çarpma)
        A = 4'b0000;
        B = 4'b0000;
        #10;

        // Sonuçları görüntüle
        $display("Sonuçlar:");
        $display("A: %b, B: %b, Çarpım: %b", A, B, result);

        $stop;

    end

endmodule
