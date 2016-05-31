/* #################################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : Config.cpp 
## Language             : C++
## Short description    : defines the configuration structure of the simulation chain
##                      : fields of the configuration structure are first initialized by forbidden 
##                      : values, then they are read from the configuration file
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ################################################################################################# */

#include "../include/Config.h"

static void config_errmsg(const char *keyname, const char *err_message);
static int standard_ldpc_code(const char *StandardName);

// ===========================================
// parameters read from the configuration file
// ===========================================

// ------------------------------
// name of the configuration file
// ------------------------------
char CONFIG::ConfFile[STR_LEN] = {}; // name of the configuration file

// ---------------------
// gate error parameters
// ---------------------
int    CONFIG::GatePerrNum  = -1;             // number of simulated gate error probability values
double CONFIG::ptGatePerrList[NUM_PARAM] = {};  // list of simulated gate error probability values
	
// ------------------
// netlist parameters
// ------------------
int  CONFIG::NbInputs    = -1;  // number of inputs (the same for both F and P)
int  CONFIG::NbOutputsF  = -1;  // number of outputs of the original circuit F
int  CONFIG::NbOutputsP  = -1;  // number of outputs of the "parity" circuit P
int  CONFIG::CriticThres[2] = {-1, -1}; // criticality threshold 
char CONFIG::NetlistFile[STR_LEN] = {}; // short name of the netlist file 	
	
// --------------------
// ldpc code parameters
// --------------------
char CONFIG::LdpcFile[STR_LEN] = {}; // name of the LDPC code file
int  CONFIG::LdpcDecoding   = -1;    // ldpc decoding (Sum-Product, Min-Sum, Min-Max, etc.)
int  CONFIG::LdpcScheduling = -1;    // ldpc scheduling (flooding, serial, layered)
int  CONFIG::LdpcLayersNb   = -1;    // number of layers (for layered decoding)
int  CONFIG::MaxIterNb      = -1;    // maximum number of decoding iterations
int  CONFIG::StopCriterion  = -1;    // stopping criterion
int  CONFIG::GallB_thres    = -1;    // Gallager-B qualified majority threshold
int  CONFIG::MS_Offset      = -1;    // offset factor for offset-min-sum decoding
	
// ------------------
// fix-point decoding
// ------------------
int  CONFIG::FixpSizeIn   = -1;           // size (in bits) of the input and extrinsic LLRs 
int  CONFIG::FixpSizeOut  = -1;           // size (in bits) of the output a-posteriori LLRs
int  CONFIG::FixpInScale  = -1;           // scale factor of the decoder's input (fixp decoder only)
char CONFIG::FixpArthFile[STR_LEN] = {};  // fix-point type file
	
// ----------------------------
// end-of-simulation parameters
// ----------------------------
int CONFIG::MaxNbSimulFrames = -1; // maximum number of simulated frames (transmitted codewords)
int CONFIG::MinNbErrorFrames = -1; // maximum number of erroneous frames (undecoded codewords)

// ------------------
// display parameters
// ------------------
char CONFIG::ResultsFile[STR_LEN] = {};  // name of results file
int  CONFIG::ResfileRefresh = -1;    // controls intermediate display to results file
int  CONFIG::StdoutRefresh  = -1;    // controls intermediate display on stdout
	
// =======================================================
// config parameters deduced from those read from the file
// =======================================================
int    CONFIG::LdpcInfoSize  = -1;   // info-size (dimension) of the LDPC code
int    CONFIG::LdpcCodedSize = -1;   // coded-size (length) of the LDPC code
double CONFIG::CodingRate    = -1.0; // coding rate (info_size / coded_size)

// ####################################
// Method name : CONFIG
// Description : constructor definition
// ####################################
CONFIG::CONFIG(){ }

// ###################################
// Method name : ~CONFIG
// Description : destructor definition
// ###################################
CONFIG::~CONFIG(){ }


