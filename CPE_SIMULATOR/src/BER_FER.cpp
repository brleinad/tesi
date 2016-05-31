/* #############################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : BER_FER.cpp
## Language             : C++
## Short description    : implements the computation of Bit and Frame Error Rates (BEr & FER)
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ############################################################################################# */

#include "../include/BER_FER.h"

// ####################################
// Method name : BER_FER
// Description : constructor definition
// ####################################
BER_FER::BER_FER()
{
    // -------------
    // reset actions
    // -------------
	ptFifoIn1 = 0;
	ptFifoIn2 = 0;
	ptFifoIn3 = 0;
	ptFifoIn4 = 0;
	Reset();

}   // end of constructor

// ###################################
// Method name : ~BER_FER
// Description : destructor definition
// ###################################

BER_FER::~BER_FER()
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

int BER_FER::Activate()
{
    int ErrorFlag = IN_ERROR;
    
	if ( (ptFifoIn1 == 0) || (ptFifoIn2 == 0) || (ptFifoIn3 == 0) || (ptFifoIn4 == 0) )
	{
		fprintf(stderr, "\n\nERROR [BER_FER module] input fifo(s) of the module must be set before module activation\n\n");
		goto end;
	}
	
    // ---------------------------------------
    // Get the module configuration parameters
    // ---------------------------------------
    GetParam();    

    // --------------------
    // Allocation of memory
    // --------------------
    if ( Mem() == IN_ERROR ) goto end;
    
    // ----------------------
    // Initialization actions
    // ----------------------
    if ( Init() == IN_ERROR ) goto end;

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

void BER_FER::Reset()
{
	// -----
    // reset  
    // -----
    // empty
	
	return;
	
}   // end of 'Reset' method

// ###########################################################
// Method name : GetParam
// Description : get the value of the configuration parameters
// ###########################################################

void BER_FER::GetParam()
{
	F_NbOutputs      = CONFIG::NbOutputsF;  	 // number of output bits - original circuit F
	P_NbOutputs      = CONFIG::NbOutputsP;  	 // number of output bits - original circuit F
	StopCriterion    = CONFIG::StopCriterion;    // stopping criterion
	MaxNbSimulFrames = CONFIG::MaxNbSimulFrames; // maximum number of simulated frames (transmitted codewords)
    MinNbErrorFrames = CONFIG::MinNbErrorFrames; // maximum number of erroneous frames (undecoded codewords)
    ResfileRefresh   = CONFIG::ResfileRefresh;   // controls intermediate display to results file
    StdoutRefresh    = CONFIG::StdoutRefresh;    // controls intermediate display on stdout
	strcpy(ResultsFile, CONFIG::ResultsFile);    // name of results file

}   // end of 'GetParam' method

// ########################################################################################
// Method name : Mem
// Description : memory allocation for input/output arrays and control parameters structure
// ########################################################################################
int BER_FER::Mem()
{
    // --------------------------------
    // Initialization of the error flag
    // --------------------------------
    int ErrorFlag = IN_ERROR;

    // -------------------
    // Allocate the memory 
    // -------------------
    // empty

	// -----------------------------
	// memory successfully allocated
	// -----------------------------
    ErrorFlag = NO_ERROR;

end:
    return ErrorFlag;   

}   // end of 'Mem' method


// #################################################################
// Method name : Init
// Description : initializations needed by the implemented algorithm
// #################################################################
int BER_FER::Init()
{
    int ErrorFlag = IN_ERROR;
	
	// -----------------------------------------
	// variables needed for BER & FER estimation  
	// ----------------------------------------- 
	F_NbOutBitErr     = 0;     // number of F-output bits in error
	P_NbOutBitErr     = 0;     // number of P-output bits in error
	Fdec_NbBitErr     = 0;     // number of decoded (estimated) F-bits in error
	Fdec_NbWordErr    = 0;     // number of decoded (estimated) F-words in error
	Fdec_outBER       = -1.0;  // Bit Error Rate -- decoded F-output bits
    Fdec_outFER       = -1.0;  // Frame Error Rate -- decoded F-output bits
	NbSimulFrames     = 0;     // number of simulated frames
	NbLdpcDetect      = 0;     // number of detected error frames
	NbLdpcDetectFalse = 0;     // number of false detections 
	NbLdpcUndetect    = 0;     // number of undetected error frames
	TotalDecIterNb    = 0;     // total number of decoding iterations
	
	// -------------------------
	// sccessful inittialization
	// -------------------------
	ErrorFlag = NO_ERROR;
    
end:
	return ErrorFlag;  

}   // end of 'Init' method

// ######################################
// Method name : Free
// Description : resources release method
// ######################################

void BER_FER::Free()
{
    // -------------------------
    // Free the memory allocated 
    // -------------------------
	// empty
	
    return;

}   // end of 'Free' method

// ###############################################################
// Method name : SetGatePerr
// Description : set the error probability of standard logic gates
// ###############################################################
void BER_FER::SetGatePerr (double perr_value)
{
	// get error probability value
	GatePerr = perr_value;
}

// ###########################################
// Method name : Main
// Description : main module method definition
// ###########################################

void BER_FER::Main(int &StopSimulation)
{
    int count_err; // number of erroneous bits (current frame)
    int indx;      // local index
	FILE *fid;
	
	// =====================================
	// update the number of simulated frames
	// =====================================
	NbSimulFrames++;
	
	// =======================================================================
    // determine the numbers of erroneous source bits within the current frame
    // =======================================================================
    count_err = 0;
    for ( indx = 0 ; indx < F_NbOutputs ; indx++ )
    {	
		if ( ptFifoIn1[indx] != ptFifoIn2[indx] ) count_err++;
    }
     
    // ======================================================================
    // update the total numbers of erroneous source bits and erroneous frames
    // ======================================================================
    Fdec_NbBitErr += ((double) count_err); 
    if ( count_err > 0 ) Fdec_NbWordErr += 1.0;
	
	// ==========================================
	// update 'F_NbOutBitErr' and 'P_NbOutBitErr'
	// ==========================================
	F_NbOutBitErr += ((double) ptFifoIn1[F_NbOutputs]);
	P_NbOutBitErr += ((double) ptFifoIn4[P_NbOutputs]);
	
	/*if ( ptFifoIn3[_DEC_STATUS_] == IN_ERROR )
	{
		printf("\nF_NbOutBitErr = %d, P_NbOutBitErr = %d (perr = %.2e) => count_err = %d\n", ptFifoIn1[F_NbOutputs], ptFifoIn4[P_NbOutputs], \
		((double)ptFifoIn1[F_NbOutputs] + ptFifoIn4[P_NbOutputs])/((double)F_NbOutputs+P_NbOutputs), count_err);
		getchar();
	}*/
	
	// ====================
	// LDPC error detection
	// ====================
	if ( StopCriterion != STOP_MAX_ITER )
	{
		if ( count_err > 0 ) // erroneous frame
		{
			if (ptFifoIn3[_DEC_STATUS_] == IN_ERROR) NbLdpcDetect++;
			else NbLdpcUndetect++;
		} 
		else if (ptFifoIn3[_DEC_STATUS_] == IN_ERROR) NbLdpcDetectFalse++;
	}
	
	// ==============================================
	// update the total number of decoding iterations
	// ==============================================
	TotalDecIterNb += (double) ptFifoIn3[_NUM_ITER_];
    
    // ============================
    // compute (source) BER and FER
    // ============================
    Fdec_outBER = Fdec_NbBitErr  / ((double) NbSimulFrames * (double) F_NbOutputs);    
    Fdec_outFER = Fdec_NbWordErr / ((double) NbSimulFrames);
 
	// =============================
    // display BER and FER on stdout
    // =============================
    
    if ( (StdoutRefresh > 0) && (NbSimulFrames % StdoutRefresh == 0) )
    {
        display_stdout(0);
    }
	
	
	
	/* if ( NbSimulFrames <= 100 )
	{
		fid = fopen("data_file_1.dat", "a");
		for ( indx = 0 ; indx < F_NbOutputs ; indx++ )
			fprintf(fid, "%d ", ptFifoIn1[indx]);
		fprintf(fid, "\n");
		for ( indx = 0 ; indx < P_NbOutputs ; indx++ )
			fprintf(fid, "%d ", ptFifoIn4[indx]);
		fprintf(fid, "\n");
		
		for ( indx = 0 ; indx < F_NbOutputs ; indx++ )
			fprintf(fid, "%d ", ptFifoIn2[indx]);
		fprintf(fid, "\n");
		
		fclose(fid);
	} */
	
	
	
        
    // ===========================================
    // verify the condition to stop the simulation
    // ===========================================
    if ( (Fdec_NbWordErr >= MinNbErrorFrames) || (NbSimulFrames >= MaxNbSimulFrames) ) 
    {
        // stop simulation for the current channel param value
		StopSimulation = 1; 
    }
	
	if ( (StopSimulation == 1) && (Fdec_NbWordErr <= MinNbErrorFrames/10) )
	{
		// stop the whole simulation (all channel param values)
		StopSimulation = 2;
	}
    
    if ( StopSimulation > 0 )
    {
		display_stdout(1);
        display_resfile("final");

		// ===============================================
		// reset variables needed for BER & FER estimation  
		// =============================================== 
		F_NbOutBitErr     = 0;     // number of F-output bits in error
		P_NbOutBitErr     = 0;     // number of P-output bits in error
		Fdec_NbBitErr     = 0;     // number of decoded (estimated) F-bits in error
		Fdec_NbWordErr    = 0;     // number of decoded (estimated) F-words in error
		Fdec_outBER       = -1.0;  // Bit Error Rate -- decoded F-output bits
		Fdec_outFER       = -1.0;  // Frame Error Rate -- decoded F-output bits
		NbSimulFrames     = 0;     // number of simulated frames
		NbLdpcDetect      = 0;     // number of detected error frames
		NbLdpcDetectFalse = 0;     // number of false detections 
		NbLdpcUndetect    = 0;     // number of undetected error frames
		TotalDecIterNb    = 0;     // total number of decoding iterations	
    }
	else if ( (ResfileRefresh > 0) && (NbSimulFrames % ResfileRefresh == 0) )
	{
		display_resfile("intermediate");
	}
	
    return;

}   // end of 'Main' method

// ##########################################
// Method name : display_stdout
// Description : displays BER & FER on stdout
// ##########################################

void BER_FER::display_stdout(int NewLine)
{
    static int Counter = 0;  
   
    while ( Counter > 0 )
    {
        printf("\b");
        Counter--;
    }
	printf(" %4.2e | %4.2e | %4.2e | %5.3e | %5.3e | %6d / %-9d | %6d  |  %6d  | %5d | %6.1f  %n", \
				GatePerr, F_NbOutBitErr/ ((double) NbSimulFrames * (double) F_NbOutputs),  P_NbOutBitErr/ ((double) NbSimulFrames * (double) P_NbOutputs), \
				Fdec_outBER, Fdec_outFER, (int) Fdec_NbWordErr, NbSimulFrames, NbLdpcDetect,  \
				NbLdpcUndetect, NbLdpcDetectFalse, ((double) TotalDecIterNb) / ((double) NbSimulFrames), &Counter);

	fflush(stdout);
	if (NewLine == 1)
	{
		printf("\n");
		Counter = 0;
	}
   
}   // end of 'display_stdout' method

// ################################################
// Method name : display_resfile
// Description : displays BER & FER on results file
// ################################################
void BER_FER::display_resfile(const char *restype)
{
    FILE   *Res = 0;                // results file stream
	static fpos_t *position = 0;    // position within the file
	char Str[MAX_RESFILE_LINE_LEN]; // local string
	
    // -----------------------------------
    // open the stream for the output file
    // -----------------------------------
    
    if( (Res = fopen(ResultsFile, "r+")) == 0 )
    {
		fprintf (stderr, "\n\nERROR [BER_FER::display_resfile] Can not open the results file "\
	                 	 "\"%s\" (write mode)!\n\n", ResultsFile);
		goto end;
    }
	
	// first time the file is opened
	if ( position == 0 )
	{
		while ( fgets(Str, MAX_RESFILE_LINE_LEN, Res) != NULL )
		{
			// nothing to do
		}
		// save the file position
		if ( AllocPointer(position, "position") == NO_ERROR )
		{
			fgetpos(Res, position);
		}
		else position = 0;
	}
    else fsetpos(Res, position);

    // ======================
    // write the results file
    // ======================
	//fprintf(Res, "    %5.3e   %5.3e   %6d   %-9d   %6d     %6d    %5d   %6.1f  # %-20s\n", \
			Fdec_outBER, Fdec_outFER, (int) Fdec_NbWordErr, NbSimulFrames,  NbLdpcDetect, NbLdpcUndetect, \
			NbLdpcDetectFalse, ((double) TotalDecIterNb) / ((double) NbSimulFrames), restype);
	
	fprintf(Res, "  %4.2e   %4.2e   %4.2e   %5.3e   %5.3e   %6d   %-9d   %6d     %6d    %5d   %6.1f  # %-20s\n", \
				GatePerr, F_NbOutBitErr/ ((double) NbSimulFrames * (double) F_NbOutputs),  P_NbOutBitErr/ ((double) NbSimulFrames * (double) P_NbOutputs), \
				Fdec_outBER, Fdec_outFER, (int) Fdec_NbWordErr, NbSimulFrames, NbLdpcDetect,  \
				NbLdpcUndetect, NbLdpcDetectFalse, ((double) TotalDecIterNb) / ((double) NbSimulFrames), restype);
				
	if (strcmp(restype, "final") == 0)
	{
		// save the file position
		fgetpos(Res, position);
	}
    
    fclose(Res); Res = NULL;
    
end:
    return;
    
}   // end of 'display_resfile' method



