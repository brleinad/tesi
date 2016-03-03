library verilog;
use verilog.vl_types.all;
entity cla_decomposed is
    generic(
        NBIT            : integer := 4;
        NNL             : integer := 56
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        c_in            : in     vl_logic;
        s               : out    vl_logic_vector;
        c_out           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NBIT : constant is 1;
    attribute mti_svvh_generic_type of NNL : constant is 1;
end cla_decomposed;
