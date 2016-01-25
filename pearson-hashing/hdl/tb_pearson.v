`timescale 1 ns / 10 ps
module tb_pearson();
//inputs
reg [39:0] key;
//output
wire [7:0] hash;

pearson
DUT(
        .key_byte(key),
        .hash(hash)
);

initial
begin
        $monitor("key:%d | hash:%d", key, hash);
        key = 40'd97; //a in ascii
        #10
        key[7:0]  = 8'd104; // h
        key[15:8] = 8'd101; // e
        key[23:16]= 8'd108; // l
        key[31:24]= 8'd108; // l
        key[39:32]= 8'd111; // o
        //key[47:40]= 8'd111;
        //output should be 113 in decimal
        $finish;
end

endmodule

