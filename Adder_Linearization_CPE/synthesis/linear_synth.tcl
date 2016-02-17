#read_verilog ../src/generator.v
#read_verilog ../src/gen_linear_part.v
read_verilog ../src/linear.v


#source dc_scripts/mask_library_tcbn65gpluswc_AOI.tcl

compile -incremental_mapping

write -hierarchy -format verilog -output linear_mapped.v

