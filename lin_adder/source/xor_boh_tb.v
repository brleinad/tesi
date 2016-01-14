module xor_boh_tb  ; 
 
  reg    a   ; 
  reg    b   ; 
  wire    s   ; 
  xor_boh  
   DUT  ( 
       .a (a ) ,
      .b (b ) ,
      .s (s ) ); 

initial
begin
        a=1'b0;
        b=1'b0;
        #1000 //time unit is pico seconds
        a=1'b0;
        b=1'b1;
        #1000 //wait for 1 ns
        a=1'b1;
        b=1'b0;
        #1000
        a=1'b1;
        b=1'b1;
        #1000
        $stop;
end
endmodule

