module adder (a,b,s);

`include "constants.v"

input [NBIT-1:0] a,b;
output [NBIT:0] s;

assign s = a + b;

always @(*)
begin
    casex({a,b})
        {0,0} : s = 0;
        {0,0} : s = 0;
    endcase
end
endmodule
