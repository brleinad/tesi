/* #################################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : DispConfig.h (header file for 'DispConfig.cpp')
## Language             : C++
## Short description    : displays the configuration structure on stdout and results file
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ################################################################################################# */

#ifndef _DISP_CONFIG_H_
#define _DISP_CONFIG_H_

// =============== 
// INCLUDE SECTION
// ===============

// ---------------------
// System header file(s)
// ---------------------
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#ifdef  MAKE_TERM_RESIZE
#include <sys/ioctl.h>
#endif

#define STRLEFT(y, x)     y, (x - strlen(y)), ""
#define STRCENTER(y, x)  (int)floor(((double)x - (double)strlen(y))/2.0), "", y, (int)ceil(((double)x - (double)strlen(y))/2.0), ""
#define STRRIGHT(y, x)   (x - strlen(y)), "", y

using namespace std;

// -------------------
// User header file(s)
// -------------------
#include "Tools.h"
#include "Config.h"
#include "Fixp.h"

#define DISP_LINE_LEN  116

typedef struct {

	char ConfFile[DISP_LINE_LEN];        // name of the configuration file
	char LdpcFile[DISP_LINE_LEN];        // name of the LDPC code file
	char NetlistFile[DISP_LINE_LEN];     // name of the netlist file
	char NbInputs[DISP_LINE_LEN];        // number input bits
	char NbInternsF[DISP_LINE_LEN];      // number of internal nodes - original circuit F
	char NbInternsP[DISP_LINE_LEN];      // number of internal nodes - parity circuit P
	char NbOutputsF[DISP_LINE_LEN];      // number output bits - original circuit F
	char NbOutputsP[DISP_LINE_LEN];      // number output bits - parity circuit P
	char CritThresF[DISP_LINE_LEN];      // critical threshold for original circuit F
	char CritThresP[DISP_LINE_LEN];      // critical threshold for original parity F
    char LdpcDecoding[DISP_LINE_LEN];    // ldpc decoding (Sum-Product, Min-Sum, Min-Max, etc.)
	char LdpcScheduling[DISP_LINE_LEN];  // ldpc scheduling (flooding, serial, layered)
	char MaxIterNb[DISP_LINE_LEN];       // maximum number of decoding iterations
	char CodingRate[DISP_LINE_LEN];      // coding rate (info_size / coded_size)
	char LdpcType[DISP_LINE_LEN];        // type of the LDPC code
	char VarNodesNb[DISP_LINE_LEN];      // number of variable nodes
	char ChkNodesNb[DISP_LINE_LEN];      // number of check-nodes
	char AveVarDeg[DISP_LINE_LEN];       // average var-node degree
	char AveChkDeg[DISP_LINE_LEN];       // average chk-node degree
	char FixpDecoding[DISP_LINE_LEN];    // fix-point decoding
	char FixpInScale[DISP_LINE_LEN];     // decoder input scale factor
	char FixpArithmetic[2][DISP_LINE_LEN];  // fix-point arithmetic
	
} DISP_CONFIG;

// ======================================
// EXTERN FUNCTION(S) DECLARATION SECTION
// ======================================
extern int display_config(void);
extern void export_disp_config_param(const char *paramname, int paramvalue);
extern void export_disp_config_param(const char *paramname, double paramvalue);

#endif

