/* ##############################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : FIXP.cpp
## Language             : C++
## Short description    : implements fix-point arithmetic 
##                      : [exact arithmetic, inexact arithmetic, and probabilistic arithmetic]
##                      :
## History              : 09/10/2012 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ############################################################################################## */

#include "../include/Fixp.h"
static void fixp_errmsg(const char *keyname, const char *err_message);

// ####################################
// Method name : FIXP
// Description : constructor definition
// ####################################
FIXP::FIXP()
{
    // -------------
	// reset actions
	// -------------
	Reset();

}   // end of constructor

// ###################################
// Method name : ~FIXP
// Description : destructor definition
// ###################################
FIXP::~FIXP()
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

int FIXP::Activate(void)
{
    int ErrorFlag = IN_ERROR;
    
    // --------------------------------
    // get the configuration parameters
    // --------------------------------
    GetParam(); 

    // -------------------------------------------------
    // Read fix-point type file or fix-point type string
    // -------------------------------------------------
	if ( FixpArithmType == FIXP_UNDEF_ARITHM )
	{
    	if ( (strncmp(FixpArthFile, "proba::", 7) == 0) || (strncmp(FixpArthFile, "PROBA::", 7) == 0) )
		{
			if ( ReadFixpStr() == IN_ERROR ) goto end;
		}
		else
		{
			if ( ReadFixpFile() == IN_ERROR ) goto end;
		}
	}

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

void FIXP::Reset()
{
    // ------------------------------------------------------------------------
    // Reset the dynamic memory array and structure pointers used by the module
    // Mandatory with Visual C++ 6.0 when a 'Debug' version is produced
    // ------------------------------------------------------------------------
	FixpArithmType   = FIXP_UNDEF_ARITHM; // arithmetic type: undefined
	FixpInexLthType  = LTH_UNDEF;         // innexact LTH (less than) comparator type: undefined
	FixpProbAddType  = ADD_UNDEF;         // probabilistic ADDER type: undefined
	FixpProbAddDepth = 0;                 // depth: number of bits (starting with LSB) that can be in error
	FixpProbAddPerr  = 0.0;               // error probability 
	FixpProbLthType  = LTH_UNDEF;         // probabilistic LTH (less than) comparator type: undefined
	FixpProbLthPerr  = 0.0;               // error probability of the LTH (less than) comparator
	FixpProbXorType  = XOR_UNDEF;         // probabilistic XOR type: undefined
	FixpProbXorPerr  = 0.0;               // error probability of the XOR gate
	FixpProbScuType  = SCU_EXACT;         // Self-Correction Unit (SCU) type: exact or probabilistic
	FixpProbScuPerr  = 0.0;               // error probability of the Self-Correction Unit (SCU)
	MaxAddError      = -1;                // determined acording to 'FixpProbAddDepth' and 'FixpSizeOut'
	ptLutInexAdd     = 0;                 // inexact-adder Lookup Table
	ptLutInexLth     = 0;                 // inexact-LTH (less than) comparator Lookup Table

}   // end of 'Reset' method

// ############################################################
// Method name : GetParam
// Description : get the values of the configuration parameters
// ############################################################
void FIXP::GetParam()
{
    FixpSizeExt = CONFIG::FixpSizeIn;    // size (in bits) of the input and extrinsic LLRs 
	FixpSizeOut = CONFIG::FixpSizeOut;   // size (in bits) of the output a-posteriori LLRs
	strcpy(FixpArthFile, CONFIG::FixpArthFile); // fixed-point arithmetic file
	
	// ---------------------------------
	// set the fix-point arithmetic type
	// ---------------------------------
	if (strlen(FixpArthFile) == 0)
	{
		// no fixp-type file
		FixpArithmType = FIXP_EXACT_ARITHM;
	}
	
	// --------------------------------------------
	// set the min/max values for input/output LLRs
	// --------------------------------------------
	MinFixpExt = -(1 << (FixpSizeExt-1)) + 1; // minimum value for extrinsic LLRs (exchanged messages)
	MaxFixpExt =  (1 << (FixpSizeExt-1)) - 1; // maximum value for extrinsic LLRs (exchanged messages)
	MinFixpOut = -(1 << (FixpSizeOut-1)) + 1; // minimum value for output a-posteriori LLRs
	MaxFixpOut =  (1 << (FixpSizeOut-1)) - 1; // maximum value for output a-posteriori LLRs
	
    return;

}   // end of 'GetParam' method

// ######################################
// Method name : ReadFixpFile
// Description : read fix-point type file 
// ######################################

int FIXP::ReadFixpFile()
{
    FILE *fid;               // stream for fixp-arithmetic file
	char keystrval[STR_LEN]; // string read from the fixp-type file
	int  Indx;               // local index
	int  SizeValue;          // lookup-table size value read from file
	int  ErrorFlag;          // error flag -- returned value!
	
	// ---------------
	// init error flag
	// ---------------
	ErrorFlag = IN_ERROR;
	fid = NULL;
	
	// ------------------------------------------
    // open the stream for the LDPC decoding file
    // ------------------------------------------
	if ( (fid = fopen(FixpArthFile, "r")) == NULL )
	{
		fprintf (stderr, "\n\n[ERROR- FIXP::ReadFixpFile] Cannot open the fix-point file \"%s\" (read mode)!\n\n",\
		         		 FixpArthFile);
		goto end;
    }
	
	// -------------------------
	// "fixp_arithmetic" keyword
	// -------------------------
	read_keyvalue(keystrval, STR_LEN, fid, "fixp_arithmetic");
	if (strtls_errno() != NO_ERROR) { fixp_errmsg("fixp_arithmetic", ""); goto end; }
		
	str2lowercase(keystrval);
	str2int_list(FixpArithmType, keystrval, 4, \
		            (int [])           {FIXP_EXACT_ARITHM, FIXP_INEXA_ARITHM, FIXP_PROBA_ARITHM, FIXP_PROBA_ARITHM}, \
					(char [][STR_LEN]) {     "exact",           "inexact",         "proba",       "probabilistic"});
	if (strtls_errno() != NO_ERROR) { fixp_errmsg("fixp_arithmetic", ""); goto end; }
	
	// ==========================================
	   if ( FixpArithmType == FIXP_INEXA_ARITHM )
	// ==========================================
	{
		// ----------------------
		// "fixp_add_lut" keyword
		// ----------------------
		read_keyvalue(&SizeValue, 1, fid, "fixp_add_lut");
		if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_add_lut", ""); goto end;}
		
		if ( SizeValue != MaxFixpOut-MinFixpOut+1 )
		{
			fixp_errmsg("fixp_add_lut", "wrong LUT size (inconsistency with config parameters!)"); 
			goto end;
		}
		
		// alloc memory for ptLutInexAdd
		if ( AllocMatrix(ptLutInexAdd, "FIXP::ptLutInexAdd", SizeValue, SizeValue) == IN_ERROR ) goto end;
		
		// read ptLutInexAdd from file
		for ( Indx = 0 ; Indx < SizeValue ; Indx++ )
		{
			read_numvalue(ptLutInexAdd[Indx], SizeValue, fid);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_add_lut", ""); goto end;}
		
			verify_keyvalue(ptLutInexAdd[Indx], SizeValue, "[%d, %d]", MinFixpOut, MaxFixpOut);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_add_lut", "values out of bounds"); goto end;}
		}
		
		// ----------------------
		// "fixp_lth_lut" keyword
		// ----------------------
		read_keyvalue(keystrval, STR_LEN, fid, "fixp_lth_lut");
		if (strtls_errno() != NO_ERROR) { fixp_errmsg("fixp_lth_lut", ""); goto end; }
		str2lowercase(keystrval);
		
		if ( strcmp(keystrval, "lth_exact") == 0 )
		{
			FixpInexLthType = LTH_EXACT;
		}
		
		else if ( strcmp(keystrval, "lth_from_add") == 0 )
		{
			FixpInexLthType = LTH_FROM_ADD;
		}
	
		else
		{
			FixpInexLthType = LTH_INEXA;
			
			str2numeric(&SizeValue, 1, keystrval);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_lth_lut", "wrong value"); goto end;}
			
			if ( SizeValue != MaxFixpExt-MinFixpExt+1 )
			{
				fixp_errmsg("fixp_lth_lut", "wrong LUT size (inconsistency with config parameters!)"); 
				goto end;
			}
		
			// alloc memory for ptLutInexLth
			if ( AllocMatrix(ptLutInexLth, "FIXP::ptLutInexLth", SizeValue, SizeValue) == IN_ERROR ) goto end;
		
			// read ptLutInexLth from file
			for ( Indx = 0 ; Indx < SizeValue ; Indx++ )
			{
				read_numvalue(ptLutInexLth[Indx], SizeValue, fid);
				if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_lth_lut", ""); goto end;}
		
				verify_keyvalue(ptLutInexLth[Indx], SizeValue, (int []) {0, 1}, 2);
				if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_lth_lut", "values must be 0 or 1!"); goto end;}
			}
		}
		
	}  // end of 'if ( FixpArithmType == FIXP_INEXA_ARITHM )'
	
	// ===============================================
	   else if ( FixpArithmType == FIXP_PROBA_ARITHM )
	// ===============================================
	{
		// -----------------------
		// "fixp_add_perr" keyword
		// -----------------------
		read_keyvalue(keystrval, STR_LEN, fid, "fixp_add_perr");
		if (strtls_errno() != NO_ERROR) { fixp_errmsg("fixp_add_perr", ""); goto end; }
		str2lowercase(keystrval);
		
		if ( strcmp(keystrval, "add_exact") == 0 )
		{
			FixpProbAddType = ADD_EXACT;
		}
		else
		{
			FixpProbAddType = ADD_PROBA;
			
			// depth parameter
			str2numeric(&FixpProbAddDepth, 1, keystrval);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_add_perr", "wrong (missing?) depth value!"); goto end;}
			verify_keyvalue(&FixpProbAddDepth, 1, "[%d, %d]", 1, FixpSizeOut);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_add_perr", "depth value must be in [1, FixpSizeOut]"); goto end;}
			
			// error probability parameter
			read_numvalue(&FixpProbAddPerr, 1, fid);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_add_perr", "wrong (missing?) error probability value!"); goto end;}
			verify_keyvalue(&FixpProbAddPerr, 1, "]0, 1[");
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_add_perr", "error probability value must be in ]0, 1["); goto end;}				
		}
		
		// -----------------------
		// "fixp_lth_perr" keyword
		// -----------------------
		read_keyvalue(keystrval, STR_LEN, fid, "fixp_lth_perr");
		if (strtls_errno() != NO_ERROR) { fixp_errmsg("fixp_lth_perr", ""); goto end; }
		str2lowercase(keystrval);
		
		if ( strcmp(keystrval, "lth_exact") == 0 )
		{
			FixpProbLthType = LTH_EXACT;
		}
		
		else if ( strcmp(keystrval, "lth_from_add") == 0 )
		{
			FixpProbLthType = LTH_FROM_ADD;
		}
		
		else
		{
			FixpProbLthType = LTH_PROBA;
			
			str2numeric(&FixpProbLthPerr, 1, keystrval);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_lth_perr", "wrong (missing?) error probability value!"); goto end;}
			verify_keyvalue(&FixpProbLthPerr, 1, "]0, 1[");
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_lth_perr", "error probability value must be in ]0, 1["); goto end;}		
		}
		
		// -----------------------
		// "fixp_xor_perr" keyword
		// -----------------------
		read_keyvalue(keystrval, STR_LEN, fid, "fixp_xor_perr");
		if (strtls_errno() != NO_ERROR) { fixp_errmsg("fixp_xor_perr", ""); goto end; }
		str2lowercase(keystrval);
		
		if ( strcmp(keystrval, "xor_exact") == 0 )
		{
			FixpProbXorType = XOR_EXACT;
		}
		else
		{
			FixpProbXorType = XOR_PROBA;
			
			str2numeric(&FixpProbXorPerr, 1, keystrval);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_xor_perr", "wrong (missing?) error probability value!"); goto end;}
			verify_keyvalue(&FixpProbXorPerr, 1, "]0, 1[");
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_xor_perr", "error probability value must be in ]0, 1["); goto end;}		
		}
		
		// -----------------------
		// "fixp_scu_perr" keyword
		// -----------------------
		read_keyvalue(keystrval, STR_LEN, fid, "fixp_scu_perr");
		
		if ( strtls_errno() == NO_ERROR )
		{
			str2lowercase(keystrval);
			if ( strcmp(keystrval, "scu_exact") == 0 )
			{
				FixpProbScuType = SCU_EXACT;
			}
			else
			{
				FixpProbScuType = SCU_PROBA;
			
				str2numeric(&FixpProbScuPerr, 1, keystrval);
				if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_scu_perr", "wrong (missing?) error probability value!"); goto end;}
				verify_keyvalue(&FixpProbScuPerr, 1, "]0, 1[");
				if (strtls_errno() != NO_ERROR) {fixp_errmsg("fixp_scu_perr", "error probability value must be in ]0, 1["); goto end;}		
			}
		}
		else if ( strtls_errno() == _ST_KEY_NOT_IN_FILE )
		{
			FixpProbScuType = SCU_EXACT;
		}
		else { fixp_errmsg("fixp_scu_perr", ""); goto end; }
	}
	
	// ====================================
	// fix-point type file successfuly read
	// ====================================
	ErrorFlag = NO_ERROR;
	
end:
	if (fid != NULL)
	{
		fclose(fid);
		fid = NULL;
	}
	return ErrorFlag;

}   // end of 'ReadFixpFile' method

// ########################################
// Method name : ReadFixpStr
// Description : read fix-point type string 
// ########################################

int FIXP::ReadFixpStr()
{
	char   FixpArthStr[STR_LEN]; // fixp-arithmetic string
	char   *keystrval;           // sub-string read from the fixp-type string
	int    keystrlen;            // length of keystrval string
	double ProbAddParam[2];      // parameters of the probabilistic adder
	int    ErrorFlag = IN_ERROR; // error flag (returned value)
	
	// --------------------------
	// set fixp-arithmetic string
	// --------------------------
	if ( strlen(FixpArthFile) <= 7 || ((strncmp(FixpArthFile, "proba::", 7) != 0) && (strncmp(FixpArthFile, "PROBA::", 7) == 0)) )
	{
		fprintf (stderr, "\n\n[ERROR- FIXP::ReadFixpStr] Wrong format for the fixp-arithmetic string (\"%s\")!\n\n", FixpArthFile);
		goto end;
	}
	strcpy(FixpArthStr, FixpArthFile+7);
	keystrlen = strlen(FixpArthStr);
	FixpArthStr[keystrlen]   = ':';
	FixpArthStr[keystrlen+1] = '\0';
	
	// ----------------------------------------------
	// init types of adder, lth (comparator), and xor
	// ----------------------------------------------
	FixpArithmType  = FIXP_PROBA_ARITHM;
	FixpProbAddType = ADD_PROBA;
	FixpProbLthType = LTH_PROBA;
	FixpProbXorType = XOR_PROBA;
	FixpProbScuType = SCU_PROBA;
	
	// -----------------------------------------------------------------------------------------------
	// tokenize the fixp-type string: read probabilistic adder, comp, xor-gate, and sc-unit parameters
	// -----------------------------------------------------------------------------------------------
	keystrval = strtok(FixpArthStr, ":");
	while (keystrval != NULL)
	{
		keystrlen = strlen(keystrval);
		str2lowercase(keystrval);
		
		if(keystrval[keystrlen-1] != ']') 
		{
			fprintf (stderr, "\n\n[ERROR- FIXP::ReadFixpStr] Wrong format for the fixp-arithmetic string (\"%s\")!\n\n", keystrval);
			goto end;
		}
		keystrval[keystrlen-1] = '\0';
		
		if ( strncmp(keystrval, "add[", 4) == 0 )
		{
			// -------------------
			// probabilistic adder
			// -------------------
			str2numeric(ProbAddParam, 2, keystrval+4);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("proba::add", "wrong (missing?) probabilistic adder parameters!"); goto end;}
			
			if ( floor(ProbAddParam[0]) != ceil(ProbAddParam[0]) )
			{
				fixp_errmsg("proba::add", "depth parameter must be an integer value!"); goto end;
			}
			
			FixpProbAddDepth = (int) ProbAddParam[0];
			FixpProbAddPerr  = ProbAddParam[1];
			
			verify_keyvalue(&FixpProbAddDepth, 1, "[%d, %d]", 0, FixpSizeOut);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("proba::add", "depth parameter must be in [0, FixpSizeOut]"); goto end;}
			verify_keyvalue(&FixpProbAddPerr, 1, "[0, 1[");
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("proba::add", "error probability value must be in [0, 1["); goto end;}	
		}
		
		else if ( strncmp(keystrval, "comp[", 5) == 0 )
		{
			// ------------------------
			// probabilistic comparator
			// ------------------------
			str2numeric(&FixpProbLthPerr, 1, keystrval+5);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("proba::comp", "wrong (missing?) error probability value!"); goto end;}
			verify_keyvalue(&FixpProbLthPerr, 1, "[0, 1[");
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("proba::comp", "error probability value must be in [0, 1["); goto end;}	
		}
		
		else if ( strncmp(keystrval, "xor[", 4) == 0 )
		{
			// ----------------------
			// probabilistic xor-gate
			// ----------------------
			str2numeric(&FixpProbXorPerr, 1, keystrval+4);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("proba::xor", "wrong (missing?) error probability value!"); goto end;}
			verify_keyvalue(&FixpProbXorPerr, 1, "[0, 1[");
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("proba::xor", "error probability value must be in [0, 1["); goto end;}	
		}
		
		else if ( strncmp(keystrval, "scu[", 4) == 0 )
		{
			// ----------------------------------
			// probabilistic self-correction unit
			// ----------------------------------
			str2numeric(&FixpProbScuPerr, 1, keystrval+4);
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("proba::scu", "wrong (missing?) error probability value!"); goto end;}
			verify_keyvalue(&FixpProbScuPerr, 1, "[0, 1[");
			if (strtls_errno() != NO_ERROR) {fixp_errmsg("proba::scu", "error probability value must be in [0, 1["); goto end;}	
		}
		
		else
		{
			// -------------------
			// error: wrong format
			// -------------------
			fprintf (stderr, "\n\n[ERROR- FIXP::ReadFixpStr] Wrong format for the fixp-arithmetic string (\"%s]\")!\n\n", keystrval);
			goto end;
		}
		
		// next token
		strcpy(FixpArthStr, &FixpArthStr[keystrlen+1]);
		keystrval = strtok(FixpArthStr, ":");
	}
	
	// -------------------------------------------------------------
	// update types of adder, lth (comparator), xor-gate and sc-unit
	// -------------------------------------------------------------
	if ( (FixpProbAddPerr == 0.0) || (FixpProbAddDepth == 0) ) FixpProbAddType = ADD_EXACT;
	if (  FixpProbLthPerr == 0.0  )   FixpProbLthType = LTH_EXACT;
	if (  FixpProbXorPerr == 0.0  )   FixpProbXorType = XOR_EXACT;
	if (  FixpProbScuPerr == 0.0  )   FixpProbScuType = SCU_EXACT;
	
	// ======================================
	// fix-point type string successfuly read
	// ======================================
	ErrorFlag = NO_ERROR;
	