// ####################################################################
// Method name : read_config_file
// Description : read config parameters from the the configuration file
// ####################################################################
int CONFIG::read_configfile(void)
{
    FILE *Conf;              // stream for configuration file
	char keystrval[STR_LEN]; // keyword string value
	char keyendval[STR_LEN]; // ending string of key
	int  keyintval;          // keyword integer value
	int  nbreadval;          // number of read values 
	int  Indx, Indx1, Indx2; // local indexes
	int  ErrorFlag;          // error flag - returned value!
   
	// ==============
    // initialization
    // ==============
    ErrorFlag = IN_ERROR;	
	
    // ------------------------------------------
    // open the stream for the configuration file
    // ------------------------------------------
    
    if( ( Conf = fopen(ConfFile, "r") ) == NULL )
    {
		fprintf (stderr, "\n\nERROR [read_configfile] Can not open the\n"
		         		 "configuration file \"%s\" (read mode)!\n\n", ConfFile);
		goto end;
    }
    
    // =======================
    // read configuration file
    // =======================	

	// ----------------------
	// gate error probability
	// ----------------------
	GatePerrNum  = read_keyvalue(ptGatePerrList, NUM_PARAM, Conf, "gate_perr_list");
	if (strtls_errno() != NO_ERROR) { config_errmsg(keystrval, "missing end character \";\" ??"); goto end; }
	if (GatePerrNum == 0) { config_errmsg(keystrval, "missing keyword value!"); goto end; }
		
	verify_keyvalue(ptGatePerrList, GatePerrNum, "[0, 1]");
	if (strtls_errno() != NO_ERROR) {config_errmsg(keystrval, "values must be in [0, 1]"); goto end;}
			
	// ----------------
	// number of inputs
	// ----------------
	read_keyvalue(&NbInputs, 1, Conf, "nb_inputs");
	if (strtls_errno() != NO_ERROR) { config_errmsg("nb_inputs", ""); goto end; }
	verify_keyvalue(&NbInputs, 1, "]0, Inf[");
	if (strtls_errno() != NO_ERROR) {config_errmsg("nb_inputs", "value must be in ]0, Inf["); goto end;}
		
	// -----------------------------------------------------------
	// number of outputs (original circuit F and parity circuit P)
	// -----------------------------------------------------------
	read_keyvalue(&NbOutputsF, 1, Conf, "nb_outputs_f");
	if (strtls_errno() != NO_ERROR) { config_errmsg("nb_outputs_f", ""); goto end; }
	verify_keyvalue(&NbOutputsF, 1, "]0, Inf[");
	if (strtls_errno() != NO_ERROR) {config_errmsg("nb_outputs_f", "value must be in ]0, Inf["); goto end;}
	
	read_keyvalue(&NbOutputsP, 1, Conf, "nb_outputs_p");
	if (strtls_errno() != NO_ERROR) { config_errmsg("nb_outputs_p", ""); goto end; }
	verify_keyvalue(&NbOutputsP, 1, "]0, Inf[");
	if (strtls_errno() != NO_ERROR) {config_errmsg("nb_outputs_p", "value must be in ]0, Inf["); goto end;}
	
	// ------------------------
	// name of the netlist file
	// ------------------------
	read_keyvalue(keystrval, STR_LEN, Conf, "netlist_file"); 
	if (strtls_errno() != NO_ERROR) { config_errmsg("netlist_file", ""); goto end; }
	strcpy(NetlistFile, keystrval);
	
	// ---------------------
	// criticality threshold
	// ---------------------	
	Indx = read_keyvalue(CriticThres, 2, Conf, "criticality_thres");
	if (strtls_errno() != NO_ERROR) { config_errmsg("criticality_thres", "missing end character \";\" ??"); goto end; }
	if (Indx == 1) CriticThres[1] = CriticThres[0];
	if ( ((CriticThres[0] != -1) && (CriticThres[0] <= 0)) || ((CriticThres[1] != -1) && (CriticThres[1] <= 0)) )
	{
		config_errmsg("criticality_thres", "value must be either -1 or positive"); 
		goto end;
	}
	
	// ------------------------------------------------------------------------------
	// LDPC infosize, coded size and coding rate: deduces from the netlist parameters
	// ------------------------------------------------------------------------------
	LdpcInfoSize  = NbOutputsF;
	LdpcCodedSize = NbOutputsF + NbOutputsP;
	CodingRate    = ((double) LdpcInfoSize) / ((double) LdpcCodedSize);
	
	// ---------------------
	// name of the LDPC file
	// ---------------------
	read_keyvalue(keystrval, STR_LEN, Conf, "ldpc_file"); 
	if (strtls_errno() != NO_ERROR) { config_errmsg("ldpc_file", ""); goto end; }
	
	if ( (strncmp(keystrval, "standard:", 9) == 0) || (strncmp(keystrval, "std:", 4) == 0) ||\
	     (strncmp(keystrval, "STANDARD:", 9) == 0) || (strncmp(keystrval, "STD:", 4) == 0)   )
	{
		if (standard_ldpc_code(keystrval+4) == IN_ERROR) goto end;
	}
	else strcpy(LdpcFile, keystrval);
	
	// -------------
	// LDPC decoding
	// -------------
	read_keyvalue(keystrval, STR_LEN, Conf, "ldpc_decoding");
	if (strtls_errno() != NO_ERROR) { config_errmsg("ldpc_decoding", ""); goto end; }
	
	str2lowercase(keystrval);
	str2int_list(LdpcDecoding, keystrval, 10, \
				(int  []) {SUM_PRODUCT, SUM_PRODUCT, MIN_SUM, MIN_SUM, SC_MIN_SUM, SC_MIN_SUM, GALLAGER_B, GALLAGER_B, STOCHASTIC, STOCHASTIC}, \
				(char [][STR_LEN]) {"sp", "sum-prod", "ms", "min-sum", "scms", "sc-min-sum",    "gal-b",  "gallager-b",  "stoc",  "stochastic"});
	
	if ( LdpcDecoding == GALLAGER_B ) GallB_thres = 1;
	
	if (strtls_errno() != NO_ERROR)
	{
		str2int_list(LdpcDecoding, keyendval, keystrval, 2, (int []) {MIN_SUM, MIN_SUM}, (char [][STR_LEN]) {"ms:of=", "min-sum:of="});
		if (strtls_errno() == NO_ERROR)
		{
			str2numeric(&MS_Offset, 1, keyendval);
			if (strtls_errno() != NO_ERROR) {config_errmsg("ldpc_decoding", "error reading the MS-offset factor"); goto end;}
			verify_keyvalue(&MS_Offset, 1, "]0, Inf[");
			if (strtls_errno() != NO_ERROR) {config_errmsg("ldpc_decoding", "MS-scale factor must be in ]0, Inf["); goto end;}
		}
	} 
	
	if (strtls_errno() != NO_ERROR)
	{
		str2int_list(LdpcDecoding, keyendval, keystrval, 2, (int []) {GALLAGER_B, GALLAGER_B}, (char [][STR_LEN]) {"gal-b:t=", "gallager-b:t="});
		
		if (strtls_errno() == NO_ERROR)
		{
			str2numeric(&GallB_thres, 1, keyendval);
			if (strtls_errno() != NO_ERROR) {config_errmsg("ldpc_decoding", "error reading the Gallager-B threshold value"); goto end;}
			verify_keyvalue(&GallB_thres, 1, "[1, Inf[");
			if (strtls_errno() != NO_ERROR) {config_errmsg("ldpc_decoding", "Gallager-B threshold value must be in [1, Inf["); goto end;}
		}
	} 
	
	if (strtls_errno() != NO_ERROR) {config_errmsg("ldpc_decoding", "unknown value!"); goto end;}
	
	// ---------------
	// ldpc scheduling
	// ---------------
	read_keyvalue(keystrval, STR_LEN, Conf, "scheduling");
	if (strtls_errno() != NO_ERROR) { config_errmsg("scheduling", ""); goto end; }
	
	str2lowercase(keystrval);
	str2int_list(LdpcScheduling, keystrval, 3, \
				(int [])           {FLOOD_SCHEDULING, FLOOD_SCHEDULING, SERIAL_SCHEDULING}, \
				(char [][STR_LEN]) {    "flood",         "flooding",       "serial"});
	
	if (strtls_errno() != NO_ERROR)
	{
		str2int_list(LdpcScheduling, keyendval, keystrval, 2, \
				(int [])           {LAYER_SCHEDULING, LAYER_SCHEDULING}, \
				(char [][STR_LEN]) {    "layer:",        "layered:"});
		if (strtls_errno() != NO_ERROR) { config_errmsg("scheduling", ""); goto end; }

		str2numeric(&LdpcLayersNb, 1, keyendval);
		if (strtls_errno() != NO_ERROR) {config_errmsg("scheduling", "wrong number of layers value"); goto end;}
			
		verify_keyvalue(&LdpcLayersNb, 1, "[1, Inf[");
		if (strtls_errno() != NO_ERROR) {config_errmsg("scheduling (number of layers)", "value must be in [1, Inf["); goto end;}
	}
	
	// -------------------------------------
	// maximum number of decoding iterations
	// -------------------------------------
	read_keyvalue(keystrval, STR_LEN, Conf, "max_iter_nb");
	if (strtls_errno() != NO_ERROR) { config_errmsg("max_iter_nb", ""); goto end; }
	
	if (keystrval[strlen(keystrval)-1] == '*')
	{
		StopCriterion = STOP_MAX_ITER;
		keystrval[strlen(keystrval)-1] = '\0';
	}
	else
	{
		StopCriterion = STOP_SYNDROME;
	}
	
	str2numeric(&MaxIterNb, 1, keystrval);
	if (strtls_errno() != NO_ERROR) { config_errmsg("max_iter_nb", "Wrong format (integer value expected)"); goto end; }
	verify_keyvalue(&MaxIterNb, 1, "[0, Inf[");
	if (strtls_errno() != NO_ERROR) {config_errmsg("max_iter_nb", "value must be in [0, Inf["); goto end;}
		
	// --------------------
	// fixed-point decoding
	// --------------------
	if ( find_keyword(Conf, "fixp_quantization") == NO_ERROR )
	{
		// FixpSizeIn = size (nb bits) of input and extrinsic LLRs
		read_numvalue(&FixpSizeIn, 1, Conf);
		if (strtls_errno() != NO_ERROR) {config_errmsg("fixp_quantization", "error reading the <size_in> value"); goto end;}
		verify_keyvalue(&FixpSizeIn, 1, "[2, Inf[");
		if (strtls_errno() != NO_ERROR) {config_errmsg("fixp_quantization", "<size_in> value must be in [2, Inf["); goto end;}
		
		// FixpSizeOut = size (nb bits) of a posteriori LLRs
		read_numvalue(&FixpSizeOut, 1, Conf);
		if (strtls_errno() != NO_ERROR) {config_errmsg("fixp_quantization", "error reading the <size_out> value"); goto end;}
		
		if ( FixpSizeOut < FixpSizeIn )
		{
			config_errmsg("fixp_quantization", "<size_out> value must be greather than or equal to <size_in> value"); goto end;
		}
	}
	else
	{
		fprintf (stderr, "\n\n[ERROR: read_configfile] keyword \"fixp_quantization\" is missing from configuration file!\n\n");
		goto end;
	}

	// ------------------------------------
	// fix point decoding: fixp_input_scale
	// ------------------------------------
	read_keyvalue(&FixpInScale, 1, Conf, "fixp_input_scale");
	if (strtls_errno() != NO_ERROR) { config_errmsg("fixp_input_scale", ""); goto end; }
	
	if ( (FixpInScale <= 0) || (FixpInScale >= (1 << (FixpSizeIn-1))) )
	{
		config_errmsg("fixp_input_scale", "value must be in ]0, 2^<fixp_quantization:size_in-1>["); 
		goto end;
	} 

	// ------------------------------------
	// fix point decoding: fixp_arithm_file
	// ------------------------------------
	if ( find_keyword(Conf, "fixp_arithm_file") == NO_ERROR )
	{
		if ( fscanf(Conf, "%s", keystrval) == EOF ) 
		{
			config_errmsg("fixp_arithm_file", "missing keyword value(s)"); 
			goto end;
		}
		
		if ( (strncmp(keystrval, "proba::", 7) == 0) || (strncmp(keystrval, "PROBA::", 7) == 0) )
		{
			// fixp-arithmetic string
			strcpy(FixpArthFile, keystrval);
		}
		else
		{
			// fixp-arithmetic file
			strcpy(FixpArthFile, PATH_OF_FIXP_FILE);
			strcat(FixpArthFile, keystrval);
			strcat(FixpArthFile, EXT_OF_FIXP_FILE);
		}
	}
	
	// ----------------------------------
	// maximum number of simulated frames
	// ----------------------------------
	read_keyvalue(&MaxNbSimulFrames, 1, Conf, "max_nb_simul_frames");
	if (strtls_errno() != NO_ERROR) {config_errmsg("max_nb_simul_frames", ""); goto end;} 
	
	verify_keyvalue(&MaxNbSimulFrames, 1, "]0, Inf[");
	if (strtls_errno() != NO_ERROR) {config_errmsg("max_nb_simul_frames", "value must be in ]0, Inf["); goto end;}
	
	// ----------------------------------
	// minimum number of erroneous frames
	// ----------------------------------
	read_keyvalue(&MinNbErrorFrames, 1, Conf, "min_nb_error_frames");
	if (strtls_errno() != NO_ERROR) {config_errmsg("max_nb_simul_frames", ""); goto end;} 
	
	verify_keyvalue(&MinNbErrorFrames, 1, "]0, Inf[");
	if (strtls_errno() != NO_ERROR) {config_errmsg("min_nb_error_frames", "value must be in ]0, Inf["); goto end;}
	
	// ------------------------
	// name of the results file
	// ------------------------
	read_keyvalue(keystrval, STR_LEN, Conf, "results_file");
	
	if ( strtls_errno() == _ST_KEY_NOT_IN_FILE )
	{
		// reset the strtls errno
		strtls_error(NO_ERROR, "");
		
		// set the default results filename
		Indx1 = -1; Indx2 = strlen(ConfFile);
		for ( Indx = 0 ; Indx < strlen(ConfFile) ; Indx++ )
    	{
        	if ( ConfFile[Indx] == '/' ) Indx1 = Indx;
	    	if ( ConfFile[Indx] == '.' ) Indx2 = Indx;
    	}
    	strcpy(ResultsFile,  PATH_OF_RES_FILE);
    	strncat(ResultsFile, ConfFile + Indx1 + 1, Indx2 - Indx1 - 1);
		strcat(ResultsFile,  ".");
		
		Indx1 = -1; Indx2 = strlen(LdpcFile);
		for ( Indx = 0 ; Indx < strlen(ConfFile) ; Indx++ )
    	{
        	if ( LdpcFile[Indx] == '/' ) Indx1 = Indx;
    	}
		strncat(ResultsFile, LdpcFile + Indx1 + 1, Indx2 - Indx1 - 1);
		// add file's extension
		strcat(ResultsFile,  EXT_OF_RES_FILE); 
	}
	else if ( strtls_errno() == NO_ERROR )
	{
		strcpy(ResultsFile,  PATH_OF_RES_FILE);
		
		if (strcmp(keystrval, "config_file") == 0)
		{
			Indx1 = -1; Indx2 = strlen(ConfFile);
			for ( Indx = 0 ; Indx < strlen(ConfFile) ; Indx++ )
    		{
        		if ( ConfFile[Indx] == '/' ) Indx1 = Indx;
	    		if ( ConfFile[Indx] == '.' ) Indx2 = Indx;
    		}
    		strncat(ResultsFile, ConfFile + Indx1 + 1, Indx2 - Indx1 - 1);
		}
		else if (strcmp(keystrval, "ldpc_file") == 0)
		{
			Indx1 = -1; Indx2 = strlen(LdpcFile);
			for ( Indx = 0 ; Indx < strlen(ConfFile) ; Indx++ )
    		{
        		if ( LdpcFile[Indx] == '/' ) Indx1 = Indx;
    		}
			strncat(ResultsFile, LdpcFile + Indx1 + 1, Indx2 - Indx1 - 1);
		}
		else
		{
			strcat(ResultsFile,  keystrval);
		}
		// add file's extension
		strcat(ResultsFile,  EXT_OF_RES_FILE);
	}
	else 
	{
		config_errmsg("results_file", ""); 
		goto end;
	}
	
	// ---------------------
	// stdout refresh period
	// ---------------------
	read_keyvalue(&StdoutRefresh, 1, Conf, "stdout_refresh");
	if (strtls_errno() != NO_ERROR) {config_errmsg("stdout_refresh", ""); goto end;} 
	
	verify_keyvalue(&StdoutRefresh, 1, "[0, Inf[");
	if (strtls_errno() != NO_ERROR) {config_errmsg("stdout_refresh", "value must be in [0, Inf["); goto end;}
	
	// -----------------------
	// res-file refresh period
	// -----------------------
	read_keyvalue(&ResfileRefresh, 1, Conf, "resfile_refresh");
	if (strtls_errno() != NO_ERROR) {config_errmsg("resfile_refresh", ""); goto end;} 
	
	verify_keyvalue(&ResfileRefresh, 1, "[0, Inf[");
	if (strtls_errno() != NO_ERROR) {config_errmsg("resfile_refresh", "value must be in [0, Inf["); goto end;}
	
	
	// ==================================================================================
	// verify consistency between configuration parameters / set default parameter values
	// ==================================================================================
	
	// -----------------------------------------
	// consistency check for Gallager-G decoding
	// -----------------------------------------
	if ( LdpcDecoding == GALLAGER_B )
	{
		if ( FixpSizeIn != 2 )
		{
			fprintf (stderr, "\n\n[ERROR: read_configfile] inconsistency between the \"ldpc_decoding\" and "
					     	 "\"fixp_quantization\" parameters: <size_in> value should be equal to 2\n\n");
			goto end;
		}
		if ( FixpInScale != 1 )
		{
			fprintf (stderr, "\n\n[ERROR: read_configfile] inconsistency between the \"ldpc_decoding\" and "
					     	 "\"fixp_input_scale\" parameter: the latter should be equal to 1\n\n");
			goto end;
		}
	}
	
	// ==========================================
    // all parameters have been successfully read
    // ========================================== 
    ErrorFlag = NO_ERROR;
	
end:
	return ErrorFlag;	
}


