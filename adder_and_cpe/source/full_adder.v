///////////////////////////////////////////////////////////////////////////////
// File Downloaded from http://www.nandland.com
///////////////////////////////////////////////////////////////////////////////
module full_adder 
  (
   a,
   b,
   cin,
   s,
   cout
   );
 
  input  a;
  input  b;
  input  cin;
  output s;
  output cout;
 
  wire   w_WIRE_1;
  wire   w_WIRE_2;
  wire   w_WIRE_3;
       
  assign w_WIRE_1 = a ^ b;
  assign w_WIRE_2 = w_WIRE_1 & cin;
  assign w_WIRE_3 = a & b;
 
  assign s   = w_WIRE_1 ^ cin;
  assign cout = w_WIRE_2 | w_WIRE_3;
 
 
  // FYI: Code above using wires will produce the same results as:
  // assign s   = a ^ b ^ cin;
	  // assign cout = (a ^ b) & cin) | (a & b);
 
  // Wires are just used to be explicit. 
   
endmodule // full_adder
