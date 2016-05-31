/* ###########################################################################################################################
## Organization         : CEA/LETI
##                      :
## Module name          : DEC_FIXP_LDPC_BIN
## File name            : DEC_FIXP_LDPC_BIN.h (header file for 'DEC_FIXP_LDPC_BIN.cpp')
## Language             : C++
## Short description    : implements fixed-point LDPC decoding
##                      :  implemented algorithms: Min-Sum, Norm.-Min-Sum, Offset-Min-Sum, Self-Corrected-Min-Sum 
##                      : implemented schedulings: flooding, serial, layered
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ######################################################################################################################## */

#ifndef _DEC_FIXP_LDPC_BIN_
#define _DEC_FIXP_LDPC_BIN_

// ===============
// INCLUDE SECTION
// ===============

// ---------------------
// User's header file(s)
// ---------------------
#include "DECODING.h"
#include "Fixp.h"
using namespace std;

// --------------
// DEFINE SECTION
// --------------

// =====================================
// DEC_FIXP_LDPC_BIN DECLARATION SECTION
// =====================================

class DEC_FIXP_LDPC_BIN 
{
public:

    // ---------------------------------------------------
    // DECLARATION OF THE DEC_FIXP_LDPC_BIN PUBLIC METHODS
    // ---------------------------------------------------
     DEC_FIXP_LDPC_BIN(); // constructor
    ~DEC_FIXP_LDPC_BIN(); // destructor
    void Main();          // method which supports the thread process
	int  Activate(DECODING *ptDec);  // class activation 
	
private:

	// -----------------
	// CONFIG PARAMETERS
	// -----------------
    int    LdpcDecoding;   // ldpc decoding (Sum-Product, Min-Sum, Min-Max, etc.)
	int    LdpcScheduling; // ldpc scheduling (flooding, serial, layered)
	int    LdpcLayersNb;   // number of layers (for layered decoding)
	int    MaxIterNb;      // maximum number of decoding iterations
	int    StopCriterion;  // stopping criterion
	int    FixpSizeExt;    // size (in bits) of the extrinsic LLRs (exchanged messages)
	int    GallB_thres;    // Gallager-B qualified majority threshold
	int    MS_Offset;      // offset factor for min-sum decoding
	
	// ---------------------------------------------
    // VARIABLES FOR STORING THE PARITY CHECK MATRIX
    // ---------------------------------------------
	int VarNodesNb;   // number of variable nodes (also equal to the code length) 
    int ChkNodesNb;   // number of parity check nodes  
    int MaxChkDeg;    // maximun of check degrees  
    int  *ptChkDeg;   // store the check-node degrees 
    int **ptChkList;  // store the list of variable nodes connected to check nodes
	
	// -------------------------------
    // DECLARATION OF IN/OUT VARIABLES
    // -------------------------------
	int *ptRxSoftBits;     // demapped soft bits (input LLR valus)
	int *ptDecodedBits;    // decoded bits 
	int *ptDecStatistics;  // decoding statistics
	
	// ----------------------------------------------------
    // DECLARATION OF THE DEC_FIXP_LDPC_BIN PRIVATE METHODS
    // ----------------------------------------------------
	void Reset();                    // reset ressources
	void Free();                     // resources release
	void GetParam(DECODING *ptDec);  // get the module configuration parameter values
    int  Mem();                      // memory allocation  
	int  Init();                     // initialization
	
	void Flood_Decoding();  // flooding scheduling decoding
	void Layer_Decoding();  // serial/layered scheduling decoding
	
    void CNU_MS(int Chk_First, int Chk_Last);   // Check-Node Unit for Min-Sum-based decoders (including SCMS)
    void CNU_GalB(int Chk_First, int Chk_Last); // Check-Node Unit for Galager-B decoder
	void VNU_MS(int Chk_First,  int Chk_Last);  // Variable-Node-Unit for (Normalized-, Offset-,) Min-Sum decoder
	void VNU_SCMS(int Chk_First, int Chk_Last); // Variable-Node-Unit for Self-Corrected Min-Sum decoder
	void VNU_GalB(int Chk_First, int Chk_Last); // Variable-Node-Unit for Gallager-B decoder
	void (DEC_FIXP_LDPC_BIN::*VNU)(int, int);   // VNU: points to either VNU_MS, VNU_SCMS, or VNU_GalB acc. to decoding algorithm
	void (DEC_FIXP_LDPC_BIN::*CNU)(int, int);   // CNU: points to either CNU_MS or CNU_GalB, acc. to decoding algorithm
	int  Syndrome();                            // syndrome (parity-checks) computation
	
    // -----------------------------------------
    // others (needed by the decoding algorithm)
    // -----------------------------------------
	int   LayerChkNb;   // number of check-nodes per layer (serial/layered decoding)
	int   DecIterNb;    // counter over the decodoing iterations
	int   MaxAbsMess;   // maximum abs value of exchanged messages
	int **ptChkMess;    // extrinsic messages from check to variable nodes 
    int **ptVarMess;    // extrinsic messages from variable to check nodes
    int  *ptPostInfo;   // store the pseudo-posterior log-likelihood ratios (LLR) 
	
	// ====================
	// fix-point arithmetic
	// ====================
	FIXP *ptFixp;      // pointer to fix-point arithmetic class (FIXP)
	int (FIXP::*fixp_sgn)(int);      // sign of integer value     (pointer to function)
	int (FIXP::*fixp_abs)(int);      // absolute value of integer (pointer to function)
	int (FIXP::*fixp_sat)(int);      // cut integer's value between [MinFixpIn,  MaxFixpIn]      (pointer to function)
	int (FIXP::*fixp_add)(int, int); // addition;  result is within [MinFixpOut, MaxFixpOut]     (pointer to function)
	int (FIXP::*fixp_lth)(int, int); // less than; 1 iff first argument is less than the second  (pointer to function)
	int (FIXP::*fixp_xor)(int, int); // bitxor of input arguments (arguments must be 0 or 1)     (pointer to function)
	int (FIXP::*fixp_scu)(int, int, int); // self correction unit (arguments must be 0 or 1)     (pointer to function)  
	
};

#endif      // _DEC_FIXP_LDPC_BIN_
