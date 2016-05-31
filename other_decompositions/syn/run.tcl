set DESIGN_NAME "normal_adder"
#set DESIGN_NAME "h_adder"
set VARIANT_NAME "8bit"

#set RTL_SOURCE_FILES "../enc_lut.v ../dec_lut.v ../adder.v ../top_adder.v"
set RTL_SOURCE_FILES "../normal_adder.v"
#set RTL_SOURCE_FILES "../h_adder.v"

# call a script which sets up Design Compiler (same as writing the same commands in .synopsys_dc.setup file)
source dc_setup.tcl

# call a script which compiles the design
source dc.tcl

