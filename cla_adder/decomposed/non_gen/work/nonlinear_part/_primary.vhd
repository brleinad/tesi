library verilog;
use verilog.vl_types.all;
entity nonlinear_part is
    generic(
        NBIT            : integer := 4;
        NNL             : integer := 56
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        c               : in     vl_logic_vector(0 downto 0);
        n               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NBIT : constant is 1;
    attribute mti_svvh_generic_type of NNL : constant is 1;
end nonlinear_part;
