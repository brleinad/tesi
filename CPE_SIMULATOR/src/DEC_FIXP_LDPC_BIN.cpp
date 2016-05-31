/* ###########################################################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : DEC_FIXP_LDPC_BIN.cpp
## Language             : C++
## Short description    : implements fixed-point LDPC decoding
##                      :  implemented algorithms: Min-Sum, Norm.-Min-Sum, Offset-Min-Sum, Self-Corrected-Min-Sum 
##                      : implemented schedulings: flooding, serial, layered
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ######################################################################################################################## */

#include "../include/DEC_FIXP_LDPC_BIN.h"

// ####################################
// Method name : DEC_FIXP_LDPC_BIN
// Description : constructor definition
// ####################################

DEC_FIXP_LDPC_BIN::DEC_FIXP_LDPC_BIN()
{
    // -------------
    // reset actions
    // -------------
	Reset();

}   // end of constructor

// ###################################
// Method name : ~DEC_FIXP_LDPC_BIN
// Description : destructor definition
// ###################################

DEC_FIXP_LDPC_BIN::~DEC_FIXP_LDPC_BIN()
{
    // =====
    // Resources release
    // =====
    Free();

}   // end of destructor

// ##############################
// Method name : Activate
// Description : class activation
// ##############################

int DEC_FIXP_LDPC_BIN::Activate(DECODING *ptDec)
{
    int ErrorFlag = IN_ERROR; 

	// ---------------------------------------
    // Get the module configuration parameters
    // ---------------------------------------
    GetParam(ptDec);    

    // --------------------
    // Allocation of memory
    // --------------------
    if ( Mem() == IN_ERROR ) goto end;
	
	// ----------------------
    // Initialization actions
    // ----------------------
    if ( Init() == IN_ERROR ) goto end;

	// --------------------
	// sucessful activation
	// --------------------
	ErrorFlag = NO_ERROR; 
end:
    
    return ErrorFlag;
}

// ############################################################
// Method name : Reset
// Description : method provided for further design refinements
// ############################################################

void DEC_FIXP_LDPC_BIN::Reset()
{	
	// config parameters
	LdpcDecoding = -1;    // ldpc decoding (Min-Sum, Min-Max, etc.)
	MaxIterNb    = -1;    // maximum number of decoding iterations
	MS_Offset    = -1;    // offset factor for min-sum decoding
	
	// variables storing the parity check matrix
	VarNodesNb = -1;  // number of variable nodes (also equal to the code length) 
    ChkNodesNb = -1;  // number of parity check nodes  
    MaxChkDeg  = -1;  // maximun of check degrees  
    ptChkDeg   = 0;   // store the check-node degrees 
    ptChkList  = 0;   // store the list of variable nodes connected to check nodes
	
	// input/output variables
	ptRxSoftBits    = 0;  // demapped soft bits (RX)
	ptDecodedBits   = 0;  // decoded bits (RX)
	ptDecStatistics = 0;  // decoding statistics
	
	// variables needed be the decoding algorithm
	ptChkMess  = 0;      // extrinsic messages from check to variable nodes 
    ptVarMess  = 0;      // extrinsic messages from variable to check nodes
    ptPostInfo = 0;      // store the pseudo-posterior log-likelihood ratios (LLR) 
	
	// other parameters used by the decoding algorithm
	LayerChkNb = -1;    // number of check-nodes per layer (serial/layered decoding)
	DecIterNb  = -1;    // counter over the decodoing iterations

}   // end of 'Reset' method

// ###########################################################
// Method name : GetParam
// Description : get the value of the configuration parameters
// ###########################################################