// **************************************************************************************
//                       STANDARD_LDPC_CODE
// **************************************************************************************
static int standard_ldpc_code(const char *StandardName)
{
    char stdname[STR_LEN]; // standard name
	char stdopt[STR_LEN];  // standard option
	int    indx;           // local index
	int    K, N;
    int    ErrorFlag;      // local error flag
    
    ErrorFlag = IN_ERROR;
	
	K = 1; N = 1;
	while ( K * CONFIG::LdpcCodedSize != N * CONFIG::LdpcInfoSize )
	{
		if (K * CONFIG::LdpcCodedSize  < N * CONFIG::LdpcInfoSize)
		{
			K++;
		}
		else N++;
	}
		
	for ( indx = 0 ; indx < strlen(StandardName) ; indx++ )
	{
		if ( StandardName[indx] == '[' )
		{
			if ( (indx == 0) || (StandardName[strlen(StandardName)-1] != ']') )
			{
				fprintf(stderr,"\n\nERROR [standard_ldpc_code]: bad standard name format (\"%s\")\n\n", StandardName);
	    		goto end;
			}
			break;
		}
	}
	
	strcpy(stdname, StandardName);
	
	if ( indx == strlen(StandardName) )
	{
		stdopt[0] = '\0';
	}
	else
	{
		stdname[indx] = '_';
		stdname[strlen(StandardName)-1] = '\0';
		strcpy(stdopt,  stdname+indx);
		
		stdname[indx] = '\0';
	}
	
	sprintf(CONFIG::LdpcFile, "%s/%s%s.rate_%d_%d", stdname, stdname, stdopt, K, N);
	    
    ErrorFlag = NO_ERROR;
    
end:

    return ErrorFlag;

}

// **************************************************************************************
//                       CONFIG_ERRMSG FUNCTION
// **************************************************************************************
static void config_errmsg(const char *keyname, const char *err_message)
{
	if (strtls_errno() != NO_ERROR) strtls_errmsg();
	
	fprintf (stderr, "\n\n[ERROR: read_configfile] %s\n"
					 "[error detected when reading the \"%s\" keyword!]\n\n", err_message, keyname);
	
	return;
}

