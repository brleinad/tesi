date
analyze -f verilog { ../decomposed12bit_adder.v ../nonlinear_part12bit_adder.v ../linear_part12bit_adder.v}
elaborate gen_cla_decomposed

check_design > check_design.pre.log
set_max_delay 4 -from [all_inputs] to [all_outputs]
compile
report_timing > report_timing.log
check_design > check_design.post.log
report_area > report_area.log
write -h -o emanuel.ddc
date

quit

