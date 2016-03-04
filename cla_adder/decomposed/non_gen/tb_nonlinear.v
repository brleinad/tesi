module tb_nonlinear();

parameter NBIT = 4; // number of bits of the adder
parameter NNL=56; //Number of bits of the non-linear outputs

//inputs
reg [NBIT-1:0] a,b;
reg c_in;
//outputs
wire [NNL-1:0] nonlin;

//nonlinear_part
gen_nonlinear_part
DUT (
        .a (a),
        .b (b),
        .c (c_in),
        .n (nonlin)
);

initial 
begin
        $monitor("A:%d\t B:%d\t Cin:%d\t NonLinear:%d",a,b,c_in,nonlin);
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
