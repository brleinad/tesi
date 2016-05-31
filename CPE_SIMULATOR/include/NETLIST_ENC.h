/* ##################################################################################################
## Organization         : CEA/LETI
##                      :
## Module name          : NETLIST_ENC
## File name            : NETLIST_ENC.h (header file for 'NETLIST_ENC.cpp')
## Language             : C++
## Short description    : implements the netlist encoding module
##                      :
## History              : 23/10/2014 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ################################################################################################## */

#ifndef _NETLIST_ENC_H_
#define _NETLIST_ENC_H_

// ===============
// INCLUDE SECTION
// ===============

// ---------------------
// System header file(s)
// ---------------------
#include <iostream>     // std::cerr
#include <new>          // std::nothrow
#include <cerrno>       // errno
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
using namespace std;

// ---------------------
// User's header file(s)
// ---------------------
#include "Tools.h"
#include "DispConfig.h"

// ==============
// DEFINE SECTION
//===============
#define NUM_STD_GATES  7    // number of standard logic gates
#define IDX_INV    0    // INV  gate index
#define IDX_AND    1    // AND  gate index
#define IDX_OR     2    // OR   gate index
#define IDX_XOR    3    // XOR  gate index
#define IDX_NAND   4    // NAND gate index
#define IDX_NOR    5    // NOR  gate index
#define IDX_NXOR   6    // NXOR gate index

// ===========================
// NET_ENC DECLARATION SECTION
// ===========================
class NET_ENC;
typedef int(NET_ENC::*gate_2arg)(int, int*);

typedef struct
{
	int  nb_inputs;         // number of inputs
	int  nb_outputs;        // number of outputs
	int  crit_thres;        // criticality threshold
	char NL_file[STR_LEN];  // name of the netlist file   
	
} NET_ENC_CFG;


class NET_ENC 
{
public:

    // -----------------------------------------
    // DECLARATION OF THE NET_ENC PUBLIC METHODS
    // -----------------------------------------
     NET_ENC();      // constructor
    ~NET_ENC();      // destructor
	void Main();     // method which supports the thread process
	int  Activate(NET_ENC_CFG *ptConfig); // class activation 
	void SetGatePerr(double perr_value);  // set the vaue of the gate error probability
    
    // --------------------------------------
    // DECLARATION OF THE MODULE PUBLIC FIFOs
    // --------------------------------------
	int *ptFifoIn;   // input port : input bits
	int *ptFifoOut1; // output port: output bits -- computed using error prone gates
	int *ptFifoOut2; // output port: output bits -- computed using error free gates
	
private:
	// ------------------------------------------------
    // DECLARATION OF VARIABLES FOR STORING THE NETLIST
    // ------------------------------------------------
	int   Ninputs;     // number of input nodes
	int   Noutputs;    // number of output nodes
	int   Ninternals;  // number of internal nodes
	int   Ntotal;      // total numner of nodes (inputs + outpus + internals)
	int   crit_thres;  // criticality threshold
	int  *ptInDeg;     // nodes' indegrees (indegree = number of predecessors)
	int **ptInList;    // list of nodes's predecessors
	int  *ptEncOrder;  // encoding (processing) order of nodes
	int  *ptCritDeg;   // criticity degree (number of successor output nodes)  
	int  *ptOutNodes;  // indexes of output nodes

	// ------------------------------------------
    // DECLARATION OF THE NET_ENC PRIVATE METHODS
    // ------------------------------------------
	void GetParam(NET_ENC_CFG *ptConfig);   // get values of configuration parameters 
	void InitStdGatesArrays();     // initialize arrays of pointers to standard gates
	void Reset();                  // reset ressources
	void Free();                   // resources release
    int  Mem();                    // memory allocation
    int  Init();                   // initialization of algorithm parameters
	int  ReadNLfile();             // read netlist file
    	
	// ------------------------------------
	// local copies of the config paramters
	// ------------------------------------
	int  nb_inputs;         // number of inputs
	int  nb_outputs;        // number of outputs
	char NL_file[STR_LEN];  // name of the netlist file
	double gate_perr;       // error probability standard logic gates
	uint64_t uint64_gate_perr;  // error probability standard logic gates converted to uint64 value
	
	// -------------------------------------------
	// variables used by the implemented algorithm
	// -------------------------------------------
	int *ptNodeValue;          // nodes' binary values
	gate_2arg *ptNodeGateProb; // probabilistic (error-prone) gate for each node in netlist
	gate_2arg *ptNodeGateExa;  // exact (error-free) gate for each node in netlist
	gate_2arg exa_gate_array[NUM_STD_GATES];  // array containing pointers to all error-free standard gates
    gate_2arg prob_gate_array[NUM_STD_GATES]; // array containing pointers to all error-prone standard gates
	
