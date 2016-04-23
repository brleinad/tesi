set reportsDir ./reports
set sources ../src
#set bit 4
set design decomposed_rca

for {set bit 4} {$bit < 32} {incr bit} {

exec echo "parameter NBIT = ${bit};" > ../src/constants.v

#setup sources
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

}
