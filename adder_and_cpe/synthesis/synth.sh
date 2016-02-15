#!/bin/bash


read_verilog  ../source/gen_linear_part.v
read_verilog  ../source/gen_nonlinear_part.v
read_verilog  ../source/generator.v
read_verilog  ../source/detector.v
read_verilog  ../source/corrector.v
read_verilog  ../source/adder_cpe_dec.v

compile -area_effort high -scan -gate_clock 

report_cell > cell_adder_CPE_dec.rpt

#adder_cpe.v
#corrector.v
#detector.v
#gen_cla_decomposed.v
#gen_linear_part.v
#gen_nonlinear_part.v
#generator.v
#tb_gen_cla_decomposed.v
#tb_generator_detector.v
