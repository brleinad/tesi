`timescale 1 ns / 10 ps

module cla_8bit_tb();

parameter NBIT = 8; //Number of bits of the adder
 
reg [NBIT-1:0]  a,b;
wire [NBIT-1:0] s;
wire c_out;


cla_8bit
DUT(
        .a(a),
        .b(b),
        .s(s),
        .c_out(c_out)
);

initial
begin
        $monitor("A:%d\tB:%d\tS:%d\tCout:%d",a,b,s,c_out);
        a <= 0;
        b <= 0;
        #3
        a <= 2;
        #3
        b <= 3;
        #3
        a <= 5;
        #3
        b <= 10; 
        #3
        a <= 9;
        #3
        b <= 1;
        #3
        b <= 20; 
        #3
        a <= 30;
        #3
        b <= 34;
        #3
        a <= 128;
        #3
        b <= 127;
        #3
        b <= 128;
end
endmodule
