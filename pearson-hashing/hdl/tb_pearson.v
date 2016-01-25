`timescale 1 ns / 10 ps
module tb_pearson();
//inputs
reg [63:0] key;
//output
wire [7:0] hash;

pearson
DUT(
        .key(key),
        .hash(hash)
);

initial
begin
        $monitor("key:%d | hash:%d", key, hash);
        //output should be 131 in decimal
        key[7:0]  = 8'd108; // l
        key[15:8] = 8'd101; // e
        key[23:16]= 8'd104; // h
        key[31:24]= 8'd111; // o
        key[39:32]= 8'd108; // l
        key[47:40]= 8'd108; // l
        key[55:48]= 8'd101; // e
        key[63:56]= 8'd104; // h

        $finish;
end

endmodule

