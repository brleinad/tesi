module pearson(key, hash);

//64 bits to 8 bits hash
//input [63:0] key_byte; 
//input [63:0] key;  // input key 
input [39:0] key;  // input key 
output [7:0] hash; // output of hash function

wire [7:0] h0,h1,h2,h3,h4,h5; // intermideate hashes
wire [7:0] i0, i1, i2, i3, i4, i5, i6, i7, i8,  //LUT indeces
        lut0, lut1, lut2, lut3, lut4, lut5, lut6, lut7, lut8; //LUT outputs

assign h0 = 0;
/*
assign i1 = h0 ^ key[63:56];
assign h1 = lut1;

assign i2 = h1 ^ key[55:48];
assign h2 = lut2;

assign i3 = h2 ^ key[47:40];
assign h3 = lut3;

assign i4 = h3 ^ key[39:32];
assign h4 = lut4;

assign i5 = h4 ^ key[31:24];
assign h5 = lut5;

assign i6 = h5 ^ key[23:16];
assign h6 = lut6;

assign i7 = h6 ^ key[15:8];
assign h7 = lut7;

assign i8 = h7 ^ key[7:0];
assign h8 = lut8;
*/

assign i1 = h0 ^ key[39:32];
assign h1 = lut1;

assign i2 = h1 ^ key[31:24];
assign h2 = lut2;

assign i3 = h2 ^ key[23:16];
assign h3 = lut3;

assign i4 = h3 ^ key[15:8];
assign h4 = lut4;

assign i5 = h4 ^ key[7:0];
assign h5 = lut5;

/*
assign i6 = h5 ^ key[47:40];
assign h6 = lut6;

assign i7 = h6 ^ key[55:48];
assign h7 = lut7;

assign i8 = h7 ^ key[63:56];
assign h8 = lut8;
*/

//final output is taken from last hash
assign hash = h5;

// LUT
//lut LUT0 (.index(i0), .lut_out(lut0));
lut LUT1 (.index(i1), .lut_out(lut1));
lut LUT2 (.index(i2), .lut_out(lut2));
lut LUT3 (.index(i3), .lut_out(lut3));
lut LUT4 (.index(i4), .lut_out(lut4));
lut LUT5 (.index(i5), .lut_out(lut5));
lut LUT6 (.index(i6), .lut_out(lut6));
lut LUT7 (.index(i7), .lut_out(lut7));
lut LUT8 (.index(i8), .lut_out(lut8));

endmodule
