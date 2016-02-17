module ripple_carry_adder (a,b,cout,s);
  parameter NB = 7;

input [NB-1:0] a;
input [NB-1:0] b;
output cout;
output [NB-1:0] s;
     
  wire [NB:0]     carry;
  //wire [NB-1:0]   sum;
   
  // No carry input on first full adder  
  assign carry[0] = 1'b0;        
   
  genvar             ii;
 generate 
    for (ii=0; ii<NB; ii=ii+1) 
      begin: RCA
        full_adder FA
            ( 
              .a(a[ii]),
              .b(b[ii]),
              .cin(carry[ii]),
              .s(s[ii]),
              .cout(carry[ii+1])
              );
      end
  endgenerate

assign cout = carry[NB];
   
 
endmodule // ripple_carry_adder

