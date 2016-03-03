`timescale 1 ns / 10 ps

module tb_cla_adder();

parameter NBIT = 4;
//inputs
reg [NBIT-1:0] a,b;
reg cin;
//outputs
wire [NBIT-1:0] s;
wire cout;


cla_adder DUT (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
);

initial 
begin
        $monitor("A:%d B:%d S:%d Cout:%d", a, b, s, cout);
        a = 0;
        b = 0;
        cin = 0;
        #10

        a = 1;
        b = 2;
        #10
        a = 5;
        #5 
        b = 11;

end

endmodule
