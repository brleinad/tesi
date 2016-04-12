#!/bin/bash

for i in 6 7 8 
do
	perl decomposed_adder_generator.pl $i > gen_cla_decomposed.v
	cd syn/
	dc_shell -f run.tcl
	
