
    read_verilog [glob ./constants.v]
    read_verilog [glob ./adder.v]

    synth_design -top adder -part xc7z010clg400-1
    opt_design
    place_design
    route_design

    report_utilization -file ./reports/area/32bit_adder_util.rpt
    report_power -file ./reports/power/32bit_adder_power.rpt
    report_timing -file ./reports/timing/32bit_adder_timing.rpt
    exit

    }
