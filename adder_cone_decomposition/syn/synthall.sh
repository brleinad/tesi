#!/bin/bash

for bit in {4..16}
do
echo "parameter NBIT=${bit};" > ../constants.v
# generate synthesis script
echo "
set DESIGN_NAME \"adder\"
set VARIANT_NAME \"${bit}bit\"

set RTL_SOURCE_FILES \"../adder.v\"
# call a script which sets up Design Compiler (same as writing the same commands in .synopsys_dc.setup file)
source dc_setup.tcl

# call a script which compiles the design
source dc.tcl
exit" > run.tcl

#synthesize
echo "synthesizing adder of  $bit bits..."
dc_shell -f run.tcl #> dc.log
echo "finished synthesizing adder of  $bit bits..."

done


