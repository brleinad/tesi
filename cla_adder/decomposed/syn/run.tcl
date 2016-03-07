set DESIGN_NAME "gen_cla_decomposed"
set VARIANT_NAME "8bit"

# set RTL_SOURCE_FILES "../src/verilog/pair.v"
set RTL_SOURCE_FILES [
../src/constants.v
../src/gen_cla_decomposed.v
../src/gen_linear_part.v
../src/gen_nonlinear_part.v
../src/tb_gen_cla_decomposed.v
]

#set RTL_SOURCE_FILES "../src/cla_adder.v"

#proc set_rtl_source_files {sub_folder} \
#{
#	global RTL_SOURCE_FILES
#	set RTL_SOURCE_FILES [glob ../src/cones/${sub_folder}/*.v]
#}
#set_rtl_source_files out

# call a script which sets up Design Compiler (same as writing the same commands in .synopsys_dc.setup file)
source dc_setup.tcl

# call a script which compiles the design
source dc.tcl