end:
	return ErrorFlag;
}

// #################################################################
// Method name : Init
// Description : initializations needed by the implemented algorithm
// #################################################################

int FIXP::Init()
{
    int ErrorFlag;  // error flag (returned value)
	int Sum, Err;
	
	// ---------------
	// init error flag
	// ---------------
	ErrorFlag = IN_ERROR;
	
	// ====================================================
	// export parameters (for the 'display_config' function
	// ====================================================
	export_disp_config_param("fixp_arithmetic_type", FixpArithmType);
	export_disp_config_param("fixp_inexa_lth_type",  FixpInexLthType);
	export_disp_config_param("fixp_proba_add_type",  FixpProbAddType);
	export_disp_config_param("fixp_proba_add_perr",  FixpProbAddPerr);
	export_disp_config_param("fixp_proba_add_depth", FixpProbAddDepth);
	export_disp_config_param("fixp_proba_lth_type",  FixpProbLthType);
	export_disp_config_param("fixp_proba_lth_perr",  FixpProbLthPerr);
	export_disp_config_param("fixp_proba_xor_type",  FixpProbXorType);
	export_disp_config_param("fixp_proba_xor_perr",  FixpProbXorPerr);
	export_disp_config_param("fixp_proba_scu_type",  FixpProbScuType);
	export_disp_config_param("fixp_proba_scu_perr",  FixpProbScuPerr);
	
	// ==========================================================
	// sign, abs-value and saturation functions are always exact!
	// ==========================================================
	fixp_sgn = &FIXP::fixp_exact_sgn;
	fixp_abs = &FIXP::fixp_exact_abs;
	fixp_sat = &FIXP::fixp_exact_sat;
	
	switch ( FixpArithmType )
	{
	case FIXP_EXACT_ARITHM:
	
		// ==========================
		// EXACT FIX-POINT ARITHMETIC
		// ==========================
		fixp_add = &FIXP::fixp_exact_add;
		fixp_lth = &FIXP::fixp_exact_lth;
		fixp_xor = &FIXP::fixp_exact_xor;
		fixp_scu = &FIXP::fixp_exact_scu;
		
		break;
	
	case FIXP_INEXA_ARITHM:
	
		// ============================
		// INEXACT FIX-POINT ARITHMETIC
		// ============================
		fixp_add = &FIXP::fixp_inexa_add;
		fixp_xor = &FIXP::fixp_exact_xor;
		fixp_scu = &FIXP::fixp_exact_scu;
		
		switch (FixpInexLthType)
		{
			case LTH_EXACT:    fixp_lth = &FIXP::fixp_exact_lth;          break;
			case LTH_FROM_ADD: fixp_lth = &FIXP::fixp_inexa_lth_from_add; break;
			case LTH_INEXA:    fixp_lth = &FIXP::fixp_inexa_lth;          break;
			default:
				break;
		}
		
		break;
	
	case FIXP_PROBA_ARITHM:
	
		// ==================================
		// PROBABILISTIC FIX-POINT ARITHMETIC
		// ==================================
		 
		switch (FixpProbAddType)
		{
			case ADD_EXACT: 
				fixp_add = &FIXP::fixp_exact_add; 
				break;
				
			case ADD_PROBA:  
				
				if ( FixpProbAddDepth < FixpSizeOut )
				{
					// define 'MaxAddError' parameter used by partial-depth probabilistic adder
					// hence, errors are generated within the [1, MaxAddError] interval
					MaxAddError = (1 << FixpProbAddDepth) - 1;
					
					// 'fixp_add' must point to the partial-depth probabilistic adder
					fixp_add = &FIXP::fixp_proba_add_part_depth;
				}
				else // FixpProbAddDepth == FixpSizeOut
				{
					// errors are generated in [MinFixpOut, MaxFixpOut]
					// hence, 0 is within the [MinFixpOut, MaxFixpOut] interval, and therefore 
					// the error probability value must be updated (because 0 is not an error!)
					FixpProbAddPerr *= (1.0 + 1.0/((double)MaxFixpOut-MinFixpOut)); 
					
					// 'fixp_add' must point to the full-depth probabilistic adder
					fixp_add = &FIXP::fixp_proba_add_full_depth;
				}
				break;
			
			default:
				break;
		}
		
		switch (FixpProbScuType)
		{
			case SCU_EXACT: fixp_scu = &FIXP::fixp_exact_scu; break;
			case SCU_PROBA: fixp_scu = &FIXP::fixp_proba_scu; break;
			default:
				break;
		}
		
		switch (FixpProbXorType)
		{
			case XOR_EXACT: fixp_xor = &FIXP::fixp_exact_xor; break;
			case XOR_PROBA: fixp_xor = &FIXP::fixp_proba_xor; break;
			default:
				break;
		}
		
		switch (FixpProbLthType)
		{
			case LTH_EXACT:    fixp_lth = &FIXP::fixp_exact_lth;          break;
			case LTH_PROBA:    fixp_lth = &FIXP::fixp_proba_lth;          break;
			case LTH_FROM_ADD: fixp_lth = &FIXP::fixp_proba_lth_from_add; break;
			default:
				break;
		}
		
		break;
	
	default:
		break;

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

void FIXP::Free()
{
    // -------------------------
    // Free the memory allocated
    // -------------------------
	FreeArray(ptLutInexAdd);
	FreeArray(ptLutInexLth);
	
    return;

}   // end of 'Free' method

// ##############################################################
// Method name : get_fixp_sgn
// Description : returns a function pointer to fixp-sign function
// ##############################################################
pt2func_1arg FIXP::get_fixp_sgn(void)
{
	return fixp_sgn;
}

// ###################################################################
// Method name : get_fixp_abs
// Description : returns a function pointer to fixp-abs value function
// ###################################################################
pt2func_1arg FIXP::get_fixp_abs(void)
{
	return fixp_abs;
}

// #############################################################
// Method name : get_fixp_sat
// Description : returns a function pointer to fixp-sat function
// #############################################################
pt2func_1arg FIXP::get_fixp_sat(void)
{
	
	return fixp_sat;
}

// #############################################################
// Method name : get_fixp_add
// Description : returns a function pointer to fixp-add function
// #############################################################
pt2func_2arg FIXP::get_fixp_add(void)
{
	return fixp_add;
}

// #############################################################
// Method name : get_fixp_lth
// Description : returns a function pointer to fixp-lth function
// #############################################################
pt2func_2arg FIXP::get_fixp_lth(void)
{
	return fixp_lth;
}

// #############################################################
// Method name : get_fixp_xor
// Description : returns a function pointer to fixp-xor function
// #############################################################
pt2func_2arg FIXP::get_fixp_xor(void)
{
	return fixp_xor;
}

// #############################################################
// Method name : get_fixp_scu
// Description : returns a function pointer to fixp-scu function
// #############################################################
pt2func_3arg FIXP::get_fixp_scu(void)
{
	return fixp_scu;
}


// **************************************************************************************
//                       FIXP_ERRMSG FUNCTION
// **************************************************************************************
static void fixp_errmsg(const char *keyname, const char *err_message)
{
	if (strtls_errno() != NO_ERROR) strtls_errmsg();
	
	fprintf (stderr, "\n\n[ERROR- FIXP::ReadFixFile] %s\n"
					 "[error detected when reading the \"%s\" keyword!]\n\n", err_message, keyname);
	
	return;
}


