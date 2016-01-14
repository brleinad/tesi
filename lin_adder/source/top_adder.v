//Filename: top_adder.v (verilog)
//
//Description: netlist for a linearised 8 bit adder, using the results from
//the disjoint linearization from prof. Steinbach on the Xboole tool
//This is the top structural module which connects the non-linear to the linear
//part
//
//author: Daniel Rodas Bautista
//
//include "globals.vh"
module top_adder (A, B, S);

parameter N = 32; //number of bits
input [N-1:0] A,B;
output [N:0] S;

wire [N-4:0] r;
wire [N*3-6:0] nl;

//connecting the non-linear part
non_lin_part NL_part ( 
   .a (A[N-2:0]),
   .b (B[N-2:0]),
   .r (r),
   .nl (nl)
);
//connecting the linear part
lin_adder L_part ( 
   .a (A),
   .b (B),
   .nl (nl),
   .s (S),
   .r (r)
); 

endmodule
