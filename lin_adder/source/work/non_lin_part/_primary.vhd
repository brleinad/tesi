library verilog;
use verilog.vl_types.all;
entity non_lin_part is
    generic(
        N               : integer := 8
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        r               : in     vl_logic_vector;
        nl              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end non_lin_part;
