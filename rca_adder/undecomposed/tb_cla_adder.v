`timescale 1 ns / 10 ps

module tb_cla_adder();
`include "constants.v"
//inputs
reg [NBIT-1:0] a,b;
//outputs
wire [NBIT-1:0] s;


cla_adder DUT (
        .a(a),
        .b(b),
        //.cin(cin),
        //.cout(cout)
        .s(s)
);

initial 
begin
        $monitor("A:%d B:%d S:%d ", a, b, s);
        a = 0;
        b = 0;
        #10

        a = 1;
        b = 2;
        #10
        a = 5;
        #5 
        b = 11;
        #5 
        a = 55;
        #5 
        b = 110;

end

endmodule
