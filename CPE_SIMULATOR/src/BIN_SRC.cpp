/* ###########################################################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : BIN_SRC.cpp
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

#include "../include/BIN_SRC.h"

// ####################################
// Method name : BIN_SRC
// Description : constructor definition
// ####################################

BIN_SRC::BIN_SRC()
{
    // -------------
    // reset actions
    // -------------
	ptFifoOut = 0;
	Reset();

}   // end of constructor

// ###################################
// Method name : ~BIN_SRC
// Description : destructor definition
// ###################################

BIN_SRC::~BIN_SRC()
{
    // -----------------
	// resources release
	// -----------------
    Free();

}   // end of destructor

// ##############################
// Method name : Activate
// Description : class activation
// ##############################

int BIN_SRC::Activate()
{
    int ErrorFlag = IN_ERROR;

    // ---------------------------------------
    // Get the module configuration parameters
    // ---------------------------------------
    GetParam();    

    // -------------------------------------------------------------------------
    // Allocation of memory: input/output arrays and control parameter structure
    // -------------------------------------------------------------------------
    if ( Mem() == IN_ERROR ) goto end;

    // ----------------------
    // Initialization actions
    // ----------------------
    if ( Init() == IN_ERROR) goto end; 
	
	// -----------------
	// verify activation
	// -----------------
	if ( ptFifoOut == 0 )
	{
		fprintf(stderr, "\n\nERROR [BIN_SRC module] Activation failure (out fifo(s) = 0)\n\n");
		goto end;
	}
	
	// ---------------------
	// successful activation 
	// ---------------------
	ErrorFlag = NO_ERROR;

end:  
    return ErrorFlag;
}

// ############################################################
// Method name : Reset
// Description : method provided for further design refinements
// ############################################################

void BIN_SRC::Reset()
{
    // ------------------------------------------------------------------------
    // Reset the dynamic memory array and structure pointers used by the module
    // Mandatory with Visual C++ 6.0 when a 'Debug' version is produced
    // ------------------------------------------------------------------------
		
    return;

}   // end of 'Reset' method

// ###########################################################
// Method name : GetParam
// Description : get the value of the configuration parameters
// ###########################################################

void BIN_SRC::GetParam()
{
	InfoSize = CONFIG::NbInputs;    // info size = number of information (source) bits
	return;

}   // end of 'GetParam' method

// ########################################################################################
// Method name : Mem
// Description : memory allocation for input/output arrays and control parameters structure
// ########################################################################################

int BIN_SRC::Mem()
{
    int ErrorFlag = IN_ERROR;

    // -------------------
    // Allocate the memory 
    // -------------------
	// fifos
	if ( AllocArray(ptFifoOut, "ptFifoOut", InfoSize) == IN_ERROR ) goto end;
	
    // ----------------------------
    // successful memory allocation
    // ----------------------------
    ErrorFlag = NO_ERROR;

end:
    return ErrorFlag;   

}   // end of 'Mem' method


// #################################################################
// Method name : Init
// Description : initializations needed by the implemented algorithm
// #################################################################
int BIN_SRC::Init()
{	
	int BitCounter;
	int ErrorFlag  = IN_ERROR;
	
	SourceSeed  = SOURCE_SEED;
	ptTxSrcBits = ptFifoOut;
	
	for ( BitCounter = 0 ; BitCounter < InfoSize ; BitCounter++ )
    {
		ptTxSrcBits[BitCounter] =  0;
    }

	// -------------------------
    // successful initialization
    // -------------------------
    ErrorFlag = NO_ERROR;

end:
    return ErrorFlag;   
	
}   // end of 'Init' method

// ######################################
// Method name : Free
// Description : resources release method
// ######################################

void BIN_SRC::Free()
{
    // -------------------------
    // Free the memory allocated 
    // -------------------------
	FreePointer(ptFifoOut);

}   // end of 'Free' method


// ===========================================
// Method name : Main
// Description : main module method definition
// ===========================================

void BIN_SRC::Main()
{
    int BitCounter; // counter over the number of generated bits 

	// random bits uniformly distributed
	for ( BitCounter = 0 ; BitCounter < InfoSize ; BitCounter++ )
	{
		// Generation of one binary information 
		ptTxSrcBits[BitCounter] = ( ( SourceSeed >> 30 ) ^ ( SourceSeed >> 2 ) ) & 1;
        
		// Update seed 
		SourceSeed = ( SourceSeed << 1 ) | ptTxSrcBits[BitCounter];
	}

}   // end of 'Main' method

