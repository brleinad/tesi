#!/bin/bash

design=normal_adder
reportsDir=./reports

if [ ! -f "./${design}.v" ]; then
    echo "Desgin $design Doesn't exit"
    exit
fi

if [ ! -d "$VIVADO/bin/" ]; then
    echo "No Vivado installed"
    exit
fi

if [ ! -d "$reportsDir" ]; then
    echo "report directories don't exit.. creating them..."
    mkdir $reportsDir
    mkdir $reportsDir/area
    mkdir $reportsDir/power
    mkdir $reportsDir/timing
fi

for bit in {4..32}
do
    echo "doing bit ${bit}..."
    echo "parameter NBIT = ${bit};" > constants.v

    echo "
    read_verilog [glob ./constants.v]
    read_verilog [glob ./${design}.v]

    synth_design -top $design -part xc7z010clg400-1 -no_lc
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
