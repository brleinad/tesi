/* ###########################################################################################################################
## Organization         : CEA/LETI
##                      :
## Module name          : DECODING
## File name            : DECODING.h (header file for 'DECODING.cpp')
## Language             : C++
## Short description    : implements the LDPC decoding module
##                      : calls one of the following sub-modules
##                      :     DEC_LDPC_BIN      - floating-point LDPC decoding sub-module
##                      :     DEC_FIXP_LDPC_BIN - fixed-point LDPC decoding sub-module
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ######################################################################################################################## */

#ifndef _DECODING_H_
#define _DECODING_H_

// ===============
// INCLUDE SECTION
// ===============

// ---------------------
// System header file(s)
// ---------------------
#include <iostream>     // std::cerr
#include <new>          // std::nothrow
#include <cerrno>       // errno

// ---------------------
// User's header file(s)
// ---------------------
#include "Tools.h"
#include "Config.h"
#include "DispConfig.h"
using namespace std;

// ==============
// DEFINE SECTION
// ==============
#ifndef NB_LDPC_STAT
#define NB_LDPC_STAT  2
#define _DEC_STATUS_  0
#define _NUM_ITER_    1
#endif

#define HARD_BIT(x)  ((x) == 0 ?  (rand()%2) : ((x) > 0 ? 0 : 1))
//#define SP_EPSILON  (double) 1E-16 
//#define SP_INFINITY    38          // PHI(1E-16), where  PHI(x) = log((1 + exp(-x))/(1 - exp(-x)))
//#define MS_INFINITY   1000         // "infinite" LLR value (MS decoding) 
//#define FIXP_MAX_EXP   32          // fix-point maximum exponent value

// ============================
// DECODING DECLARATION SECTION
// ============================

class DECODING 
{
public:

    // ------------------------------------------
    // DECLARATION OF THE DECODING PUBLIC METHODS
    // ------------------------------------------
    DECODING();      // constructor
    ~DECODING();     // destructor
	void Main();     // method which supports the thread process
	int  Activate(); // class activation 
    
    // --------------------------------------
    // DECLARATION OF THE MODULE PUBLIC FIFOs
    // --------------------------------------
	int *ptFifoIn1;  // input port 1: bits from original circuit F
	int *ptFifoIn2;  // input port 1: bits from parity circuit P
	int *ptFifoOut1; // output port1: decoded bits - estimated F bits
	int *ptFifoOut2; // output port2: decoding statistics
	
private:
	// ------------------------------------------------------------
    // DECLARATION OF VARIABLES FOR STORING THE PARITY-CHECK MATRIX
    // ------------------------------------------------------------
	int QC_flag;       // '1' if QC codes, '0' otherwise 
	int VarNodesNb;    // number of var-nodes (variable-nodes)
	int ChkNodesNb;    // number of chk-nodes (check-nodes)
	int EdgesNb;       // number of edges of the graph
	int MaxChkDeg;     // maximum chk-node degree
	int  *ptChkDeg;    // chk-nodes degrees 
	int **ptChkList;   // lists of var-nodes connected to each chk-node
	int **ptChkCoef;   // coefs of var-nodes connected to each chk-node (QC-LDPC codes)
	int  *ptSrcIndx;   // indexes of source var-nodes
	int  *ptParIndx;   // indexes of parity bits

	// ------------------------------------
	// local copies of the config paramters
	// ------------------------------------
	int    LdpcDecoding;       // ldpc decoding (Sum-Product, Min-Sum, Min-Max, etc.)
	int    LdpcScheduling;     // ldpc scheduling (flooding, serial, layered)
	int    LdpcLayersNb;       // number of layers (for layered decoding)
	int    MaxIterNb;          // maximum number of decoding iterations
	int    StopCriterion;      // stopping criterion
	int    GallB_thres;        // Gallager-B qualified majority threshold
	int    MS_Offset;          // offset factor for min-sum decoding
	int    FixpSizeIn;         // size (in bits) of the input LLRs 
	int    FixpSizeExt;        // size (in bits) of the extrinsic LLRs (exchanged messages)
	int    FixpSizeOut;        // size (in bits) of the output a-posteriori LLRs
	int    FixpInScale;        // scale factor of the decoder's input (fixp decoder only)
	int    LdpcBinDim;         // binary dimension of the LDPC code
	int    LdpcBinLen;         // binary length of the LDPC code
	char   LdpcFile[STR_LEN];  // name of the LDPC code file
	
	// -------------------------------------------
    // DECLARATION OF THE DECODING PRIVATE METHODS
    // -------------------------------------------
	void Reset();     // reset ressources
	void Free();      // resources release
	void GetParam();  // get the module configuration parameter values
    int  Mem();       // memory allocation
    int  Init();      // initialization of algorithm parameters
	int  ReadLdpc();  // read LDPC file
	
	// ---------------------------------------
	// other: needed by the decoding algorithm
	// ---------------------------------------
	int *ptFixp_FifoIn;  // fixed-point conversion of ptFifoIn 
	int *ptDecodedBits;  // decoded bits -- estimated F bits
    
    // -----------------------------
	// declaration of friend classes
	// -----------------------------
	friend class DEC_FIXP_LDPC_BIN;
	
    // -------------------------------------------
    // declaration of pointers to decoding classes
    // -------------------------------------------
	class DEC_FIXP_LDPC_BIN *ptDecFixpLdpcBin; // fixed-point decoding for binary LDPC codes
	
	// temporary
	// int *ptVarPerm, *ptVarPermInv;
	
};

// -------------------------------------------------------------------------------------
// User's header files that must be included AFTER the definition of the DECODING class!
// -------------------------------------------------------------------------------------
	#include "DEC_FIXP_LDPC_BIN.h"

#endif      // _DECODING_H_
