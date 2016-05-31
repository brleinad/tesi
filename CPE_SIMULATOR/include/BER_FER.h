/* ###########################################################################################
## Organization         : CEA/LETI
##                      :
## Module name          : BER_FER
## File name            : BER_FER.h (header file for 'BER_FER.cpp')
## Language             : C++
## Short description    : implements the computation of Bit and Frame Error Rates (BEr & FER)
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ########################################################################################### */

#ifndef _BER_FER_H_
#define _BER_FER_H_

// ===============
// INCLUDE SECTION
// ===============

// ---------------------
// User's header file(s)
// ---------------------
#include "Tools.h"
#include "Config.h"
#include <sys/types.h>	// fork, wait 
#include <unistd.h>	    // execl, fork  
#include <sys/wait.h>	// wait 
#include <signal.h>   

using namespace std;

// ==============
// DEFINE SECTION
// ==============
#define MAX_RESFILE_LINE_LEN  400

#ifndef NB_LDPC_STAT
#define NB_LDPC_STAT  2
#define _DEC_STATUS_  0
#define _NUM_ITER_    1
#endif

// ===========================
// BER_FER DECLARATION SECTION
// ===========================
class BER_FER 
{
public:

    // -----------------------------------------
    // DECLARATION OF THE BER_FER PUBLIC METHODS
    // -----------------------------------------

     BER_FER();                          // constructor
    ~BER_FER();                          // destructor
	int  Activate();                     // class activation 
	void Main(int &StopSimulation);      // method which supports the thread process
    void SetGatePerr(double perr_value); // set the vaue of the gate error probability
	
	// --------------------------------------
    // DECLARATION OF THE MODULE PUBLIC FIFOs
    // --------------------------------------
	int *ptFifoIn1;   // input port 1: error-free output bits of original circuit F
	int *ptFifoIn2;   // input port 2: estimated (decoded) output bits of original circuit F
	int *ptFifoIn3;   // input port 3: Rx decoding statistics
	int *ptFifoIn4;   // input port 4: error-free output bits of parity circuit P

private:

	// ------------------------------------------
    // DECLARATION OF THE BER_FER PRIVATE METHODS
    // ------------------------------------------
	void GetParam(); // get the config parameter values
    void Reset();    // reset ressources
    void Free();     // resources release
	int  Mem();      // memory allocation
    int  Init();     // initialization of algorithm parameters
	void display_stdout(int NewLine);          // displays BER & FER on stdout
    void display_resfile(const char *restype); // displays BER & FER on results file
    
    // --------------------------------------------
    // DECLARATION OF THE BER_FER PRIVATE VARIABLES
    // --------------------------------------------
	
	// -------------------
	// BER/FER computation
	// -------------------
	double GatePerr;       // current gate error probability
	double F_NbOutBitErr;  // number of F-output bits in error
	double P_NbOutBitErr;  // number of P-output bits in error
	double Fdec_NbBitErr;  // number of decoded (estimated) F-bits in error
	double Fdec_NbWordErr; // number of decoded (estimated) F-words in error
	double Fdec_outBER;    // Bit Error Rate -- decoded F-output bits
    double Fdec_outFER;    // Frame Error Rate -- decoded F-output bits
	int    NbSimulFrames;  // number of simulated frames
	
	// --------------------
	// LDPC error detection
	// --------------------
	int StopCriterion;      // stopping criterion
	int NbLdpcDetect;       // number of detected error frames
	int NbLdpcDetectFalse;  // number of false detections 
	int NbLdpcUndetect;     // number of undetected error frames
	double TotalDecIterNb;  // total number of decoding iterations 
	
	// ---------------------------------------
	// local copies of configuration structure
	// ---------------------------------------
	int  F_NbOutputs;  		   // number of output bits of original circuit F
	int  P_NbOutputs;  		   // number of output bits of parity circuit P
	int  MaxNbSimulFrames;     // maximum number of simulated frames (transmitted codewords)
    int  MinNbErrorFrames;     // maximum number of erroneous frames (undecoded codewords)
	int  ResfileRefresh;       // controls intermediate display to results file
    int  StdoutRefresh;        // controls intermediate display on stdout
	char ResultsFile[STR_LEN]; // name of results file

};

#endif   // _BER_FER_H_
