
read_verilog [glob ../src/constants.v]
read_verilog [glob ../src/nonlin_part.v]
read_verilog [glob ../src/lin_part.v]
read_verilog [glob ../src/decomposed_rca.v]

synth_design -top decomposed_rca -part xc7z010clg400-1
opt_design
place_design
route_design

report_utilization -file ./reports/area/32bit_decomposed_rca_util.rpt
report_power -file ./reports/power/32bit_decomposed_rca_power.rpt
report_timing -file ./reports/timing/32bit_decomposed_rca_timing.rpt
exit

}
