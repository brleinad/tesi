#!/bin/bash

for bit in {4..16}
do

    perl decomposed_adder_generator.pl $(bit) > gen_cla_decomposed.v
    cd syn/ # go to synthesis
    # generate synthesis script
    echo "
    set DESIGN_NAME "gen_cla_decomposed"
    set VARIANT_NAME "${bit}bit"

    set RTL_SOURCE_FILES "../gen_linear_part.v ../gen_nonlinear_part.v ../gen_cla_decomposed.v"


    # call a script which sets up Design Compiler (same as writing the same commands in .synopsys_dc.setup file)
    source dc_setup.tcl

    # call a script which compiles the design
    source dc.tcl" > run.tcl

    #synthesize
    dc_shell -f run.tcl > dc.log
    cd ../ #go back
done
