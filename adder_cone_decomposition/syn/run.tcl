set DESIGN_NAME "adder_P"
#set DESIGN_NAME "adder7bit_P"
set VARIANT_NAME "14bit"
#set VARIANT_NAME ""

#set RTL_SOURCE_FILES "../adder.v"
set RTL_SOURCE_FILES "../adder.v ../parity.v ../adder_P.v"
# call a script which sets up Design Compiler (same as writing the same commands in .synopsys_dc.setup file)
source dc_setup.tcl

# call a script which compiles the design
source dc.tcl
exit
