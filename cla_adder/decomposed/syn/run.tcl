set DESIGN_NAME "gen_cla_decomposed"
#set VARIANT_NAME "bit_generated"
set VARIANT_NAME "12bit"

#set RTL_SOURCE_FILES "../src/gen_linear_part.v ../src/gen_nonlinear_part.v ../src/gen_cla_decomposed.v"
set RTL_SOURCE_FILES "../gen_linear_part.v ../gen_nonlinear_part.v ../gen_cla_decomposed.v"


# call a script which sets up Design Compiler (same as writing the same commands in .synopsys_dc.setup file)
source dc_setup.tcl

# call a script which compiles the design
source dc.tcl

