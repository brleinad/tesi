library verilog;
use verilog.vl_types.all;
entity RM_dec is
    port(
        rec             : in     vl_logic_vector(15 downto 0);
        dec             : out    vl_logic_vector(10 downto 0)
    );
end RM_dec;
