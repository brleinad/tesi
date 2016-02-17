
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

set_svf ${RESULTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}.svf

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

# analyze -format verilog ${RTL_SOURCE_FILES}
#analyze -format VHDL ${RTL_SOURCE_FILES}
# elaborate ${DESIGN_NAME}
#rtl2saif -output ${DESIGN_NAME}_forward.saif -design ${DESIGN_NAME}
read_verilog ${RTL_SOURCE_FILES}
foreach_in_collection DESIGN [get_designs *] {
	current_design $DESIGN
	link

	#################################################################################
	# Apply Logical Design Constraints
	#################################################################################

	#source -echo -verbose ${CONSTRAINTS_DIR}/logical_constraints.tcl

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

	#################################################################################
	# Write Out Final Design and Reports
	#
	#        .ddc:   Recommended binary format used for subsequent Design Compiler sessions
	#    Milkyway:   Recommended binary format for IC Compiler
	#        .v  :   Verilog netlist for ASCII flow (Formality, PrimeTime, VCS)
	#       .spef:   Topographical mode parasitics for PrimeTime
	#        .sdf:   SDF backannotated topographical mode timing for PrimeTime
	#        .sdc:   SDC constraints for ASCII flow
	#        .upf:   UPF multivoltage setup information for mapped design
	#
	#################################################################################

	#source dc_scripts/maskgates_onlyAOI.tcl
	#source dc_scripts/maskgates_onlycomb.tcl
	#source dc_scripts/mask_library_tcbn65gpluswc.tcl

	#################################################################################
	# Write out Design
	#################################################################################

	# Write and close SVF file and make it available for immediate use
	set_svf -off

	# write -format ddc -hierarchy -output ${RESULTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}_mapped.ddc
	# write -f verilog -hierarchy -output ${RESULTS_DIR}/${current_design}_mapped.v
	#write -f vhdl -hierarchy -output ${RESULTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}.mapped.vhdl

	#################################################################################
	# Write out Design Data
	#################################################################################

	# write_sdc -nosplit ${RESULTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}_mapped.sdc

	# Write out link library information for PrimeTime when using instance-based target library settings
	# write_link_library -out ${RESULTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}_link_library.tcl
	# If SAIF is used, write out SAIF name mapping file for PrimeTime-PX
	# saif_map -type ptpx -write_map ${RESULTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}.mapped.SAIF.namemap

	#################################################################################
	# Generate Final Reports
	#################################################################################

	# report_qor > ${REPORTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}_mapped_qor.rpt
	#report_timing -transition_time -nets -attributes -nosplit > ${REPORTS_DIR}/timing/${DESIGN_NAME}${VARIANT_NAME}_mapped_timing.rpt
	#report_timing -transition_time -nets -attributes -nosplit > reports/timing/${current_design}_mapped_timing.rpt
	# report_reference -nosplit > ${REPORTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}_mapped_reference.rpt
	 #report_area -nosplit > ${REPORTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}cone_.rpt
	 report_cell -nosplit > ${REPORTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}.rpt


	# Use SAIF file for power analysis
	# read_saif -auto_map_names -input ${DESIGN_NAME}${VARIANT_NAME}.saif -instance < DESIGN_INSTANCE > -verbose

	# report_power -nosplit > ${REPORTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}_mapped_power.rpt
	# report_clock_gating -nosplit > ${REPORTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}_mapped_clock_gating.rpt

	# ungroup -all -flatten 
	# change_names -rules verilog -hierarchy  -log_changes dumy.log
	#change_name -rules collpse -hier -vebose

	#set_flatten true
	# write -f equation -output ${RESULTS_DIR}/${current_design}_flattend.eqn
	# write -f verilog -hierarchy -output ${RESULTS_DIR}/${DESIGN_NAME}${VARIANT_NAME}_flattend.v
}
exit
