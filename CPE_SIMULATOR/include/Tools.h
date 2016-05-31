/* ######################################################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : Tools.h (header of Tools.cpp) file
## Language             : C++
## Short description    : tool functions
##                      : double RandU(void);       // generates uniform distributed variables in ]0, 1[ 
##                      : double RandN(void);       // generates gaussian distributed unitary variables with zero mean 
##                      : void sort_array(double *ptArray, int ArrayNum, int order); // sorts array in specified order
##                      : void rand_perm(int *ptPerm, int Len);                      // generates random permutation
##                      :
## History              : 09/10/2012 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ###################################################################################################################### */

#ifndef _TOOLS_H_
#define _TOOLS_H_

// ===============
// include section
// ===============
#include <stdlib.h>
#include <complex>
#include <cerrno>
#include <new>
#include <stdio.h>
#include <cmath>
using namespace std;

#include "Tools_Def.h"
#include "Tools_Str.h"
#include "Tools_Mem.h"

// ==============
// DEFINE SECTION
// ============== 

// -------------------
// numerical constants
// -------------------
#define RAND_SEED    95732   // random seed  
#define NUM_PARAM    200     // maximum number of channel parameters

// ---------------
// type definition
// --------------- 
typedef unsigned long long int ULLINT;
typedef long long int LLINT;
typedef unsigned int UINT;
typedef unsigned long int ULINT;

// ------------------
// binary source mode
// ------------------
#define BIN_SRC_OFF   -1
#define BIN_SRC_ZERO   0
#define BIN_SRC_RAND   1

// ------------
// channel type
// ------------
#define BIAWGN_CHANNEL   1
#define BSC_CHANNEL      2

// ----------------------
// channel parameter name
// ----------------------
#define CHN_PARAM_PrEr       -2
#define CHN_PARAM_FrEr       -3
#define CHN_PARAM_NbEr       -4
#define CHN_PARAM_EBN0        1
#define CHN_PARAM_SNR         2

// ----------------------------
// decoding implementation type
// ----------------------------
#define DEC_IMPLEM_FLOATP   1  // decoding implemented in float-point arithmetic
#define DEC_IMPLEM_FIXEDP   2  // decoding implemented in fixed-point arithmetic
#define DEC_IMPLEM_STOCHA   3  // decoding implemented using stochastic computing

// -----------------------
// LDPC encoding algorithm
// -----------------------
#define ENC_LOWER_TRIANG  1   // low triangular encoding
#define ENC_UPPER_DDIAG   2   // upper double-diagonal encoding
#define ENC_SYST_GENMAT   3   // systemmatic generator matrix encoding

// -----------------------
// LDPC decoding algorithm
// -----------------------
#define SUM_PRODUCT      1   // sum-product decoding
#define MIN_SUM          2   // min-sum decoding
#define SC_MIN_SUM       3   // self corrected min sum decoding
#define GALLAGER_B       4   // Gallager-B decoding
#define STOCHASTIC      10   // Stochastic decoder 

// -------------------
// stochastic decoding
// -------------------
#define STO_RERAND_OFF        0   // re-randomization off
#define STO_RERAND_EMEM       1   // edge-memories based re-randomization 
#define STO_RERAND_ECNT       2   // edge-counters based re-randomization 
#define STO_APCNT_VN_IN       0   // use incoming var-node messages to update a-posteriori counter
#define STO_APCNT_VN_OUT      1   // use outgoing var-node messages to update a-posteriori counter
#define STO_APCNT_VN_OUTREG   2   // use regenerative outgoing var-node messages to update a-posteriori counter
#define STO_SYNDROME_AP_HD    0   // use a posteriori hard decision to compute syndrome
#define STO_SYNDROME_CN_IN    1   // use incoming check-node messages to compute syndrome
#define STO_RERAND_INIT_PROB  0   // probabilistic initialization
#define STO_RERAND_INIT_CONST 1   // constant initialization

// ------------------------------------
// stopping criterion for LDPC decoding
// ------------------------------------
#define STOP_MAX_ITER  0   // stop only if 'max_iter_nb' has been reached
#define STOP_SYNDROME  1   // stop if syndrome = 0 (codeword found) or if 'max_iter_nb' has been reached

// ---------------
// LDPC scheduling
// ---------------
#define FLOOD_SCHEDULING   1   // flooding (parallel) scheduling
#define SERIAL_SCHEDULING  2   // serial scheduling
#define LAYER_SCHEDULING   3   // layered scheduling

// -----------------------------------------------------
// parameters for the LDPC code construction (if needed)
// -----------------------------------------------------
#define LDPC_ARG_NB                24               // number of arguments submitted w/ the ldpc program
#define LDPC_CONF_FILE   "../LDPC/ldpc.conf"        // configuration file of the ldpc program
#define LDPC_PROGRAM        "../LDPC/ldpc.x"        // ldpc program
#define MAX_VAR_DEG                50               // maximum variable degree
#define MAX_CHK_DEG                50               // maximum variable degree

// --------------
// default values
// --------------
#define MAX_LLR_ABS          100.0                  // max absolute value of LLRs
#define MIN_EB_N0           -100.0                  // minimum Eb/N0 value
#define MAX_EB_N0            100.0                  // maximum Eb/N0 value
#define DEFAULT_CONFIG_FILE  "../data/config.dat"   // default configuration file
#define PATH_OF_RES_FILE     "../results/"          // default folder for results file
#define PATH_OF_FIXP_FILE    "../data/fixp/"        // default folder for the fixp-type file
#define EXT_OF_RES_FILE      ".res"                 // extension of the results file
#define EXT_OF_FIXP_FILE     ".dat"                 // extension of the fixp-type file

// -------------------------------------------
// paths and extensions of the simulator files
// -------------------------------------------
#define PATH_OF_LDPC_FILE  "../data/ldpc/"     // path for LDPC files 
#define QC_BMAT_FILE_EXT    ".bmat"            // extension of the Quasi-Cyclic Base Matrix file
#define GEN_MAT_FILE_EXT    ".gm"              // extension of the Generator Matrix File
#define  PC_MAT_FILE_EXT    ".pcm"             // extension of the Parity Check Matrix file
#define PATH_OF_NETL_FILE  "../data/netlist/"  // path for the netlist file
#define NETL_FILE_EXT       ".nl"              // extension of the netlist file

// ===========================
// EXTERN FUNCTION DECLARATION
// ===========================
extern double RandU(void);       // generates uniform distributed variables in ]0, 1[ 
extern double RandN(void);       // generates gaussian distributed unitary variables with zero mean 
extern void sort_array(double *ptArray, int ArrayNum, int order); // sorts array in specified order

// ================
// INLINE FUNCTIONS
// ================

// ###############################################################################################
// Function name: rand_perm(int *ptPerm, int Len)
// Description  : computed a random permutation of length Len, which is stored in the ptPerm array 
// ###############################################################################################
inline void rand_perm(int *ptPerm, int Len)
{
	int I, J;
	
	ptPerm[0] = 0;
    
    for ( I = 1 ; I < Len ; I++ )
    {
		J = rand() % I;
        ptPerm[I] = ptPerm[J];
        ptPerm[J] = I;
    }
}


#endif
