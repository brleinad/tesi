source -echo -verbose common_setup.tcl

#################################################################################
# Design Compiler Top-Down Reference Methodology Setup
# Script: dc_setup.tcl
# Version: B-2008.09-SP4 (Mar. 25, 2009)
# Copyright (C) 2007, 2008, 2009 Synopsys All rights reserved.
#################################################################################


#################################################################################
# Setup Variables
#
# Modify settings in this section to customize your DC-RM run.
#################################################################################

# Portions of dc_setup.tcl may be used by other tools so do check for DC only commands
if {$synopsys_program_name == "dc_shell"}  {

  # Change alib_library_analysis_path to point to a central cache of analyzed libraries
  # to save some runtime and disk space.  The following setting only reflects the
  # the default value and should be changed to a central location for best results.

  set alib_library_analysis_path ./cache/

  # Add any additional DC variables needed here
}

# The following variables are used by scripts in dc_scripts to direct the location
# of the output files

set REPORTS_DIR [join [list $LIBSEL "_reports"] ""]
set RESULTS_DIR [join [list $LIBSEL "_results"] ""]
#set MILKYWAY_DESIGN_LIB_DIR [join [list $LIBSEL ".mw"] ""]
set CONSTRAINTS_DIR "constraints"

# file mkdir $REPORTS_DIR
# file mkdir $RESULTS_DIR

echo " "
echo DC Setup (adapted from DC-RM 2008.09 by Tom English)
echo ****************************************************
echo " "
echo Constraints directory  : $CONSTRAINTS_DIR
echo Reports directory      : $REPORTS_DIR
echo Results directory      : $RESULTS_DIR
echo " "

# TE ported from old dctflow
set enable_recovery_removal_arcs true

#################################################################################
# Library Setup
#
# This section is designed to work with the settings from common_setup.tcl
# without any additional modification.
#################################################################################

# Define all the library variables shared by all the front-end tools

set search_path ". ${ADDITIONAL_SEARCH_PATH} $search_path"


# Milkyway variable settings

# Make sure to define the following Milkyway library variables
# mw_logic1_net, mw_logic0_net and mw_design_library are needed by write_milkyway

# set mw_logic1_net ${MW_POWER_NET}
# set mw_logic0_net ${MW_GROUND_NET}

# set mw_reference_library ${MW_REFERENCE_LIB_DIRS}
# set mw_design_library ${DESIGN_NAME}_LIB

# set mw_site_name_mapping [list CORE unit Core unit core unit]

# Include all libraries for multi-Vth leakage power optimization
set target_library ${TARGET_LIBRARY_FILES}
set symbol_library ${SYMBOL_LIBRARY_FILES}
#set synthetic_library dw_foundation.sldb
set link_library [concat $target_library "*" $ADDITIONAL_LINK_LIB_FILES]

define_design_lib WORK -path ./WORK

# set dont_use cells in the target_library
# source dc_scripts/mask_library_tcbn65gpluswc.tcl
switch $LIBSEL {
  Nangate45nm {
    source dc_scripts/mask_library_Nangate45_AOI.tcl
  }
  tcbn65gplus {
    source dc_scripts/mask_library_tcbn65gpluswc_AOI.tcl
  }
  tcbn40lpbwp {
    switch $OCSEL {
      WCCOM {
        source dc_scripts/mask_library_tcbn40lpbwpwc.tcl
      }
      BCCOM {
        source dc_scripts/mask_library_tcbn40lpbwpbc.tcl
      }
      NCCOM {
        source dc_scripts/mask_library_tcbn40lpbwptc.tcl
      }
      NC0D9COM {
        source dc_scripts/mask_library_tcbn40lpbwptc0d9.tcl
      }
      default {}
    }
    
  }
  default {}
}

# The remainder of the setup below should only be performed in Design Compiler
if {$synopsys_program_name == "dc_shell"}  {
  # Set min libraries if they exist
  foreach {max_library min_library} $MIN_LIBRARY_FILES {
    echo Max. delay library: $max_library
    echo Min. delay library: $min_library
    set_min_library $max_library -min_version $min_library
  }

  if {[shell_is_in_topographical_mode]} {

    # Only create new Milkyway design library if it doesn't already exist
    if {![file isdirectory $mw_design_library ]} {
      create_mw_lib   -technology $TECH_FILE \
                      -mw_reference_library $mw_reference_library \
                      $mw_design_library
    } else {
      # If Milkyway design library already exists, ensure that it is consistent with specified Milkyway reference libraries
      set_mw_lib_reference $mw_design_library -mw_reference_library $mw_reference_library
    }

    open_mw_lib     $mw_design_library

    check_library

    set_tlu_plus_files -max_tluplus $TLUPLUS_MAX_FILE \
                       -min_tluplus $TLUPLUS_MIN_FILE \
                       -tech2itf_map $MAP_FILE

    check_tlu_plus_files

  }

  #################################################################################
  # Library Modifications
  #
  # Apply library modifications here after the libraries are loaded.
  #################################################################################

  if {[file exists [which ${LIBRARY_DONT_USE_FILE}]]} {
    source -echo -verbose ${LIBRARY_DONT_USE_FILE}
  }
} 
