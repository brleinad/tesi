library verilog;
use verilog.vl_types.all;
entity xor_boh is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        s               : out    vl_logic
    );
end xor_boh;
