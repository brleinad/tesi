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
ExecStep $xv_path/bin/xelab -wto 28f4df5272714fceb5fdb28d3f58c699 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_generator_corrector_behav xil_defaultlib.tb_generator_corrector xil_defaultlib.glbl -log elaborate.log
