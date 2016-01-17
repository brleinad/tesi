`timescale 1 ns / 10 ps // time step and resolution
module tb_RM();
//input:
reg [15:0] rec;
//output:
wire [10:0] dec;

RM_dec DUT (
        .rec(rec),
        .dec(dec)
);

initial
begin
        $monitor("rec:%b \t dec:%b",rec,dec);
        rec = 16'b0;
        #10
        rec = 16'd7;
        #10
        rec = 16'd4;
        #10
        rec = 16'd23;
end
endmodule


