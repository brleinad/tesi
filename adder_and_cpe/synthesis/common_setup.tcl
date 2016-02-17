##########################################################################################
# Variables common to all RM scripts
# Script: common_setup.tcl
# Version: B-2008.09-SP4 (Mar. 25, 2009)
# Copyright (C) 2007, 2008, 2009 Synopsys All rights reserved.
##########################################################################################

#set DESIGN_NAME                   "des"  ;#  The name of the top-level design

#set DESIGN_REF_DATA_PATH          [sh pwd]  ;#  Absolute path prefix variable for library/design data.
                                       #  Use this variable to prefix the common absolute path to 
                                       #  the common variables defined below.
                                       #  Absolute paths are mandatory for hierarchical RM flow.

##########################################################################################
# Hierarchical Flow Design Variables
##########################################################################################

set HIERARCHICAL_DESIGNS           "" ;# List of hierarchical block design names "DesignA DesignB" ...
set HIERARCHICAL_CELLS             "" ;# List of hierarchical block cell instance names "u_DesignA u_DesignB" ...

##########################################################################################
# Library Setup Variables
##########################################################################################

if { [catch {echo $ANALYSIS_TYPE}] } {
  echo "Assuming analysis type is TIMING..."
  set ANALYSIS_TYPE timing
  }

echo "Target library: TSMC 65nm GP CMOS"
set LIBSEL "tcbn65gplus";
set OCSEL "WCCOM";
# echo "Target library: TSMC 40nm LP CMOS"
# set LIBSEL "tcbn40lpbwp";
# set OCSEL "NC0D9COM";
# echo "Target library: NangateOpenCellLibrary 45nm"
# set LIBSEL "Nangate45nm";
set LIBROOT "/home/by1e11/local/eda/libs";
set SYNOPSYSROOT "/home/by1e11/local/eda/synopsys"

set MIN_LIBRARY_FILES             ""  ;#  List of max min library pairs "max1 min1 max2 min2 max3 min3"...

set ADDITIONAL_SEARCH_PATH        "$SYNOPSYSROOT/dc_vG-2012.06-SP2/libraries/syn 
                                    $LIBROOT/tsmc/digital/Front_End/timing_power_noise/NLDM/tcbn40lpbwp_110b/
                                    $LIBROOT/tsmc/digital/Front_End/timing_power_noise/NLDM/tcbn65gplus_121b/
                                    $LIBROOT/NangateOpenCellLibrary_PDKv1_3_v2010_12/Front_End/Liberty/NLDM"

switch $LIBSEL {
  tcbn40lpbwp {
    switch $OCSEL {
      WCCOM {
        # process k = 1, voltage = 0.99, temp = 125degC
        set TARGET_LIBRARY_FILES          "tcbn40lpbwpwc.db";
      }
      BCCOM {
        # process k = 1, voltage = 1.1, temp = 0degC
        set TARGET_LIBRARY_FILES          "tcbn40lpbwpbc.db";
      }
      NCCOM {
        # process k = 1, voltage = 1.1, temp = 25degC
        set TARGET_LIBRARY_FILES          "tcbn40lpbwptc.db";
      }
      NC0D9COM {
        set TARGET_LIBRARY_FILES          "tcbn40lpbwptc0d9.db";
      }
      default {
        set TARGET_LIBRARY_FILES          "tcbn40lpbwptc.db";
      }
    }
  }
  tcbn65gplus {
    switch $OCSEL {
      WCCOM {
        set TARGET_LIBRARY_FILES          "tcbn65gpluswc.db";
      }
      BCCOM {
        set TARGET_LIBRARY_FILES          "tcbn65gplusbc.db";
      }
      NCCOM {
        set TARGET_LIBRARY_FILES          "tcbn65gplustc.db";
      }
      default {
        set TARGET_LIBRARY_FILES          "tcbn65gplustc.db";
      }
    }
  }
  Nangate45nm {
    set TARGET_LIBRARY_FILES          "Nangate45nm.db";
  }
  default {}
}

