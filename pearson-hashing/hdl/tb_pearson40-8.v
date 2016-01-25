`timescale 1 ns / 10 ps
module tb_pearson();
//inputs
//reg [63:0] key;
reg [39:0] key;
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
        key[31:0] = 0; //a in ascii
        key[39:32]= 8'd97; // h
        //output should be 113 in decimal
        #10
        key[7:0]  = 8'd111; // o
        key[15:8] = 8'd108; // l
        key[23:16]= 8'd108; // l
        key[31:24]= 8'd101; // e
        key[39:32]= 8'd104; // h
        //key[63:40]= 24'd0; // o
        /*
        key[23:0] = 24'd0;  // 0
        key[31:24]= 8'd111; // o
        key[39:32]= 8'd108; // l
        key[47:40]= 8'd108; // l
        key[55:48]= 8'd101; // e
        key[63:56]= 8'd104; // h
        */
       #10
        /*
        key[7:0]  = 8'd101; // o
        key[15:8] = 8'd114; // l
        key[23:16]= 8'd111; // l
        key[31:24]= 8'd109; // e
        */
        //key[39:32]= 8'd0; // h

        $finish;
end

endmodule

