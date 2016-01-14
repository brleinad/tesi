//Filename: top_adder_tb.v (verilog, non-synthesizable) 
//
//Description: Test-bench for the linearized adder
//
//author: Daniel Rodas Bautista
//
module top_adder_tb  ; 
 
parameter N = 8; //number of bits
  reg  [N-1:0]  a   ; 
  reg  [N-1:0]  b   ; 
  wire  [N:0]  s   ; 
  top_adder  
   DUT  ( 
       .A (a ) ,
      .B (b ) ,
      .S (s ) ); 

initial
begin
        a=8'b00000000;
        b=8'b00000000;
        #1000
        a=8'b00000100;
        b=8'b00000010;
        #1000
        a=8'b00000101;
        b=8'b00000001;
        #1000
        a=8'b00000011;
        b=8'b00000001;
        #1000
        a=8'b00001011;
        b=8'b00000011;
        #1000
        a=8'b00001111;
        b=8'b00001111;
        #1000
        a=8'b11111111;
        b=8'b11111111;
        #1000
        //test bench for a 4 bit adder
       /* a=4'b0000;
        b=4'b0000;
        #1000
        a=4'b0100;
        b=4'b0010;
        #1000
        a=4'b0101;
        b=4'b0001;
        #1000
        a=4'b0011;
        b=4'b0001;
        #1000
        a=4'b1011;
        b=4'b0011;
        #1000
        a=4'b1111;
        b=4'b1111;
        #1000*/
        $stop;
end

endmodule

