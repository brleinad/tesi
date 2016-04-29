//Filename: lin_adder.v (verilog)
// //Description: netlist for a linearised 8 bit adder, using the results from //the disjoint linearization from prof. Steinbach on the Xboole tool //This is the Linear Part of the circuit and it makes up most of it both in
//terms of area and number of gates.
//
//author: Daniel Rodas Bautista
//
module lin_part (
    a,
    b,
    nl, //outputs from the non-linear part
    s,
    r
);

`include "constants.v"


input [NBIT-1:0]     a,b;
input [3*NBIT-6:0]     nl; 
output [NBIT-1:0]    s;
output [NBIT-4:0]    r; 

wire [NBIT-3:0]       rt; //all the intermediate wires

// 0
assign s[0] = a[0] ^ b[0];
// 1
assign s[1] = a[1] ^ b[1] ^ nl[0];

genvar i;
generate 
for (i = 1; i < NBIT-1; i = i + 1)
    begin : XOR_LOOP
    assign rt[i-1] = nl[i*3-2] ^ nl[i*3-1] ^ nl[i*3];
    assign s[i+1] = a[i+1] ^ b[i+1] ^ rt[i-1];
    end
endgenerate

assign r = rt[NBIT-4:0];

endmodule

