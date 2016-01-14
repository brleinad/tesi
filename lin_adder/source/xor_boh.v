//Test file to play around with verilog
//
module xor_boh(a,b, s);
  input a,b;
  output s;
  
//  assign s = a^b;
//
xor (s,a,b); //using aprimitive 

endmodule
