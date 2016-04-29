#!/bin/bash

for bit in {4..16}
do

    echo "parameter NBIT=${bit};" >> ../src/constants.v
    # generate synthesis script
    echo "
    set DESIGN_NAME "decomposed_rca"
    set VARIANT_NAME "${bit}bit"

    set RTL_SOURCE_FILES "../src/lin_part.v ../src/nonlin_part.v ../src/decomposed_rca.v"
    # call a script which sets up Design Compiler (same as writing the same commands in .synopsys_dc.setup file)
    source dc_setup.tcl

    # call a script which compiles the design
    source dc.tcl" > run.tcl

    #synthesize
    dc_shell -f run.tcl > dc.log
done
