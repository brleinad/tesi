`timescale 1 ns / 10 ps
module tb_gen_cla_decomposed();

parameter NBIT = 16; //Number of bits of the adder
parameter NNL=2**(NBIT+1)-NBIT-2; //Number of bits of the non-linear outputs
 
//inputs
reg [NBIT-1:0]  a,b;
//reg             c_in;
// outputs
wire [NBIT-1:0] s;
//wire c_out;


gen_cla_decomposed
DUT(
        .a(a),
        .b(b),
        //.c_in(c_in),
        .s(s)//,
        //.c_out(c_out)
);

initial
begin
        //$monitor("A:%d\tB:%d\tS:%d\tCout:%d",a,b,s,c_out);
        $monitor("A:%d\tB:%d\tS:%d\t%b",a,b,s,s);
        a <= 0;
        //c_in <= 0;
        b <= 0;
        #3
        a <= 2;
        #3
        b <= 3;
        /*
        #3
        a <= 5;
        #3
        b <= 10; //overflow as expected
        #3
        a <= 6;
        #3
        b <= 1;
        #3
        a <= 16;
        #3
        b <= 10;
        #3
        a <= 24;
        #3
        b <= 13;
        #3
        */
        a <= 124;
        #3
        b <= 15;
        #3
        b <= 3;
        #3
        a <= 54;
        #3
        b <= 43;
end
endmodule
