//Filename: top_adder.v (verilog)
//
//Description: netlist for a linearised 8 bit adder, using the results from
//the disjoint linearization from prof. Steinbach on the Xboole tool
//This is the top structural module which connects the non-linear to the linear
//part
//
//author: Daniel Rodas Bautista
module decomposed_rca (a, b, s);
`include "constants.v"

input [NBIT-1:0] a,b;
output [NBIT-1:0] s;

wire [NBIT-4:0] r;
wire [NBIT*3-6:0] nl;

//connecting the non-linear part
nonlin_part NL_PART ( 
   .a (a[NBIT-2:0]),
   .b (b[NBIT-2:0]),
   .r (r),
   .nl (nl)
);
//connecting the linear part
lin_part L_PART ( 
   .a (a),
   .b (b),
   .nl (nl),
   .s (s),
   .r (r)
); 

endmodule
