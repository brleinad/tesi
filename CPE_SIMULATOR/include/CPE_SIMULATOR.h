/* ####################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : CPE_SIMULATOR.h (header of CPE_SIMULATOR.cpp file)
## Language             : C++
## Short description    : contains the main function of the CPE simulator chain 
##                      : first the simulator modules are allocated and activated
##                      : the simulation loop successively calls the modules' main() methods
##                      : 
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## #################################################################################### */

#ifndef _CPE_SIMULATOR_H_
#define _CPE_SIMULATOR_H_

/* =============== *
 * INCLUDE SECTION *
 * =============== */

/* --------------------- *
 * System header file(s) *
 * --------------------- */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

using namespace std;

/* ------------------- *
 * User header file(s) *
 * ------------------- */
#include "Tools.h"
#include "Config.h"
#include "DispConfig.h"

#include "BIN_SRC.h"
#include "NETLIST_ENC.h"
#include "DECODING.h"
#include "BER_FER.h"


#endif
