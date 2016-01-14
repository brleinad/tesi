`timescale 1 ns / 10 ps // step and resolution for simulation

module tb_generator_corrector();

//inputs
wire [7:0] data_in;
wire [14:0] errors;

//outputs
reg [14:0] syndrome;
reg error_flag; //this will go to the corrector

//corrector is NOT tested here


generator
DUT0(
        .i(data_in),
        .c(codeword)
);

detector
DUT1(
        .c(codeword),
        .s(syndrome),
        .error(error_flag)
);

wire [14:0] codeword, channel_codeword;

//channel_codeword = xor (codeword, errors);
// bit-wise XOR to simulate and error 
channel_codeword = codeword ^ errors;

initial
begin
        data_in = 0;
        errors = 0;
        #3
end


endmodule
