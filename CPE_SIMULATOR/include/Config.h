/* #################################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : Config.h (header file for 'Config.cpp')
## Language             : C++
## Short description    : defines the configuration structure of the simulation chain
##                      : fields of the configuration structure are first initialized by forbidden 
##                      : values, then they are read from the configuration file
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ################################################################################################# */

#ifndef _CONFIG_H_
#define _CONFIG_H_

// ===============
// include section
// ===============

#include "Tools.h"


class CONFIG 
{
public:

	 CONFIG();  // constructor
	~CONFIG();  // destructor
	
	// ===========================================
	// parameters read from the configuration file
	// ===========================================
	
	// ------------------------------
	// name of the configuration file
	// ------------------------------
	static char ConfFile[STR_LEN]; // name of the configuration file
	
	// ---------------------
	// gate error parameters 
	// ---------------------
	static int    GatePerrNum;              // number of simulated gate error probability values
	static double ptGatePerrList[NUM_PARAM];  // list of simulated gate error probability values 
	
	// ------------------
	// netlist parameters
	// ------------------
	static int  NbInputs;     // number of inputs (the same for both F and P)
	static int  NbOutputsF;   // number of outputs of the original circuit F
	static int  NbOutputsP;   // number of outputs of the "parity" circuit P
	static char NetlistFile[STR_LEN]; // short name of the netlist file 	
	static int  CriticThres[2];       // criticality threshold for F and P 
	
	// --------------------
    // ldpc code parameters
    // --------------------
    static char LdpcFile[STR_LEN]; // name of the LDPC code file
    static int  LdpcDecoding;      // ldpc decoding (Sum-Product, Min-Sum, etc.)
	static int  LdpcScheduling;    // ldpc scheduling (flooding, serial, layered)
	static int  LdpcLayersNb;      // number of layers (for layered decoding)
	static int  MaxIterNb;         // maximum number of decoding iterations
	static int  StopCriterion;     // stopping criterion
	static int  MS_Offset;         // offset factor for offset-min-sum decoding
	static int  GallB_thres;       // Gallager-B qualified majority threshold
	
	// ------------------
	// fix-point decoding
	// ------------------
	static int    FixpSizeIn;      // size (in bits) of the input and extrinsic LLRs 
	static int    FixpSizeOut;     // size (in bits) of the output a-posteriori LLRs
	static int    FixpInScale;     // scale factor of the decoder's input (fixp decoder only)
	static char   FixpArthFile[STR_LEN];  // fix-point arithmetic file
	
	// ----------------------------
    // end-of-simulation parameters
   	// ----------------------------
    static int MaxNbSimulFrames; // maximum number of simulated frames (transmitted codewords)
    static int MinNbErrorFrames; // maximum number of erroneous frames (undecoded codewords)

	// ------------------
	// display parameters
	// ------------------
	static char ResultsFile[STR_LEN];  // name of results file
	static int  ResfileRefresh;        // controls intermediate display to results file
	static int  StdoutRefresh;         // controls intermediate display on stdout
	
	// =======================================================
	// config parameters deduced from those read from the file
	// =======================================================
	static int    LdpcInfoSize;   // info-size (dimension) of the LDPC code
	static int    LdpcCodedSize;  // coded-size (length) of the LDPC code
	static double CodingRate;     // coding rate (info_size / coded_size)
	
	// ================================
	// read configuration file function
	// ================================
	int read_configfile();   // read parameters from configuration file
	
};



#endif
