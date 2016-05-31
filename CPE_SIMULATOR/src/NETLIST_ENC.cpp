/* ###########################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : NETLIST_ENC.cpp
## Language             : C++
## Short description    : implements the netlist encoding module
##                      :
## History              : 23/10/14 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ########################################################################################### */
#include "../include/NETLIST_ENC.h"

// ####################################
// Method name : NET_ENC
// Description : constructor definition
// ####################################
NET_ENC::NET_ENC()
{
    // -------------
    // reset actions
    // -------------
	ptFifoIn   = 0;
	ptFifoOut1 = 0;
	ptFifoOut2 = 0;
	Reset();

}   // end of constructor

// ###################################
// Method name : ~NET_ENC
// Description : destructor definition
// ###################################

NET_ENC::~NET_ENC()
{
    // -----------------
    // Resources release
    // -----------------
    Free();

}   // end of destructor

// ##############################
// Method name : Activate
// Description : class activation
// ##############################
int NET_ENC::Activate(NET_ENC_CFG *ptConfig)
{
    int ErrorFlag = IN_ERROR;
    
	if ( ptFifoIn == 0 )
	{
		fprintf(stderr, "\n\nERROR [NET_ENC::Activate] input fifo(s) of the module must be set before module activation\n\n");
		goto end;
	}

    // ---------------------------------------
    // Get the module configuration parameters
    // ---------------------------------------
    GetParam(ptConfig);    
	
	// -----------------------------------------------
	// initialize arrays of pointers to standard gates
	// -----------------------------------------------
	InitStdGatesArrays();
	
	// ------------------
	// read the LDPC file
	// ------------------
	if ( ReadNLfile() == IN_ERROR ) goto end;
	
    // --------------------
    // Allocation of memory
    // --------------------
    if ( Mem() == IN_ERROR ) goto end;

    // ----------------------
    // Initialization actions
    // ----------------------
    if ( Init() == IN_ERROR ) goto end;
	
	// -----------------
	// verify activation
	// -----------------
	if ( (ptFifoOut1 == 0) || (ptFifoOut2 == 0) )
	{
		fprintf(stderr, "\n\nERROR [NET_ENC::Activate] Activation failure (out fifo(s) = 0)\n\n");
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

void NET_ENC::Reset()
{
    // ------------------------------------------------------------------------
    // Reset the dynamic memory array and structure pointers used by the module
    // ------------------------------------------------------------------------
	Ninputs       = -1;   // number of input nodes
	Noutputs      = -1;   // number of output nodes
	Ninternals    = -1;   // number of internal nodes
	Ntotal        = -1;   // total numner of nodes (inputs + outpus + internals)
	crit_thres    = -1;   // criticality threshold
	gate_perr     = -1;   // error probability of standard logic gates
	ptInDeg       = 0;    // nodes' indegrees (indegree = number of predecessors)
	ptInList      = 0;    // list of nodes's predecessors
	ptEncOrder    = 0;    // encoding (processing) order of nodes
	ptCritDeg     = 0;    // criticity degree (number of successor output nodes)  
	ptOutNodes    = 0;    // indexes of output nodes
	ptNodeValue   = 0;    // nodes' binary values
	ptNodeGateProb= 0;    // probabilistic (error-prone) gate for each node in netlist
	ptNodeGateExa = 0;    // exact (error-free) gate for each node in netlist
	uint64_gate_perr = 0; // error probability standard logic gates converted to uint64 value
	seed[0] = 0;          // seed for the uint64_rand function
	seed[1] = 0;          // seed for the uint64_rand function
	
}   // end of 'Reset' method

// ###########################################################
// Method name : GetParam
// Description : get the value of the configuration parameters
// ###########################################################

void NET_ENC::GetParam(NET_ENC_CFG *ptConfig)
{	
	nb_inputs    = ptConfig->nb_inputs;    // number of inputs
	nb_outputs   = ptConfig->nb_outputs;   // number of outputs
	crit_thres   = ptConfig->crit_thres;   // criticality threshold
	
	// name of the netlist file 
	strcpy(NL_file, PATH_OF_NETL_FILE); // path of the netlist file
	strcat(NL_file, ptConfig->NL_file); // short name of the LDPC file 
	strcat(NL_file, NETL_FILE_EXT);     // file extension
	
	return;

}   // end of 'GetParam' method

// #############################################################
// Method name : InitStdGatesArrays
// Description : initialize arrays of pointers to standard gates
// #############################################################
void NET_ENC::InitStdGatesArrays(void)
{
	// ---------------------------------------------------
	// init array of pointers to error-free standard gates
	// ---------------------------------------------------
	exa_gate_array[IDX_INV]   = &NET_ENC::exa_gate_inv; 
	exa_gate_array[IDX_AND]   = &NET_ENC::exa_gate_and;   
	exa_gate_array[IDX_OR]    = &NET_ENC::exa_gate_or;  
	exa_gate_array[IDX_XOR]   = &NET_ENC::exa_gate_xor;
	exa_gate_array[IDX_NAND]  = &NET_ENC::exa_gate_nand;
	exa_gate_array[IDX_NOR]   = &NET_ENC::exa_gate_nor;
	exa_gate_array[IDX_NXOR]  = &NET_ENC::exa_gate_nxor;
	
	// ----------------------------------------------------
	// init array of pointers to error-prone standard gates
	// ----------------------------------------------------
	prob_gate_array[IDX_INV]  = &NET_ENC::prob_gate_inv; 
	prob_gate_array[IDX_AND]  = &NET_ENC::prob_gate_and;   
	prob_gate_array[IDX_OR]   = &NET_ENC::prob_gate_or;  
	prob_gate_array[IDX_XOR]  = &NET_ENC::prob_gate_xor;
	prob_gate_array[IDX_NAND] = &NET_ENC::prob_gate_nand;
	prob_gate_array[IDX_NOR]  = &NET_ENC::prob_gate_nor;
	prob_gate_array[IDX_NXOR] = &NET_ENC::prob_gate_nxor;
	
	return;
}

// ###################################
// Method name : ReadNLfile
// Description : read the netlist file
// ###################################
int NET_ENC::ReadNLfile()
{
    FILE *NLF;        // stream for LDPC encoding file
	int  indx, deg;   // local indexes
	int  gate_type;   // type of the gate
	int* ptGateType;  // array of gates' type
	int  CTnodesNb;   // number of critical nodes
	int  ErrorFlag;   // error flag - returned value!
    
	// --------------------------------
    // Initialization of the error flag
    // --------------------------------
    ErrorFlag  = IN_ERROR;
	ptGateType = 0;
	
    // ====================================
    // open the stream for the netlist file
    // ====================================
    if ( (NLF = fopen(NL_file, "r")) == NULL )
	{
		fprintf (stderr, "\n\n[ERROR- NET_ENC::ReadNLfile] Cannot open the NETLIST file \"%s\" (read mode)!\n\n", NL_file);
		goto end;
	}
	
	// -------------------------------------------------
	// read number of inputs, outputs and internal nodes
	// -------------------------------------------------
	fscanf(NLF, "%d", &Ninputs);    // number of inputs
	fscanf(NLF, "%d", &Noutputs);   // number of ouputs
	fscanf(NLF, "%d", &Ninternals); // number of internal nodes
	Ntotal = Ninputs + Noutputs + Ninternals; // total number of nodes
	
	// -----------------------------------------
	// verify consistency with config parameters
	// -----------------------------------------
	if ( Ninputs != nb_inputs )
	{
		fprintf (stderr, "\n\n[ERROR- NET_ENC::ReadNLfile] Inconsistency between the number of inputs in netlist and configuration files!\n\n");
		goto end;
	}
	if ( Noutputs != nb_outputs )
	{
		fprintf (stderr, "\n\n[ERROR- NET_ENC::ReadNLfile] Inconsistency between the number of outputs in netlist and configuration files!\n\n");
		goto end;
	}
	
	// ================================================================================================
	// allocate memory for 'ptInDeg', 'ptEncOrder', 'ptOutNodes', 'ptNodeGateProb', and 'ptNodeGateExa'
	// ================================================================================================
	if ( AllocArray(ptGateType,     "NET_ENC::ptGateType",     Ntotal)   == IN_ERROR ) goto end;
	if ( AllocArray(ptInDeg,        "NET_ENC::ptInDeg",        Ntotal)   == IN_ERROR ) goto end;
	if ( AllocArray(ptEncOrder,     "NET_ENC::ptEncOrder",     Ntotal)   == IN_ERROR ) goto end;
	if ( AllocArray(ptCritDeg,      "NET_ENC::ptCritDeg",      Ntotal)   == IN_ERROR ) goto end;
	if ( AllocArray(ptOutNodes,     "NET_ENC::ptOutNodes",     Noutputs) == IN_ERROR ) goto end;
	if ( AllocArray(ptNodeGateProb, "NET_ENC::ptNodeGateProb", Ntotal)   == IN_ERROR ) goto end;
	if ( AllocArray(ptNodeGateExa,  "NET_ENC::ptNodeGateExa",  Ntotal)   == IN_ERROR ) goto end;
	
	// --------------------------------
	// read indegrees from netlist file
	// --------------------------------
	// inputs are of indegree zero
	for ( indx = 0 ; indx < Ninputs ; indx++ ) ptInDeg[indx] = 0; 
	
	// indegrees for internal and output nodes are read from file
	for ( indx = Ninputs ; indx < Ntotal ; indx++ )
	{
		fscanf(NLF, "%d", &ptInDeg[indx]);
		// verify value
		if ( ptInDeg[indx] <= 0 )
		{
			fprintf (stderr, "\n\n[ERROR- NET_ENC::ReadNLfile] indegree values must be positive!\n\n");
			goto end;
		}
	}
	
	// ==============================
	// allocate memory for 'ptInList'
	// ==============================
	if ( AllocMatrix(ptInList, "NET_ENC::ptInList", Ntotal, ptInDeg) == IN_ERROR ) goto end;
	
	// -----------------------------------------------------------------------
	// input nodes: set corresponding error-free and error-prone gates to NULL
	// -----------------------------------------------------------------------
	for ( indx = 0 ; indx < Ninputs ; indx++ ) 
	{
		ptNodeGateExa[indx]  = NULL; 
		ptNodeGateProb[indx] = NULL; 
		ptGateType[indx]     = -1;
	}
	
	// --------------------------------------------------------------------------------------------------
	// internal/output nodes: read corresponding gate type and list of predecessors from the netlist file
	// --------------------------------------------------------------------------------------------------
	for ( indx = Ninputs ; indx < Ntotal ; indx++ )
	{
		// read gate type and verify its values
		fscanf(NLF, "%d", &gate_type); 
		ptGateType[indx] = gate_type;
		if ( (gate_type < 0) || (gate_type >= NUM_STD_GATES) )
		{
			fprintf (stderr, "\n\n[ERROR- NET_ENC::ReadNLfile] gate type value must be between 0 and %d)! type:%d at index: %d in file %s\n\n" , NUM_STD_GATES-1, gate_type, indx,NL_file);
			goto end;
		}
		if ( (gate_type == 0) && (ptInDeg[indx] != 1) )
		{
			fprintf (stderr, "\n\n[ERROR- NET_ENC::ReadNLfile] inconsistency between gate type (inverter) and gate indegree (%d)!\n\n", ptInDeg[indx] );
			goto end;
		}
		// set the corresponding error-free and error-prone gates
		ptNodeGateExa[indx]  = exa_gate_array[gate_type];
		ptNodeGateProb[indx] = prob_gate_array[gate_type];
		
		// read list of predecessors 
		for ( deg = 0 ; deg < ptInDeg[indx] ; deg++ )
		{
			fscanf(NLF, "%d", &ptInList[indx][deg]);
			if ( (ptInList[indx][deg] < 0) || (ptInList[indx][deg] >= Ntotal) )
			{
				fprintf (stderr, "\n\n[ERROR- NET_ENC::ReadNLfile] predecessor index out of bounds (must be between 0 and Ntotal-1)!\n\n");
				goto end;
			}
		}
	}
	
	// ------------------------------------
	// read the encoding (processing) order
	// ------------------------------------
	// first nodes to be processed are input nodes
	for ( indx = 0 ; indx < Ninputs ; indx++ ) ptEncOrder[indx] = indx; 
	
	// processing order for internal and output nodes is read from file
	for ( indx = Ninputs ; indx < Ntotal ; indx++ )
	{
		fscanf(NLF, "%d", &ptEncOrder[indx]);
        //fprintf(stdout,"%d at %d in %s\n",ptEncOrder[indx],indx,NL_file);
		// verify value
		if ( (ptEncOrder[indx] < Ninputs) || (ptEncOrder[indx] >= Ntotal) )
		{
			fprintf (stderr, "\n\n[ERROR- NET_ENC::ReadNLfile] processing node index out of bounds (must be between %d and %d)!index %d, value %d in file %s\n\n",Ninputs,Ntotal-1,indx,ptEncOrder[indx],NL_file);
			goto end;
		}
	}
	
	// -----------------------------------
	// read the criticity degrees of nodes
	// -----------------------------------
	for ( indx = 0 ; indx < Ntotal ; indx++ )
	{
		fscanf(NLF, "%d", &ptCritDeg[indx]);
        //fprintf(stdout,"%d at index %d\n",ptCritDeg[indx],indx);
		// verify value
		if ( (ptCritDeg[indx] < 1) || (ptCritDeg[indx] > Noutputs) )
		{
			fprintf (stderr, "\n\n[ERROR- NET_ENC::ReadNLfile] criticity degree value out of bounds (must be between 1 and %d)! in file %s value: %d\n\n",Noutputs,NL_file,ptCritDeg[indx]);
			goto end;
		}
	}
	
	// --------------------------------
	// read indexes of the output nodes
	// --------------------------------
	for ( indx = 0 ; indx < Noutputs ; indx++ )
	{
		fscanf(NLF, "%d", &ptOutNodes[indx]);
		// verify value
		if ( (ptOutNodes[indx] < Ninputs) || (ptOutNodes[indx] >= Ntotal) )
		{
			fprintf (stderr, "\n\n[ERROR- NET_ENC::ReadNLfile] output node index out of bounds (must be between Ninputs and Ntotal-1)!\n\n");
			goto end;
		}
	}
	
	// -------------------------------------------
	// set critical gates as reliable (error-free) 
	// -------------------------------------------
	if ( crit_thres > 0 )
	{
		CTnodesNb = 0;
		for ( indx = Ninputs ; indx < Ntotal  ; indx++ )
		{
			if ( ptCritDeg[indx] > crit_thres )
			{
				CTnodesNb++;
				ptNodeGateProb[indx] = exa_gate_array[ptGateType[indx]];
			}
		}
		export_disp_config_param("nb_critic_nodes", CTnodesNb);
	}
	
	// -------------------------------------
	// export number of internal nodes value
	// -------------------------------------
	export_disp_config_param("nb_intern_nodes", Ninternals);
	
    // ==============================
    // netlist file successfully read
    // ==============================
    ErrorFlag = NO_ERROR;

end:
    if (NLF != 0) {fclose(NLF); NLF = 0;}
	FreeArray(ptGateType);
	
    return ErrorFlag;   

}   // end of 'ReadNLfile' method

 

// ###############################
// Method name : ReadNLfile
// Description : memory allocation
// ###############################

int NET_ENC::Mem()
{
    // --------------------------------
    // Initialization of the error flag
    // --------------------------------
    int ErrorFlag = IN_ERROR;

    // -------------------------------------------------------------------------------
    // Allocate memory for output fifos: 'ptFifoOut1', 'ptFifoOut2', and 'ptNodeValue'
	// Remark: last position of second fifo stores the number of erroneous output bits
    // -------------------------------------------------------------------------------
	if ( AllocArray(ptFifoOut1,  "NET_ENC::ptFifoOut1",  Noutputs)   == IN_ERROR ) goto end;
	if ( AllocArray(ptFifoOut2,  "NET_ENC::ptFifoOut2",  Noutputs+1) == IN_ERROR ) goto end;
	if ( AllocArray(ptNodeValue, "NET_ENC::ptNodeValue", Ntotal)     == IN_ERROR ) goto end;

    // -----------------------------------
    // memory allocation successfully done
    // -----------------------------------
    ErrorFlag = NO_ERROR;

end:
    
    return ErrorFlag;   

}   // end of 'Mem' method


// #################################################################
// Method name : Init
// Description : initializations needed by the implemented algorithm
// #################################################################

int NET_ENC::Init()
{
	int indx, node, deg;       // local indexes
	int ErrorFlag = IN_ERROR; // error flag - returned value
	
	// --------------------------------------------------------------
	// verify the encoding (processing) pattern from the netlist file
	// --------------------------------------------------------------
	for ( indx = 0       ; indx < Ninputs ; indx++ ) ptNodeValue[indx] = 1;  // known value
	for ( indx = Ninputs ; indx < Ntotal  ; indx++ ) ptNodeValue[indx] = 0;  // unknown value
	
	for ( indx = Ninputs ; indx < Ntotal  ; indx++ )
	{
		node = ptEncOrder[indx];
		for ( deg = 0 ; deg < ptInDeg[node] ; deg++ )
		{
			if ( ptNodeValue[ptInList[node][deg]] == 0 )
			{
				fprintf (stderr, "\n\n[ERROR- NET_ENC::Init] wrong encoding order (predecessor value not known when node is computed)!\n\n");
				goto end;
			}
		}
		ptNodeValue[node] = 1; // known value
	}
	
	// -------------------------------------------------------------
	// verify the criticity degree values read from the netlist file
	// -------------------------------------------------------------
	for ( indx = 0 ; indx < Noutputs ; indx++ )
	{
		if ( ptCritDeg[ptOutNodes[indx]] != 1 )
		{
			fprintf (stderr, "\n\n[ERROR- NET_ENC::Init] criticality degree of output nodes must be equal to 1!\n\n");
			//goto end;
		}
	}
	
	// --------------------------------------------------
	// init the seed value for the uint64_rand() function
	// --------------------------------------------------
	seed[0] = 0; seed[1] = 0;
    while(seed[0] == 0) seed[0] = ((uint64_t) rand()) ^ (((uint64_t) rand()) >> 32);
    while(seed[1] == 0) seed[1] = ((uint64_t) rand()) ^ (((uint64_t) rand()) >> 32);
	
	// =================
	// no error detected
	// =================
	ErrorFlag = NO_ERROR;

end:  
    return ErrorFlag;

}   // end of 'Init' method

// ######################################
// Method name : Free
// Description : resources release method
// ######################################

void NET_ENC::Free()
{
    // -------------------------
    // Free the memory allocated 
    // -------------------------
	FreeArray(ptFifoOut1);
	FreeArray(ptFifoOut2);
	FreeArray(ptInDeg);   
	FreeArray(ptEncOrder); 
	FreeArray(ptCritDeg);
	FreeArray(ptOutNodes);  
	FreeArray(ptNodeValue);  
	FreeArray(ptNodeGateProb);
	FreeArray(ptNodeGateExa);
	FreeMatrix(ptInList);  

}   // end of 'Free' method

// ###############################################################
// Method name : SetGatePerr
// Description : set the error probability of standard logic gates
// ###############################################################
void NET_ENC::SetGatePerr (double perr_value)
{
	uint64_t uint64_max; // UINT64_MAX macro not always defined in <stdint.h>
	
	// get error probability value
	gate_perr = perr_value;
	
	// set the corresponding uint64_t value
	uint64_max = ((uint64_t) 1) << 63;
	uint64_max = (uint64_max-1) | uint64_max;
	
	if (gate_perr < 1.0 - 1e-16)
	{
		uint64_gate_perr = (uint64_t) (gate_perr * ((double) uint64_max));
	}
	else uint64_gate_perr = (uint64_t) uint64_max;

}

// ###########################################
// Method name : Main
// Description : main module method definition
// ###########################################
void NET_ENC::Main()
{
	int indx, node, count; // local indexes
	
	// --------------------------------------------------------
	// get the values of input nodes from input fifo (ptFifoIn)
	// --------------------------------------------------------
	for ( indx = 0 ; indx < Ninputs ; indx++ )
	{
		ptNodeValue[indx] = ptFifoIn[indx];
	}
	
	// ===========================================================
	// compute output bits using error prone (probabilistic) gates
	// ===========================================================
	
	// -----------------------------------------------------------------
	// netlist encoding: compute the values of internal and output nodes
	// -----------------------------------------------------------------
	for ( indx = Ninputs ; indx < Ntotal ; indx++ )
	{
		node = ptEncOrder[indx];
		ptNodeValue[node] = (this->*ptNodeGateProb[node])(ptInDeg[node], ptInList[node]);
	}
	
	// ----------------------------------------------------
	// copy values of the output nodes in first output fifo
	// ----------------------------------------------------
	for ( indx = 0 ; indx < Noutputs ; indx++ )
	{
		ptFifoOut1[indx] = ptNodeValue[ptOutNodes[indx]];
	}
	
	// ==========================================
	// compute output bits using error free gates
	// ==========================================

	// ------------------------------------------------------------------------
	// recompute the values of internal and output nodes using error-free gates
	// ------------------------------------------------------------------------
	for ( indx = Ninputs ; indx < Ntotal ; indx++ )
	{
		node = ptEncOrder[indx];
		ptNodeValue[node] = (this->*ptNodeGateExa[node])(ptInDeg[node], ptInList[node]);
	}
		
	// -----------------------------------------------------
	// copy values of the output nodes in second output fifo
	// -----------------------------------------------------
	for ( indx = 0 ; indx < Noutputs ; indx++ )
	{
		ptFifoOut2[indx] = ptNodeValue[ptOutNodes[indx]];
	}
	
	// ============================================
	// compute the number of erroneous output nodes
	// ============================================
	count = 0;
	for ( indx = 0 ; indx < Noutputs ; indx++ )
	{
		if ( ptFifoOut1[indx] != ptFifoOut2[indx] ) count++;
	}
	// save 'count' value in the last position of ptFifoOut2
	ptFifoOut2[Noutputs] = count;
	
	return;

}   // end of 'Main' method



