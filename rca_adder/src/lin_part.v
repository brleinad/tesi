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

wire [NBIT-2:0]       u,t, rt; //all the intermediate wires

// 0
xor ( s[0], a[0], b[0]);
// 1
xor ( u[0], a[1], nl[0]);
xor ( s[1], u[0], b[1]);
//assign r[1] = nl[0]; Not really needed since the NL can generate it
/*// 2
xor ( t[0], nl[1], nl[3]);
xor ( rt[0], t[0],  nl[2]);
assign r[0] = rt[0]; //Actually it is r[2]
//assign r2 = rt[0]; //Actually it is r[2]
xor ( u[1], a[2], rt[0]);
xor ( s[2], u[1], b[2]);
*/
//Can be generalized from now on as follows:
genvar i;
generate 
for (i = 1; i < NBIT-1; i = i + 1)
    begin : XOR_LOOP
        xor ( t[i-1], nl[i*3-2], nl[i*3-1]);
        xor ( rt[i-1], t[i-1],  nl[i*3]);
        xor ( u[i], a[i+1], rt[i-1]);
        xor ( s[i+1], u[i], b[i+1]);
        if ( i < NBIT-2) 
            assign r[i-1] = rt[i-1]; 
            //output the carry out for all cases except the last one
            //else 
                //the last remainder can be seen as the MSB of the sum
                //assign s[i+1] = rt[i-1]; 
    end
endgenerate

endmodule

