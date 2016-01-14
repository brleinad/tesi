library verilog;
use verilog.vl_types.all;
entity adder is
    generic(
        N               : integer := 8
    );
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        nl              : in     vl_logic_vector(6 downto 0);
        s               : out    vl_logic_vector(4 downto 0);
        r               : out    vl_logic_vector(0 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end adder;
