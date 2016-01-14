library verilog;
use verilog.vl_types.all;
entity lin_adder is
    generic(
        N               : integer := 8
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        nl              : in     vl_logic_vector;
        s               : out    vl_logic_vector;
        r               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end lin_adder;
