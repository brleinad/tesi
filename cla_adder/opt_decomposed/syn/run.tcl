#set DESIGN_NAME "gen_cla_decomposed"
set DESIGN_NAME "nand2"
#set VARIANT_NAME "17bit"
set VARIANT_NAME ""

set RTL_SOURCE_FILES "../nand2.v" 
#set RTL_SOURCE_FILES "../gen_linear_part.v ../gen_nonlinear_part.v ../gen_cla_decomposed.v"


# call a script which sets up Design Compiler (same as writing the same commands in .synopsys_dc.setup file)
source dc_setup.tcl

# call a script which compiles the design
source dc.tcl

