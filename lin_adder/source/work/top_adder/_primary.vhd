library verilog;
use verilog.vl_types.all;
entity top_adder is
    generic(
        N               : integer := 8
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        S               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end top_adder;
