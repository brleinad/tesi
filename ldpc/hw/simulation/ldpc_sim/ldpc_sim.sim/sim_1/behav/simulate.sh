#!/bin/bash -f
xv_path="/home/Xilinx/Vivado/2015.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim tb_generator_corrector_behav -key {Behavioral:sim_1:Functional:tb_generator_corrector} -tclbatch tb_generator_corrector.tcl -log simulate.log
