read_verilog ../src/gen_linear_part.v
read_verilog ../src/gen_nonlinear_part.v
read_verilog ../src/generator.v
read_verilog ../src/adder_cpe.v

compile -area_effort high
report_area > area_adder_cpe.rpt
report_cell  > cell_adder_cpe.rpt
#################################################################################
