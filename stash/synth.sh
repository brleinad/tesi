#!/bin/bash


read_verilog  ../source/simple_adder.v
read_verilog  ../source/gen_linear_part.v
read_verilog  ../source/gen_nonlinear_part.v
read_verilog  ../source/generator.v
read_verilog  ../source/detector.v
read_verilog  ../source/corrector.v
read_verilog  ../source/adder_cpe_dec.v

#source dc_scripts/mask_library_tcbn65gpluswc_AOI.tcl

compile -area_effort high -scan -gate_clock 
#compile -incremental_mapping

report_cell > cell_adder_cpe_dec.rpt

#adder_cpe.v
#corrector.v
#detector.v
#gen_cla_decomposed.v
#gen_linear_part.v
#gen_nonlinear_part.v
#generator.v
#tb_gen_cla_decomposed.v
#tb_generator_detector.v
