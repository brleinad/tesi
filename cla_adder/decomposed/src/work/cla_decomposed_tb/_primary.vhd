library verilog;
use verilog.vl_types.all;
entity cla_decomposed_tb is
    generic(
        NBIT            : integer := 4;
        NNL             : integer := 56
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NBIT : constant is 1;
    attribute mti_svvh_generic_type of NNL : constant is 1;
end cla_decomposed_tb;
