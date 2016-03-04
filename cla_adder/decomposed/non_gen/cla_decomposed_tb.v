`timescale 1 ns / 10 ps

module cla_decomposed_tb();

parameter NBIT = 4; //Number of bits of the adder
parameter NNL= 56; //Number of bits of the non linear input
 
reg [NBIT-1:0]  a,b;
reg             c_in;
wire [NBIT-1:0] s;
wire c_out;


cla_decomposed
DUT(
        .a(a),
        .b(b),
        .c_in(c_in),
        .s(s),
        .c_out(c_out)
);

initial
begin
        $monitor("A:%d\tB:%d\tS:%d\tCout:%d",a,b,s,c_out);
        a <= 0;
        c_in <= 0;
        b <= 0;
        #3
        a <= 2;
        #3
        b <= 3;
        #3
        a <= 5;
        #3
        b <= 10; //overflow as expected
        #3
        a <= 6;
        #3
        b <= 1;
end
endmodule
