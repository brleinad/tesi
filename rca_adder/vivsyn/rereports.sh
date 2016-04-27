#!/bin/bash

design=decomposed_rca
reportsDir=./reports

for bit in {14..18}
do
    echo "doing bit ${bit}..."
    echo "parameter NBIT = ${bit};" > ../src/constants.v

    echo "
    read_verilog [glob ../src/constants.v]
    read_verilog [glob ../src/nonlin_part.v]
    read_verilog [glob ../src/lin_part.v]
    read_verilog [glob ../src/decomposed_rca.v]

    synth_design -top $design -part xc7z010clg400-1
    opt_design
    place_design
    route_design

    report_utilization -file $reportsDir/area/${bit}bit_${design}_util.rpt
    report_power -file $reportsDir/power/${bit}bit_${design}_power.rpt
    report_timing -file $reportsDir/timing/${bit}bit_${design}_timing.rpt
    exit

    }"  > synth_rca.tcl

    vivado -mode tcl -source synth_rca.tcl > ./logs/${bit}bit_rca_synth.log
done
