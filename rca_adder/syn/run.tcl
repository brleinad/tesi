set DESIGN_NAME "decomposed_rca"
set VARIANT_NAME "4bit"

set RTL_SOURCE_FILES "../src/lin_part.v ../src/nonlin_part.v ../src/decomposed_rca.v"

# call a script which sets up Design Compiler (same as writing the same commands in .synopsys_dc.setup file)
source dc_setup.tcl

# call a script which compiles the design
source dc.tcl