	// ----------------------------------------------------------------------
	// random number generator: xorshift128+ generator, with period 2^{128}−1 
	// it is the fastest generator passing BigCrush without systematic errors
	// seed must be initialized so that it is not everywhere zero!
	// ----------------------------------------------------------------------
	uint64_t seed[2];
	uint64_t uint64_rand (void) 
	{
		uint64_t s1 = seed[0];
		uint64_t s0 = seed[1];
		seed[0] = s0;
		s1 ^= s1 << 23;
		return ( seed[1] = ( s1 ^ s0 ^ ( s1 >> 17 ) ^ ( s0 >> 26 ) ) ) + s0;
	}
	
	// -------------------------------------------
	// METHODS IMPLEMENTING ERROR-FREE LOGIC GATES
	// -------------------------------------------
	// exact (error-free) XOR gate
	int exa_gate_xor(int N, int *ptInNodes)
	{
		int indx, output; 

		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output ^= ptNodeValue[ptInNodes[indx]];
		}
		
		return output;
	}
	// exact (error-free) NXOR gate
	int exa_gate_nxor(int N, int *ptInNodes)
	{
		int indx, output; 

		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output ^= ptNodeValue[ptInNodes[indx]];
		}
		
		return output^1;
	}
	
	// exact (error-free) OR gate
	int exa_gate_or(int N, int *ptInNodes)
	{
		int indx, output; 
		
		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output |= ptNodeValue[ptInNodes[indx]];
		}
		return output;
	}
	// exact (error-free) OR gate
	int exa_gate_nor(int N, int *ptInNodes)
	{
		int indx, output; 
		
		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output |= ptNodeValue[ptInNodes[indx]];
		}
		return output^1;
	}
	
	// exact (error-free) AND gate
	int exa_gate_and(int N, int *ptInNodes)
	{
		int indx, output; 
		
		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output &= ptNodeValue[ptInNodes[indx]];
		}
		return output;
	}
	// exact (error-free) NAND gate
	int exa_gate_nand(int N, int *ptInNodes)
	{
		int indx, output; 
		
		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output &= ptNodeValue[ptInNodes[indx]];
		}
		return output^1;
	}
	
	// exact (error-free) INV gate
	// int N argument not used, but kept for consistency with other gates' type
	int exa_gate_inv(int N, int *ptInNodes)
	{
		int output; 
		
		output = ptNodeValue[ptInNodes[0]] ^ 1;
		return output;
	}
	
	// --------------------------------------------
	// METHODS IMPLEMENTING ERROR-PRONE LOGIC GATES
	// --------------------------------------------
	// probabilistic (error-prone) XOR gate
	int prob_gate_xor(int N, int *ptInNodes)
	{
		int indx, output; 

		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output ^= ptNodeValue[ptInNodes[indx]];
		}
		// error injection
		return ( uint64_rand() < uint64_gate_perr ? output^1 : output );
	}
	// probabilistic (error-prone) NXOR gate
	int prob_gate_nxor(int N, int *ptInNodes)
	{
		int indx, output; 

		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output ^= ptNodeValue[ptInNodes[indx]];
		}
		return ( uint64_rand() < uint64_gate_perr ? output : output^1 );
	}
	
	// probabilistic (error-prone) OR gate
	int prob_gate_or(int N, int *ptInNodes)
	{
		int indx, output; 
		
		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output |= ptNodeValue[ptInNodes[indx]];
		}
		// error injection
		return ( uint64_rand() < uint64_gate_perr ? output^1 : output );
	}
	// probabilistic (error-prone) OR gate
	int prob_gate_nor(int N, int *ptInNodes)
	{
		int indx, output; 
		
		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output |= ptNodeValue[ptInNodes[indx]];
		}
		// error injection
		return ( uint64_rand() < uint64_gate_perr ? output : output^1 );
	}
	
	// probabilistic (error-prone) AND gate
	int prob_gate_and(int N, int *ptInNodes)
	{
		int indx, output; 
		
		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output &= ptNodeValue[ptInNodes[indx]];
		}
		// error injection
		return ( uint64_rand() < uint64_gate_perr ? output^1 : output );
	}
	// probabilistic (error-prone) NAND gate
	int prob_gate_nand(int N, int *ptInNodes)
	{
		int indx, output; 
		
		output = ptNodeValue[ptInNodes[0]];
		for ( indx  = 1 ; indx < N ; indx++ )
		{
			output &= ptNodeValue[ptInNodes[indx]];
		}
		// error injection
		return ( uint64_rand() < uint64_gate_perr ? output : output^1 );
	}
	
	// probabilistic (error-prone) INV gate
	// int N argument not used, but kept for consistency with other gates' type
	int prob_gate_inv(int N, int *ptInNodes)
	{
		int output; 
		
		if ( uint64_rand() < uint64_gate_perr ) output = ptNodeValue[ptInNodes[0]];
		else output = ptNodeValue[ptInNodes[0]] ^ 1;
		
		return output;
	}
	
	
};



#endif      // _NETLIST_ENC_H_