# switch $OCSEL {
#   WCCOM {
#     # 65nm GP std cells @ WCCOM (Vdd = 0.9V, 125degC, nominal process):
#     set TARGET_LIBRARY_FILES          "tcbn65gpluswc.db";
#   }
#   BCCOM {
#     # 65nm GP std cells @ BCCOM (Vdd = 1.1V, 0degC, nominal process):
#     set TARGET_LIBRARY_FILES          "tcbn65gpluswc.db";
#   }
#   default {
#     # 65nm GP std cells @ NCCOM (Vdd = 1V, 25degC, nominal process):
#     set TARGET_LIBRARY_FILES          "tcbn65gpluswc.db";
#   }
# }

#  Symbol libraries for Design Vision schematics
set SYMBOL_LIBRARY_FILES          "tcbn65gplus.sdb tcbn65gpluscg.sdb tcbn65gplushvt.sdb tcbn65gpluscghvt.sdb";
set ADDITIONAL_LINK_LIB_FILES     ""; #  Extra link logical libraries not included in TARGET_LIBRARY_FILES
set POWER_GATING_SUPPORT          1;


set MIN_ROUTING_LAYER             "M1"   ;# Min routing layer
set CLOCK_ROUTING_LAYERS          "M2 M3 M4 M5 M6 M7 M8 M9";
set PNET_ROUTING_LAYERS           "M1 M2";
set ALL_ROUTING_LAYERS            "M1 M2 M3 M4 M5 M6 M7 M8 M9";
set MAX_ROUTING_LAYER             "M9"   ;# Max routing layer

set PNS_POWER_BUDGET       	      "100"  ;# Unit in milliWatts; default is 1000
set PNS_VOLTAGE_SUPPLY     	      "1"    ;# Unit in Volts; default is 1.5
set PNS_TARGET_VOLTAGE_DROP       "100"   ;# Unit in milliVolts. Tool default is 10% of PNS_POWER_BUDGET

# set MW_REFERENCE_CONTROL_FILE     ""  ;#  Reference Control file to define the MW ref libs
# set MW_REFERENCE_LIB_DIRS         "/user/archive/tome/dev/synth/milkyway/tcbn65gplus/ /user/archive/tome/dev/synth/milkyway/tcbn65gplushvt/ /user/archive/tome/dev/synth/milkyway/tcbn65gpluscg/ /user/archive/tome/dev/synth/milkyway/tcbn65gpluscghvt/ "  ;#  Milkyway reference libraries
# set TECH_FILE                     "$LIBROOT/digital/Back_End/milkyway/tcbn65gplus_121b/techfiles/tsmcn65_9lmT2.tf"  ; # same on all proc versions of a node, i.e. 65gp = 65gphvt = ...
# set MAP_FILE                      "/user/archive/tome/dev/synth/milkyway/tcbn65gplus_tf_to_itf.map"  ;#  Mapping file for TLUplus
# set TLUPLUS_MAX_FILE              "$LIBROOT/digital/Back_End/milkyway/tcbn65gplus_121b/techfiles/tluplus/cln65g+_1p09m+alrdl_top2_typical.tluplus"  ;#  Max TLUplus file
# set TLUPLUS_MIN_FILE              "$LIBROOT/digital/Back_End/milkyway/tcbn65gplus_121b/techfiles/tluplus/cln65g+_1p09m+alrdl_top2_typical.tluplus"  ;#  Min TLUplus file

echo " "
echo Common Setup (adapted from DC-RM 2008.09 by Tom English)
echo ********************************************************
echo " "
echo "Target std. cell library : $LIBSEL";
# echo "Max. operating condition : $OCSEL";
echo " "

set MW_POWER_NET                "VDD" ;#
set MW_POWER_PORT               "VDD" ;#
set MW_GROUND_NET               "VSS" ;#
set MW_GROUND_PORT              "VSS" ;#

# set RESULTS_DIR "${LIBSEL}_results";
# set REPORTS_DIR "${LIBSEL}_reports";

set LIBRARY_DONT_USE_FILE        ""   ;# Tcl file with library modifications for dont_use
