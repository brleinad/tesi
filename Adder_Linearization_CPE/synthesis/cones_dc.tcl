#################################################################################
# Derived from Design Compiler Reference Methodology Script for Top-Down Flow
# Script: dc.tcl
# Version: B-2008.09-SP4 (Mar. 25, 2009)
# Copyright (C) 2007, 2008, 2009 Synopsys All rights reserved.
#################################################################################

#################################################################################
# Setup for Formality verification
#
# SVF should always be written to allow Formality verification
# for advanced optimizations.
#################################################################################

set_svf ${RESULTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}_cones.svf

#################################################################################
# Setup SAIF Name Mapping Database
#
# Include an RTL SAIF for better power optimization and analysis.
#
# saif_map should be issued prior to RTL elaboration to create a name mapping
# database for better annotation.
################################################################################

saif_map -start

#################################################################################
# Read in the RTL Design
#
# Read in the RTL source files or read in the elaborated design (DDC).
# Use the -format option to specify: verilog, sverilog, or vhdl as needed.
#################################################################################
set power_preserve_rtl_hier_names true

echo "source files are:............................"
echo ${RTL_SOURCE_FILES}

#set cone "./cones/nonlin_out/c"
#set Ncones 501
set Ncones 8
#set Ncones 3

for {set i 1} {$i <= $Ncones } {incr i} {
	#current_design $DESIGN
	link
	read_verilog ./cones/lin_out/c$i.v
	#################################################################################
	# Apply Additional Optimization Constraints
	#################################################################################

	# Prevent assignment statements in the Verilog netlist.
	set_fix_multiple_port_nets -all -buffer_constants

	#################################################################################
	# Compile the Design
	#################################################################################

	# compile_ultra
	compile -area_effort high 
	report_area -nosplit > cones/area_reports/area_lincone$i.rpt
	report_cell -nosplit > cones/cell_reports/cell_lincone$i.rpt
}
	# Write and close SVF file and make it available for immediate use
	set_svf -off

