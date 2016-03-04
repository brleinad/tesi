set DESIGN_NAME "alu2"
set VARIANT_NAME ""

set RTL_SOURCE_FILES "./verilog_source/too_large.v"
# call a script which sets up Design Compiler
source dc_setup.tcl

# call a script which compiles the design
source dc_scripts/dc.tcl

quit
