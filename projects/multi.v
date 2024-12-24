module multi(
    input [3:0] A, B,           // A ve B girişleri 4 bitlik iki sayı. Çarpılacak sayılar.
    output [7:0] P        // Çıktı: 8 bitlik çarpma sonucu. İki 4 bitlik sayının çarpması.
);

// Geçici sonuçlar için wire'lar (Ara sonuçlar) tanımlanıyor
wire [7:0] partial[3:0];       // partial[i]: Her çarpma sonucunun saklandığı 8 bitlik wire dizisi.
wire [7:0] sum1, sum2, sum3;   // Toplamalar için geçici 8 bit wire'lar. Her bir toplam sonucu burada tutulacak.

// A[0] ile B'yi çarpma sonucu, kaydırma yapılmaz
assign partial[0] = A[0] ? {4'b0000, B} : 8'b0;  // A[0] 1 ise, B'nin değerini kaydırma yapmadan kullanır.

 // A[1] ile B'yi çarpma sonucu, B'yi bir bit sola kaydırır
assign partial[1] = A[1] ? {3'b000, B, 1'b0} : 8'b0;  // A[1] 1 ise, B'yi 1 bit sola kaydırır

 // A[2] ile B'yi çarpma sonucu, B'yi iki bit sola kaydırır
assign partial[2] = A[2] ? {2'b00, B, 2'b00} : 8'b0;  // A[2] 1 ise, B'yi 2 bit sola kaydırır ve 2 sıfır ekler.

 // A[3] ile B'yi çarpma sonucu, B'yi üç bit sola kaydırır
assign partial[3] = A[3] ? {1'b0, B, 3'b000} : 8'b0;  // A[3] 1 ise, B'yi 3 bit sola kaydırır ve 3 sıfır ekler.

 // İlk toplama: partial[0] ile partial[1] birleştiriliyor
fulladder FA1 (.A(partial[0][0]), .B(partial[1][0]), .Cin(1'b0), .S(sum1[0]), .Cout(sum1[1])); 
fulladder FA1_2 (.A(partial[0][1]), .B(partial[1][1]), .Cin(sum1[1]), .S(sum1[2]), .Cout(sum1[3])); 
fulladder FA1_3 (.A(partial[0][2]), .B(partial[1][2]), .Cin(sum1[3]), .S(sum1[4]), .Cout(sum1[5]));
fulladder FA1_4 (.A(partial[0][3]), .B(partial[1][3]), .Cin(sum1[5]), .S(sum1[6]), .Cout(sum1[7]));

// İkinci toplama: partial[2] ile sum1 birleştiriliyor
fulladder FA2_1 (.A(sum1[0]), .B(partial[2][0]), .Cin(1'b0), .S(sum2[0]), .Cout(sum2[1]));
fulladder FA2_2 (.A(sum1[1]), .B(partial[2][1]), .Cin(sum2[1]), .S(sum2[2]), .Cout(sum2[3]));
fulladder FA2_3 (.A(sum1[2]), .B(partial[2][2]), .Cin(sum2[3]), .S(sum2[4]), .Cout(sum2[5]));
fulladder FA2_4 (.A(sum1[3]), .B(partial[2][3]), .Cin(sum2[5]), .S(sum2[6]), .Cout(sum2[7]));

// Üçüncü toplama: partial[3] ile sum2 birleştiriliyor
fulladder FA3_1 (.A(sum2[0]), .B(partial[3][0]), .Cin(1'b0), .S(result[0]), .Cout(result[1]));
fulladder FA3_2 (.A(sum2[1]), .B(partial[3][1]), .Cin(result[1]), .S(result[2]), .Cout(result[3]));
fulladder FA3_3 (.A(sum2[2]), .B(partial[3][2]), .Cin(result[3]), .S(result[4]), .Cout(result[5]));
fulladder FA3_4 (.A(sum2[3]), .B(partial[3][3]), .Cin(result[5]), .S(result[6]), .Cout(result[7]));

endmodule

