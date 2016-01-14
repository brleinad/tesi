//Filename: non_lin_part.v (verilog)
//
//Description: netlist for a linearised 8 bit adder, using the results from
//the disjoint linearization from prof. Steinbach on the Xboole tool
// This is the non-linear part 
//author: Daniel Rodas Bautista
//
//
//'include "globals.vh"
module non_lin_part( a,b,r,nl);

parameter N = 32; //number of bits

input  [N-2:0] a,b; //the same inputs as for the overall adder
//Note that the MSB of the inputs is not used in the non-linear part
input [N-4:0] r; //the input from the linear part (semi-carry outs)
output [3*N-6:0] nl; //The non-linear output
//for each bit there are 3 non-linear outputs except for the first two bits

wire r1;

// 1
and ( r1, a[0], b[0]);
assign nl[0] = r1;
// 2
and (nl[1], a[1], b[1]);
and (nl[2], a[1], r1);
and (nl[3], b[1], r1);
// 3
/*and ( nl[4], a[2], b[2]);
and ( nl[5], a[2], r[0]); //it is r2
and ( nl[6], a[2], r[0]);*/
//can be generalized from now on as follows:
genvar i;
generate
for (i=2 ; i<N-1 ; i=i+1)
begin : AND_LOOP
        and (nl[i*3-2], a[i], b[i]);
        and (nl[i*3-1], a[i], r[i-2]);
        and (nl[i*3], b[i], r[i-2]);
end
endgenerate


endmodule