void DEC_FIXP_LDPC_BIN::GetParam(DECODING *ptDec)
{

	// config parameters
	LdpcDecoding   = ptDec->LdpcDecoding;   // ldpc decoding (Min-Sum, Min-Max, etc.)
	LdpcScheduling = ptDec->LdpcScheduling; // ldpc scheduling (flooding, serial, layered)
	LdpcLayersNb   = ptDec->LdpcLayersNb;   // number of layers (for layered decoding)
	MaxIterNb      = ptDec->MaxIterNb;      // maximum number of decoding iterations
	FixpSizeExt    = ptDec->FixpSizeExt;    // size (in bits) of the extrinsic LLRs (exchanged messages)
	StopCriterion  = ptDec->StopCriterion;  // stopping criterion
	GallB_thres    = ptDec->GallB_thres;    // Gallager-B qualified majority threshold
	MS_Offset      = ptDec->MS_Offset;      // offset factor for min-sum decoding
	
	// mavimum abs value of exchanged messages - is derived from 'FixpSizeExt'
	MaxAbsMess  = ((1 << (FixpSizeExt-1))-1);
	
	// variables storing the parity check matrix
	VarNodesNb = ptDec->VarNodesNb;     // number of variable nodes (also equal to the code length) 
    ChkNodesNb = ptDec->ChkNodesNb;     // number of parity check nodes  
    MaxChkDeg  = ptDec->MaxChkDeg;      // maximun of check degrees  
    ptChkDeg   = ptDec->ptChkDeg;       // store the check-node degrees 
    ptChkList  = ptDec->ptChkList;      // store the list of variable nodes connected to check nodes
	
	// input/output variables
	ptRxSoftBits    = ptDec->ptFixp_FifoIn;    // demapped soft bits (RX)
	ptDecodedBits   = ptDec->ptDecodedBits;  // decoded bits (RX)
	ptDecStatistics = ptDec->ptFifoOut2;       // decoding statistics
}

// ###############################
// Method name : Mem
// Description : memory allocation 
// ###############################
int DEC_FIXP_LDPC_BIN::Mem()
{
    int ErrorFlag = IN_ERROR;
	
	// -----------------
	// memory allocation
	// -----------------
	if ( AllocPointer(ptFixp,   "DEC_FIXP_LDPC_BIN::ptFixp") == IN_ERROR ) goto end;
    if ( AllocArray(ptPostInfo, "DEC_FIXP_LDPC_BIN::ptPostInfo", VarNodesNb) == IN_ERROR ) goto end;
    if ( AllocMatrix(ptChkMess, "DEC_FIXP_LDPC_BIN::ptChkMess",  ChkNodesNb, MaxChkDeg) == IN_ERROR ) goto end;
    if ( AllocMatrix(ptVarMess, "DEC_FIXP_LDPC_BIN::ptVarMess",  ChkNodesNb, MaxChkDeg) == IN_ERROR ) goto end; 
	
    // -----------------------------
    // memory successfully allocated
    // -----------------------------
    ErrorFlag = NO_ERROR;

end:
    return ErrorFlag;   

}   // end of 'Mem' method

