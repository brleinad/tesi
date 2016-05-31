/* ###########################################################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : BIN_SRC.h (header file for 'BIN_SRC.cpp')
## Language             : C++
## Short description    : This module generates a random binary stream 
##                      :
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
## Detailed description : This model is a pseudo-random source generator implemented as a maximum period 31-bit shift
##                      : register. The method for generating random bits is based on a primitive polynomials modulo 2:
##                      :                               pow(x,31) + pow(x,3) + pow(x,0)
##                      : Every primitive polynomial modulo 2 of order n = 31 defines a recurrence relation for obtaining
##                      : a new random boolean value from the 31 preceding ones. The recurrence relation is guaranteed to
##                      : produce a sequence with a maximum length. Any initial non-zero seed value will generate a sequence
##                      : with 'pow(2,31) - 1 = 2147483647' values before the sequence repeats.
##                      :
## COPYRIGHT            : CEA
## ######################################################################################################################## */

#ifndef _BIN_SRC_H_
#define _BIN_SRC_H_

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
#include "Config.h"
#include "Tools.h"
using namespace std;

// ==============
// DEFINE SECTION
// ==============
#define SOURCE_SEED   35855

// =================================
// BIN_SRC DECLARATION SECTION
// =================================

class BIN_SRC 
{
public:

    // ----------------------------------------
    // DECLARATION OF THE MODULE PUBLIC METHODS
    // ----------------------------------------

    BIN_SRC();      // constructor
    ~BIN_SRC();     // destructor
	void Main();    // method which supports the thread process
    int  Activate();// class activation 
    
	// --------------------------------------
    // DECLARATION OF THE MODULE PUBLIC FIFOs
    // --------------------------------------
	// no input port
	int *ptFifoOut; // output port : source bits

private:

	// -----------------------------------------
    // DECLARATION OF THE MODULE PRIVATE METHODS
    // -----------------------------------------
	void Reset();   // reset ressources
	void Free();    // resources release
	void GetParam();// get the module configuration parameter values
    int  Mem();     // memory allocation
    int  Init();    // initialization of algorithm parameters
	
    // -------------------------------------------------
    // MANAGEMENT OF THE MODULE CONFIGURATION PARAMETERS
    // -------------------------------------------------
    int SourceSeed;   // used to store the 'source_seed' value
	int *ptTxSrcBits; // source bits (TX)
	
	// -------------------------------------
	// local copies of the config parameters
	// -------------------------------------
	int InfoSize;    // info size = number of information (source) bits
	
};

#endif      // _BIN_SRC_H_

