/* ####################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : CPE_SIMULATOR.cpp
## Language             : C++
## Short description    : contains the main function of the CPE simulator chain 
##                      : first the simulator modules are allocated and activated
##                      : the simulation loop successively calls the modules' main() methods
##                      : 
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## #################################################################################### */

#include "../include/CPE_SIMULATOR.h"

// =================================================
// main mudules of the simulator (static parameters)
// =================================================
static BIN_SRC   *ptSrc;   // pointer to the binary source module
static NET_ENC   *ptEncF;  // pointer to the netlist encoding module
static NET_ENC   *ptEncP;  // pointer to the netlist encoding module
static DECODING  *ptDec;   // pointer to the decoding module
static BER_FER   *ptBer;   // pointer to the BER/FER module

// ============================
// static functions declaration
// ============================
static void free_memory(void);
static void set_gate_perr(double GatePerrValue);


// ***********************************************************************************
//                                  MAIN FUNCTION
// ***********************************************************************************
int main(int argc, char * argv[]){

    int StopSimulation;      // used to detect the end of the simulation
	int ErrorFlag;           // used to detect errors during execution
	int    GatePerrIndx;     // current index of gate error probability parameter
	double GatePerrValue;    // current value of gate error probability parameter
	CONFIG Config;           // configuration class
	NET_ENC_CFG EncF_Cfg;    // configuration structure for F encoder
	NET_ENC_CFG EncP_Cfg;    // configuration structure for P encoder

	// -------------------------
    // Error Flag initialization
    // -------------------------
    ErrorFlag = IN_ERROR;
	
	// ===============================================
	// configuration parameters of the simulator chain
	// ===============================================
	
	// --------------------------------------
    // set the name of the configuration file
    // --------------------------------------     
    switch (argc - 1) 
    {
    case 0:   // NO ARG: set the default configuration file
        strcpy(CONFIG::ConfFile, DEFAULT_CONFIG_FILE);
        break;
    case 1:  // ONE ARG: get the configuration file name
        strcpy(CONFIG::ConfFile, argv[1]);
        break;
    default:
        fprintf(stderr, "\n\n[ERROR: main function] only the name of the "
		                "configuration file may be passed to the simulator!\n\n");
        goto end;  // replaces the 'break' instruction

    }   // end of 'switch ( argc )'
		
	// ---------------------------
	// read the configuration file
	// ---------------------------
	if ( Config.read_configfile() == IN_ERROR ) goto end; 
	
	// =============================================
	// memory allocation for the simulator's modules
	// =============================================
	if ( AllocPointer(ptSrc,  "CPE_SIMULATOR::ptSrc")  == IN_ERROR ) goto end; 
	if ( AllocPointer(ptEncF, "CPE_SIMULATOR::ptEncF") == IN_ERROR ) goto end; 
	if ( AllocPointer(ptEncP, "CPE_SIMULATOR::ptEncP") == IN_ERROR ) goto end; 
	if ( AllocPointer(ptDec,  "CPE_SIMULATOR::ptDec")  == IN_ERROR ) goto end; 
	if ( AllocPointer(ptBer,  "CPE_SIMULATOR::ptBer")  == IN_ERROR ) goto end; 
	
	// =================================================
	// set configuration parameters for netlist encoders
	// =================================================
	// F encoder
	EncF_Cfg.nb_inputs  = CONFIG::NbInputs;
	EncF_Cfg.nb_outputs = CONFIG::NbOutputsF;
	EncF_Cfg.crit_thres = CONFIG::CriticThres[0];
	strcpy(EncF_Cfg.NL_file, CONFIG::NetlistFile);
	strcat(EncF_Cfg.NL_file, "_F");
	
	// P encoder
	EncP_Cfg.nb_inputs  = CONFIG::NbInputs;
	EncP_Cfg.nb_outputs = CONFIG::NbOutputsP;
	EncP_Cfg.crit_thres = CONFIG::CriticThres[1];
	strcpy(EncP_Cfg.NL_file, CONFIG::NetlistFile);
	strcat(EncP_Cfg.NL_file, "_P");
	
	// ======================================================================
	// modules activation
	// the in fifo(s) of each module must be set before the module activation
	// ======================================================================
	
	// Binary source module (no in fifo)
	if (ptSrc->Activate() == IN_ERROR) goto end;
	
	// netlist encoding module -- original circuit F
	ptEncF->ptFifoIn = ptSrc->ptFifoOut;          // buffer of input bits
	if (ptEncF->Activate(&EncF_Cfg) == IN_ERROR) goto end; // class activation
	
	// netlist encoding module -- parity circuit P
	ptEncP->ptFifoIn = ptSrc->ptFifoOut;          // buffer of input bits
	if (ptEncP->Activate(&EncP_Cfg) == IN_ERROR) goto end; // class activation

	// Decoding module
	ptDec->ptFifoIn1 = ptEncF->ptFifoOut1;        // outputs bits from F (original circuit)
	ptDec->ptFifoIn2 = ptEncP->ptFifoOut1;        // outputs bits from P (parity circuit)
	if (ptDec->Activate() == IN_ERROR) goto end;  // class activation
	
	// BER/FER module
	ptBer->ptFifoIn1 = ptEncF->ptFifoOut2;       // error-free output bits of original circuit F
	ptBer->ptFifoIn2 = ptDec->ptFifoOut1;        // estimated (decoded) output bits of original circuit F
	ptBer->ptFifoIn3 = ptDec->ptFifoOut2;        // decoding statistics
	ptBer->ptFifoIn4 = ptEncP->ptFifoOut2;       // error-free output bits of parity circuit P
	if (ptBer->Activate() == IN_ERROR) goto end; // class activation
	
	// =====================
	// display configuration
	// =====================
	if ( display_config() == IN_ERROR ) goto end;

	// ===================
	// call srand function
	// ===================
	srand(time(NULL));
	   
	// ##############################################################################
    //                               SIMULATION LOOP
    // ############################################################################## 

	for ( GatePerrIndx = 0 ; GatePerrIndx < CONFIG::GatePerrNum ; GatePerrIndx++ )
	{ 		
		// -----------------------
		// channel's paramer value
		// -----------------------
		GatePerrValue = CONFIG::ptGatePerrList[GatePerrIndx];
		
		// -------------------------------------------------------------------------------------------
		// set the current value of the gate error probability to netlist encoders and ber/fer modules
		// -------------------------------------------------------------------------------------------
		set_gate_perr(GatePerrValue);
		
		// ------------------------------------------------------------
		// init the parameter that detects of the end of the simulation
		// ------------------------------------------------------------
    	StopSimulation = 0;  
		
		// ---------------------------------------------------------------
		// run the simulator: call the main methods of simulator's modules
		// ---------------------------------------------------------------
    	while ( StopSimulation == 0 )
    	{
        	// -----------------------------------------------------------------------------------
			// simulation loop: binary source -> encoding -> channel -> decoding -> ber/fer update
			// -----------------------------------------------------------------------------------
			ptSrc->Main();                // Binary source module
			ptEncF->Main();               // Netlist encoder: original circuit F
	    	ptEncP->Main();               // Netlist encoder: parity circuit P
			ptDec->Main();                // Decoding module
	    	ptBer->Main(StopSimulation);  // BER/FER update
			
			// -------------------------------------------------------------------------------------------
	    	// exit the 'while' loop if the simulation for the current channel param value must be stopped
	    	// -------------------------------------------------------------------------------------------
	    	if ( StopSimulation > 0 ) break;
			
    	} // end of the 'while ( !StopSimulation )' loop
		
		// --------------------------------------------------------------------------------------
	    // exit the 'for' loop if the whole simulation (all channel param values) must be stopped
	    // --------------------------------------------------------------------------------------
		if ( StopSimulation == 2 ) break;
	
	} // end of 'for ( GatePerrIndx = 0 ; GatePerrIndx < CONFIG::GatePerrNum ; GatePerrIndx++ )' loop
	
	// ##############################################################################
    //                          ENDD OF THE SIMULATION LOOP
    // ############################################################################## 
	
	printf("====================================================================================================================|\n");
	switch ( StopSimulation )
	{
	case 1:
		printf("\nSimulation stopped: all gate error probability values have been simulated!\n\n");
		break;
	
	case 2:
		printf("\nSimulation stopped: the current number of erroneous frames is\n"
		       "                  : less than one tenth of the minimum number!\n\n");
		break;
		
	default:
		break;
	}
    
	// ==================================
	// no error detected during execution
	// ==================================
	ErrorFlag = NO_ERROR;
	
end:

    // -------------------------------
    // Ressources must be de-allocated
    // -------------------------------
    free_memory();

    return ErrorFlag;
}




// ***********************************************************************************
//                                  FREE_MEMORY FUNCTION
// ***********************************************************************************

static void free_memory(void){    
		
	// =================
    // static parameters
    // =================
	FreePointer(ptSrc);
	FreePointer(ptEncF);
	FreePointer(ptEncP);
	FreePointer(ptDec);
	FreePointer(ptBer);
}


// ***********************************************************************************
//                                SET_GATEPERR FUNCTION
// ***********************************************************************************
static void set_gate_perr(double GatePerrValue)
{
	// set current gate error probability value to netlist encoders
	ptEncF->SetGatePerr(GatePerrValue);
	ptEncP->SetGatePerr(GatePerrValue);
	
	// set current gate error probability value to ber/fer module
	ptBer->SetGatePerr(GatePerrValue);
		
	return;
}


