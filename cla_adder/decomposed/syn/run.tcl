#set DESIGN_NAME "gen_cla_decomposed"
#set DESIGN_NAME "gen_nonlinear_part"
set DESIGN_NAME "gen_linear_part"
#set VARIANT_NAME "bit_generated"
set VARIANT_NAME "16bit"

#set RTL_SOURCE_FILES "../gen_nonlinear_part.v" 
set RTL_SOURCE_FILES "../gen_linear_part.v" 
#set RTL_SOURCE_FILES "../gen_linear_part.v ../gen_nonlinear_part.v ../gen_cla_decomposed.v"
#set RTL_SOURCE_FILES " ../decomposed12bit_adder.v ../nonlinear_part12bit_adder.v ../linear_part12bit_adder.v"


# call a script which sets up Design Compiler (same as writing the same commands in .synopsys_dc.setup file)
source dc_setup.tcl

# call a script which compiles the design
source dc.tcl