// ####################################
// Method name : Init
// Description : initialization actions
// ####################################
int DEC_FIXP_LDPC_BIN::Init()
{
    int Chk, TmpValue;
	int ErrorFlag = IN_ERROR;
	
	// =====================================================================
	// set the Variable Node Unit (VNU), according to the decoding algorithm
	// =====================================================================
	switch ( LdpcDecoding )
	{
	case GALLAGER_B:  // Gallager-B decoding
		VNU = &DEC_FIXP_LDPC_BIN::VNU_GalB;
		break;
		
	case SC_MIN_SUM:  // self-corrected min-sum
		VNU = &DEC_FIXP_LDPC_BIN::VNU_SCMS;
	    break;
	
	 default:  // min-sum, normalized-min-sum, offset-min-sum
		VNU = &DEC_FIXP_LDPC_BIN::VNU_MS;
	    break;
    }
    
    // ==================================================================
	// set the Check Node Unit (CNU), according to the decoding algorithm
	// ==================================================================
	switch ( LdpcDecoding )
	{
	case GALLAGER_B:  // Gallager-B decoding
		CNU = &DEC_FIXP_LDPC_BIN::CNU_GalB;
		break;
		
	default:  // min-sum, normalized-min-sum, offset-min-sum, self-corrected min-sum
		CNU = &DEC_FIXP_LDPC_BIN::CNU_MS;
	    break;
    }
	
	// ===================================================================
	// set the number of check-nodes per layer (serial/layered scheduling)
	// ===================================================================
	if ( LdpcScheduling == SERIAL_SCHEDULING )
	{
		LayerChkNb = 1;
	}
	else if ( LdpcScheduling == LAYER_SCHEDULING )
	{
		LayerChkNb = ChkNodesNb / LdpcLayersNb;
	}
	
	// =============================
	// check the offset factor value
	// =============================
	if ( MS_Offset >= (1 << (FixpSizeExt-2)) )
	{
		fprintf(stderr, "\n\n[ERROR- DEC_FIXP_LDPC_BIN::Init] the offset factor (%f) for the Min-Sum decoding "
			            "(fixed-point arithmetic) must be a positive integer, not greater than %d!\n\n", \
						MS_Offset, (1 << (FixpSizeExt-2))-1);
		goto end;
	}

	// ========================================
	// activate the fix-point arithmetic object
	// ========================================
	if (ptFixp->Activate() == IN_ERROR) goto end;
	fixp_sgn = ptFixp->get_fixp_sgn();
	fixp_abs = ptFixp->get_fixp_abs();
	fixp_sat = ptFixp->get_fixp_sat();
	fixp_add = ptFixp->get_fixp_add();
	fixp_lth = ptFixp->get_fixp_lth();
	fixp_xor = ptFixp->get_fixp_xor();
	fixp_scu = ptFixp->get_fixp_scu();

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

void DEC_FIXP_LDPC_BIN::Free()
{
    FreeMatrix(ptChkMess);  // extrinsic messages from check to variable nodes 
    FreeMatrix(ptVarMess);  // extrinsic messages from variable to check nodes
    FreeArray(ptPostInfo);  // store the pseudo-posterior log-likelihood ratios (LLR) 
	FreePointer(ptFixp);    // pointer to fixed-point arithmetic class

}   // end of 'Free' method



// ###########################################
// Method name : Main
// Description : main module method definition
// ###########################################
void DEC_FIXP_LDPC_BIN::Main()
{	
	int Var, Chk;     // indexes used for variable and check nodes
    int Deg, ChkDeg;  // indexes used for degrees, resp. check degrees
	
	// ======================
    // DECODER INITIALIZATION
    // ======================
	
    // ---------------------------
    // variable and check messages
    // ---------------------------
    for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
    {
        ChkDeg = ptChkDeg[Chk];
		for ( Deg = 0 ; Deg < ChkDeg ; Deg++ )
		{
			Var = ptChkList[Chk][Deg];
	    	ptVarMess[Chk][Deg] = (ptFixp->*fixp_sat)(ptRxSoftBits[Var]);
			ptChkMess[Chk][Deg] = 0;
		}
    }
    // -----------------------------------------------------------------------------
    // a posteriori information and decoded bits (in case no iteration is performed)
    // -----------------------------------------------------------------------------
    for ( Var = 0 ; Var < VarNodesNb ; Var++ )
    {
        ptPostInfo[Var]    = ptRxSoftBits[Var];
		ptDecodedBits[Var] = HARD_BIT(ptRxSoftBits[Var]);
    }

	// ======================================================
	// call LDPC decoding accoding to the decoding scheduling
	// ======================================================
	if ( LdpcScheduling == FLOOD_SCHEDULING )
	{
		Flood_Decoding(); 
	}
	else // serial/layered
	{
		Layer_Decoding();
	}
	
	// ==================================================
	// set hard bits according to A Posteriori LLR values
	// (only if stopping criterion = STOP_MAX_ITER)
	// ==================================================
	if ( StopCriterion == STOP_MAX_ITER )
	{
		for ( Var = 0 ; Var < VarNodesNb ; Var++ )
		{
			ptDecodedBits[Var] = HARD_BIT(ptPostInfo[Var]);
		}
	}
	
	// ===========================
	// set the decoding statistics
	// ===========================
	if ( DecIterNb < MaxIterNb )
	{
		ptDecStatistics[_DEC_STATUS_] = NO_ERROR;
		ptDecStatistics[_NUM_ITER_]   = DecIterNb+1;
	}
	else // DecIterNb = MaxIterNb
	{
		ptDecStatistics[_DEC_STATUS_] = IN_ERROR;
		ptDecStatistics[_NUM_ITER_]   = MaxIterNb;
	}
	
}   // end of 'Main' method

// ####################################################################
// Method name : Flood_Decoding
// Description : implements LDPC decoding using the flooding-scheduling
// ####################################################################
void DEC_FIXP_LDPC_BIN::Flood_Decoding() 
{
	int Var, Chk;     // indexes used for variable and check nodes
    int Deg, ChkDeg;  // indexes used for degrees, resp. check degrees
	
    // initialization done in the 'main()' method
    // ==============
    // ITERATION LOOP
    // ==============
	
    for ( DecIterNb = 0 ; DecIterNb < MaxIterNb ; DecIterNb++ )
    {
        // ---------------------------------------
		// compute check to variable node messages
		// ---------------------------------------
		// messages outgoing from all check-nodes
		(this->*CNU)(0, ChkNodesNb); 
	
		// ------------------------------------
		// compute the a posteriori information
		// ------------------------------------
		for ( Var = 0 ; Var < VarNodesNb ; Var++ )
        {
            ptPostInfo[Var] = ptRxSoftBits[Var];
        }
	
		for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
        {
            ChkDeg = ptChkDeg[Chk];
			
	    	for ( Deg = 0 ; Deg < ChkDeg ; Deg++ )
	    	{
	        	Var = ptChkList[Chk][Deg];
				ptPostInfo[Var] = (ptFixp->*fixp_add)(ptPostInfo[Var], ptChkMess[Chk][Deg]); 
	    	}
        }
	
		// ---------------------------------------------------------------------------------------
		// if all the parity checks are verified (hence, syndrome = 0), exit the iteration loop
		// remark: the 'syndrome()' method also sets the hard bit values acc. to ptPostInfo values
		// ---------------------------------------------------------------------------------------
		if ( (StopCriterion == STOP_SYNDROME) && (Syndrome() == 0) ) break; 
		
		// ----------------------------------
		// compute variable to check messages
		// ----------------------------------
		// messages incoming to all check-nodes
		(this->*VNU)(0, ChkNodesNb);
 
    }   // end of 'for ( DecIterNb = 0 ; DecIterNb < MaxIterNb ; DecIterNb++ )' loop

}   // end of 'Flood_Decoding' method

// ###################################################################
// Method name : Layer_Decoding
// Description : implements LDPC decoding using the layered-scheduling
// ###################################################################
void DEC_FIXP_LDPC_BIN::Layer_Decoding() 
{
	int Var, Chk;            // indexes used for variable and check nodes
	int Chk_First, Chk_Last; // first and last chk-nodes in a given layer
    int Deg, ChkDeg;         // indexes used for degrees, resp. check degrees
	
    // initialization done in the 'main()' method
    // ==============
    // ITERATION LOOP
    // ==============

    for ( DecIterNb = 0 ; DecIterNb < MaxIterNb ; DecIterNb++ )
    {
		// ---------------------------
		// loop over check-node layers
		// ---------------------------
		for ( Chk_First = 0 ; Chk_First < ChkNodesNb ; Chk_First += LayerChkNb )
		{
			// ------------------------------------
			// layer = [Chk_First, ..., Chk_Last-1]
			// ------------------------------------
			Chk_Last = Chk_First + LayerChkNb;
			
			// ----------------------------------
			// compute variable to check messages
			// ----------------------------------
			// messages incoming to check-nodes in current layer
			(this->*VNU)(Chk_First, Chk_Last);
			
			// --------------------------------------------------------------
			// withdraw check-node messages from the a posteriori information
			// --------------------------------------------------------------
			for ( Chk = Chk_First ; Chk < Chk_Last ; Chk++ )
			{
				ChkDeg = ptChkDeg[Chk];
				for ( Deg = 0 ; Deg < ChkDeg ; Deg++ )
				{
					Var = ptChkList[Chk][Deg];
					ptPostInfo[Var] = (ptFixp->*fixp_add)(ptPostInfo[Var], -ptChkMess[Chk][Deg]);
				}
			}
			
			// ----------------------------------
			// compute variable to check messages
			// ----------------------------------
			// messages incoming to check-nodes in current layer
			// (this->*VNU)(Chk_First, Chk_Last);
			
			// ---------------------------------------
			// compute check to variable node messages
			// ---------------------------------------
			// messages outgoing from check-nodes in current layer
			(this->*CNU)(Chk_First, Chk_Last); 
	
			// ----------------------------------------------------------------
			// update the a posteriori information: add new check-node messages
			// ----------------------------------------------------------------
			for ( Chk = Chk_First ; Chk < Chk_Last ; Chk++ )
			{
				ChkDeg = ptChkDeg[Chk];
				for ( Deg = 0 ; Deg < ChkDeg ; Deg++ )
				{
					Var = ptChkList[Chk][Deg];
					ptPostInfo[Var] = (ptFixp->*fixp_add)(ptPostInfo[Var], ptChkMess[Chk][Deg]);
				}
			}
			
		}   // end of 'for ( Chk = 0 ; Chk < ChkNodesNb ; Chk += LayerChkNb )' loop
	
		// ---------------------------------------------------------------------------------------
		// if all the parity checks are verified (hence, syndrome = 0), exit the iteration loop
		// remark: the 'syndrome()' method also sets the hard bit values acc. to ptPostInfo values
		// ---------------------------------------------------------------------------------------
		if ( (StopCriterion == STOP_SYNDROME) && (Syndrome() == 0) ) break; 
 
    }   // end of 'for ( DecIterNb = 0 ; DecIterNb < MaxIterNb ; DecIterNb++ )' loop
	

}   // end of 'Layer_Decoding' method

// #########################################################################################
// Method name : CNU_MS [Check-Node Unit for Min-Sum-based decoders]
// Description : computes check to variable nodes messages within Min-Sum-based decoders
//             : only messages outgoing from check-nodes Chk ex [Chk_First, ..., Chk_Last-1]
// #########################################################################################
void DEC_FIXP_LDPC_BIN::CNU_MS(int Chk_First, int Chk_Last)
{
    int Chk;              // index used to run through check nodes
    int Deg, ChkDeg;      // indexes used for degrees, resp. check degrees
    int XorAllSigns;      // XOR of signs of all incoming check-node messages   
    int DegMin1;          // degree corresponding to AbsMin1 (see below)
    int AbsMin1, AbsMin2; // minimum and second minimum absulute value of all messages received by a given check 
    int VarMess;          // temporary storage of variable messages
    int VarMessAbs;       // temporary storage of variable messages absolute values
    int ChkMess;          // temporary storage of check messages 
    int ChkMessSgn;       // temporary storage of check messages signs
    int ChkMessAbs;       // temporary storage of check messages absolute values
	int Indx, TmpValue;   // local indexe / temporary storage
    
    // ======================================
    // check to variable messages computation
    // ======================================

    for( Chk = Chk_First ; Chk < Chk_Last ; Chk++ )
    {
		ChkDeg  = ptChkDeg[Chk];
		XorAllSigns = 0;      // XOR of signs of ALL the messages from variables connected to 'Chk'
		AbsMin1 = MaxAbsMess; // smallest absulute value of ALL messages from variables connected to 'Chk'
		AbsMin2 = MaxAbsMess; // second smallest absulute value of ALL messages from variables connected to 'Chk'
		DegMin1 = 0;          // degree corresponding to the AbsMin1 value

		// -------------------------------------------------------------------------------------------------------------
		// run through variables connected to 'Chk' and update 'XorAllSigns', 'AbsMin1', 'AbsMin2', and 'DegMin1' values
		// -------------------------------------------------------------------------------------------------------------
		for( Deg = 0 ; Deg < ChkDeg ; Deg++)
		{
	    	VarMess = ptVarMess[Chk][Deg];
	    	XorAllSigns = (ptFixp->*fixp_xor)(XorAllSigns, (ptFixp->*fixp_sgn)(VarMess));
	    	VarMessAbs  = (ptFixp->*fixp_abs)(VarMess);
     
	    	if( (ptFixp->*fixp_lth)(VarMessAbs, AbsMin1) )
	    	{
				AbsMin2 = AbsMin1;
				AbsMin1 = VarMessAbs;
				DegMin1 = Deg;
	    	}
	    	else if( (ptFixp->*fixp_lth)(VarMessAbs, AbsMin2) )
	    	{
				AbsMin2 = VarMessAbs;
	    	}
		}  

		// ----------------------------------------------------------------------------
		// for each variable connected to 'Chk' compute the corresponding check message
		// ----------------------------------------------------------------------------	
		for ( Deg = 0; Deg < ChkDeg; Deg++ )
		{
	    	VarMess = ptVarMess[Chk][Deg];
	    	ChkMessSgn = (ptFixp->*fixp_xor)(XorAllSigns, (ptFixp->*fixp_sgn)(VarMess));
	        
	    	if ( Deg == DegMin1 ) ChkMessAbs = AbsMin2;
	    	else                  ChkMessAbs = AbsMin1;
	        
	    	if (ChkMessSgn == 0) ptChkMess[Chk][Deg] = ChkMessAbs;
			else ptChkMess[Chk][Deg] = -ChkMessAbs;
		}
	
    }    // end of 'for( Chk = Chk_First ; Chk < Chk_Last ; Chk++ )' 
    
    
    // ===================================================================================
    // Offset Min-Sum decoding: withdraw the offset factor from check to variable messages
    // ===================================================================================
    if ( MS_Offset > 0 )  
    {
        for( Chk = Chk_First ; Chk < Chk_Last ; Chk++ )
        {
	    	ChkDeg = ptChkDeg[Chk];
	    
	    	for ( Deg = 0; Deg < ChkDeg; Deg++ )
	    	{
	        	ChkMess    = ptChkMess[Chk][Deg];            // check-node message
	        	ChkMessSgn = (ptFixp->*fixp_sgn)(ChkMess);   // message's sign
				ChkMessAbs = (ptFixp->*fixp_abs)(ChkMess);   // message's absolute value
				ChkMessAbs = (ptFixp->*fixp_add)(ChkMessAbs, -MS_Offset); // withdraw the offset value
				
				if ((ptFixp->*fixp_sgn)(ChkMessAbs) == 1)  // verify if negative
				{
					 ptChkMess[Chk][Deg] = 0;   // if negative, set to 0
				}
				else 
				{
					// the nb of bits of the adder is equal to the nb of bits used to reprezent ptPostInfo values
					// hence, ChkMessAbs value must be saturated to nb of bits used to reprezent exchanged messages
					ChkMessAbs = (ptFixp->*fixp_sat)(ChkMessAbs);
					
					if (ChkMessSgn == 0) ptChkMess[Chk][Deg] = ChkMessAbs;
					else ptChkMess[Chk][Deg] = -ChkMessAbs;
				}
	    	}
		}
    }

}     // end of 'CNU_MS' method 

// #########################################################################################
// Method name : CNU_GalB [Check-Node Unit for Gallager-B decoders]
// Description : computes check to variable nodes messages within Gallager-B decoders
//             : only messages outgoing from check-nodes Chk ex [Chk_First, ..., Chk_Last-1]
// #########################################################################################
void DEC_FIXP_LDPC_BIN::CNU_GalB(int Chk_First, int Chk_Last)
{
    int Chk;              // index used to run through check nodes
    int Deg, ChkDeg;      // indexes used for degrees, resp. check degrees
    int XorAllSigns;      // XOR of signs of all incoming check-node messages   
    int DegMin1;          // degree corresponding to AbsMin1 (see below)
    int AbsMin1, AbsMin2; // minimum and second minimum absulute value of all messages received by a given check 
    int VarMess;          // temporary storage of variable messages
    int VarMessAbs;       // temporary storage of variable messages absolute values
    int ChkMess;          // temporary storage of check messages 
    int ChkMessSgn;       // temporary storage of check messages signs
    int ChkMessAbs;       // temporary storage of check messages absolute values
	int Indx, TmpValue;   // local indexe / temporary storage
    
    // ======================================
    // check to variable messages computation
    // ======================================

    for( Chk = Chk_First ; Chk < Chk_Last ; Chk++ )
    {
		ChkDeg  = ptChkDeg[Chk];
		XorAllSigns = 0;
	
		// -----------------------------------------------------------------------------------------------------
		// run through variables connected to 'Chk' and update 'XorAllSigns'
		// -----------------------------------------------------------------------------------------------------
		for( Deg = 0 ; Deg < ChkDeg ; Deg++)
		{
	    	VarMess = ptVarMess[Chk][Deg]; // Remark: VarMess in {-1, +1}
	    	XorAllSigns = (ptFixp->*fixp_xor)(XorAllSigns, (ptFixp->*fixp_sgn)(VarMess));
		}  

		// ----------------------------------------------------------------------------
		// for each variable connected to 'Chk' compute the corresponding check message
		// ----------------------------------------------------------------------------	
		for ( Deg = 0; Deg < ChkDeg; Deg++ )
		{
	    	VarMess = ptVarMess[Chk][Deg];
	    	ChkMessSgn = (ptFixp->*fixp_xor)(XorAllSigns, (ptFixp->*fixp_sgn)(VarMess));
	    	
	    	ptChkMess[Chk][Deg] = 1 - 2*ChkMessSgn;  // {0, 1} -> {+1, -1} conversion
		}
	
    }    // end of 'for( Chk = Chk_First ; Chk < Chk_Last ; Chk++ )' 
    

}     // end of 'CNU_GalB' method 

// #######################################################################################
// Method name : VNU_SCMS [Variable-Node Unit for the Self-Corrected Min-Sum decoder]
// Description : compute variable to check nodes messages within the SCMS decoder
//             : only messages incoming to check-nodes Chk ex [Chk_First, ..., Chk_Last-1]
// #######################################################################################
void DEC_FIXP_LDPC_BIN::VNU_SCMS(int Chk_First, int Chk_Last)
{
	int Var, Chk;     // indexes for variable and check-nodes 
	int Deg, ChkDeg;  // indexes for check-node degrees
	int VarMess;      // variable to check node message
	int Erasure;      // detect "erased" (zero) messages
	
	for ( Chk = Chk_First ; Chk < Chk_Last ; Chk++ )
    {
        ChkDeg = ptChkDeg[Chk];
	    for ( Deg = 0 ; Deg < ChkDeg ; Deg++ )
	    {
	        Var     = ptChkList[Chk][Deg];   
		    VarMess = (ptFixp->*fixp_add)(ptPostInfo[Var], -ptChkMess[Chk][Deg]); 
			
			// the nb of bits of the adder is equal to the nb of bits used to reprezent ptPostInfo values
			// hence, VarMess value must be saturated to nb of bits used to reprezent exchanged messages
			VarMess = (ptFixp->*fixp_sat)(VarMess);
			
			// detect whether the previous message is erased (zero) or not
			Erasure = (ptVarMess[Chk][Deg] == 0);
			
			// set current iteration message according to self-correction unit (SCU)
			if ( (ptFixp->*fixp_scu)((ptFixp->*fixp_sgn)(VarMess), (ptFixp->*fixp_sgn)(ptVarMess[Chk][Deg]), Erasure) == 1 )
			{
				 ptVarMess[Chk][Deg] = 0;
			}
			else ptVarMess[Chk][Deg] = VarMess;
	    }
    }

}    // end of 'VNU_SCMS' method 

// #######################################################################################
// Method name : VNU_MS [Variable-Node Unit / Min-Sum decoder ]
// Description : compute variable to check nodes messages within MS decoder
//             : only messages incoming to check-nodes Chk ex [Chk_First, ..., Chk_Last-1]
// #######################################################################################
void DEC_FIXP_LDPC_BIN::VNU_MS(int Chk_First, int Chk_Last)
{
	int Var, Chk;     // indexes for variable and check-nodes 
	int Deg, ChkDeg;  // indexes for check-node degrees
	int VarMess;      // variable to check node message
	
	for ( Chk = Chk_First ; Chk < Chk_Last ; Chk++ )
    {
        ChkDeg = ptChkDeg[Chk];
	    for ( Deg = 0 ; Deg < ChkDeg ; Deg++ )
	    {
			Var     = ptChkList[Chk][Deg];   
		    VarMess = (ptFixp->*fixp_add)(ptPostInfo[Var], -ptChkMess[Chk][Deg]); 
			
			// the nb of bits of the adder is equal to the nb of bits used to reprezent ptPostInfo values
			// hence, VarMess value must be saturated to nb of bits used to reprezent exchanged messages
			ptVarMess[Chk][Deg] = (ptFixp->*fixp_sat)(VarMess);
        }
	}

}    // end of 'VNU_MS' method 


// #######################################################################################
// Method name : VNU_GalB [Variable-Node Unit / Gallager-B decoder ]
// Description : compute variable to check nodes messages within Gallager-B decoder
//             : only messages incoming to check-nodes Chk ex [Chk_First, ..., Chk_Last-1]
// #######################################################################################
void DEC_FIXP_LDPC_BIN::VNU_GalB(int Chk_First, int Chk_Last)
{
	int Var, Chk;     // indexes for variable and check-nodes 
	int Deg, ChkDeg;  // indexes for check-node degrees
	int VarMess;      // variable to check node message
	
	for ( Chk = Chk_First ; Chk < Chk_Last ; Chk++ )
    {
        ChkDeg = ptChkDeg[Chk];
	    for ( Deg = 0 ; Deg < ChkDeg ; Deg++ )
	    {
			Var     = ptChkList[Chk][Deg];   
		    VarMess = (ptFixp->*fixp_add)(ptPostInfo[Var], -ptChkMess[Chk][Deg]); 
			
			// compare to the qualified majority threshold value
			if ( (ptFixp->*fixp_abs)(VarMess) < GallB_thres ) VarMess = ptRxSoftBits[Var];
			
			// VarMess value must be saturated to -1 or +1
			// hence => ptVarMess[Chk][Deg] in {-1, +1}
			ptVarMess[Chk][Deg] = (ptFixp->*fixp_sat)(VarMess);
        }
	}

}    // end of 'VNU_GalB' method 

// ##################################################################
// Method name : Syndrome 
// Description : returns 0, if all parity-checks are zero (satisfied) 
//             : returns 1, otherwise
// ##################################################################
int DEC_FIXP_LDPC_BIN::Syndrome()
{
	int Var, Chk;     // indexes for variable and check-nodes 
	int Deg, ChkDeg;  // indexes for check-node degrees
	int ChkValue = 0; // parity-check value (init as zero)
	
	// ------------------------------------------------------
	// compute hard bits according to A Posteriori LLR values
	// ------------------------------------------------------
	for ( Var = 0 ; Var < VarNodesNb ; Var++ )
    {
        ptDecodedBits[Var] = HARD_BIT(ptPostInfo[Var]);
    }
	
	// ----------------------------------
	// compute the parity-check equations
	// ----------------------------------
	for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
	{
	    ChkValue = 0; 
	    ChkDeg = ptChkDeg[Chk];

	    for ( Deg = 0 ; Deg < ChkDeg ; Deg++ )
	    {
			Var = ptChkList[Chk][Deg];
			ChkValue ^= ptDecodedBits[Var];
	    }
	    
	    if ( ChkValue != 0 ) break; // parity check violation
	}

	return ChkValue;
}





