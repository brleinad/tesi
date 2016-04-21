//Filename: top_adder_tb.v (verilog, non-synthesizable) 
//
//Description: Test-bench for the linearized adder
//
//author: Daniel Rodas Bautista
//
`timescale 1 ns / 10 ps
module tb_top_adder(); 
`include "constants.v"
 
  reg  [NBIT-1:0]  a   ; 
  reg  [NBIT-1:0]  b   ; 
  wire  [NBIT-1:0]  s   ; 
  top_adder  
   DUT  ( 
       .A (a ) ,
      .B (b ) ,
      .S (s ) ); 

initial
begin
    $monitor("A:%d\t B:%d\t S:%d\t%b ",a,b,s,s);
    a = 0;
    b = 0;
    #10
    a = 2;
    #10
    b = 3;
    #10
    a = 7;
    #10
    b = 8;
    $finish;
end

endmodule

