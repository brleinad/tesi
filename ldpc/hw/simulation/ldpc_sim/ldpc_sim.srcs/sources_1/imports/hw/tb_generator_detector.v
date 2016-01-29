`timescale 1 ns / 10 ps // step and resolution for simulation

module tb_generator_corrector();

//inputs
reg [6:0] data_in;
reg [14:0] errors;

//outputs
//reg [14:0] syndrome;
//reg error_flag; //this will go to the corrector
wire [14:0] syndrome;
wire error_flag; //this will go to the corrector

//corrector is NOT tested here

wire [14:0] codeword, channel_codeword;

generator
DUT0(
        .i(data_in),
        .c(codeword)
);

detector
DUT1(
        .c(channel_codeword),
        .s(syndrome),
        .error(error_flag)
);


//channel_codeword = xor (codeword, errors);
// bit-wise XOR to simulate and error 
assign channel_codeword = codeword ^ errors;

initial
begin
        $monitor("input:%b\t error:%b\t codeword:%b\t syndrome:%b\t",data_in, errors, codeword, syndrome);
        //&$monitor("input:%b\t codeword:%b\t ",data_in, codeword);
        data_in = 0;
        errors = 0;
        #10
        data_in = 5;
        #10
        errors = 3;
        #10
        data_in = 69;
        #10
        errors = 33;
end

endmodule
