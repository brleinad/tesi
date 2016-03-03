library verilog;
use verilog.vl_types.all;
entity cla_8bit_tb is
    generic(
        NBIT            : integer := 8
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NBIT : constant is 1;
end cla_8bit_tb;
