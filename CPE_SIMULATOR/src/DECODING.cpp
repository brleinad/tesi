/* ########################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : DECODING.cpp
## Language             : C++
## Short description    : implements the LDPC decoding module
##                      : calls one of the following sub-modules
##                      :     DEC_LDPC_BIN      - floating-point LDPC decoding sub-module
##                      :     DEC_FIXP_LDPC_BIN - fixed-point LDPC decoding sub-module
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ######################################################################################## */

#include "../include/DECODING.h"
static void decoding_errmsg(const char *keyname, const char *err_message);

// ####################################
// Method name : DECODING
// Description : constructor definition
// ####################################

DECODING::DECODING()
{
    // -------------
    // reset actions
    // -------------
	ptFifoIn1  = 0;
	ptFifoIn2  = 0;
	ptFifoOut1 = 0;
	ptFifoOut2 = 0;
	Reset();

}   // end of constructor

// ###################################
// Method name : ~DECODING
// Description : destructor definition
// ###################################

DECODING::~DECODING()
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

int DECODING::Activate()
{
    int ErrorFlag = IN_ERROR;
    
	if ( (ptFifoIn1 == 0) || (ptFifoIn2 == 0) )
	{
		fprintf(stderr, "\n\nERROR [DECODING::Activate] input fifo(s) of the module must be set before module activation\n\n");
		goto end;
	}

    // ---------------------------------------
    // Get the module configuration parameters
    // ---------------------------------------
    GetParam();    

	// ------------------
	// read the LDPC file
	// ------------------
	if ( ReadLdpc() == IN_ERROR ) goto end;

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
		fprintf(stderr, "\n\nERROR [DECODING::Activate] Activation failure (out fifo(s) = 0)\n\n");
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

void DECODING::Reset()
{
    // ------------------------------------------------------------------------
    // Reset the dynamic memory array and structure pointers used by the module
    // Mandatory with Visual C++ 6.0 when a 'Debug' version is produced
    // ------------------------------------------------------------------------
	QC_flag    = 0;    // '1' if QC codes, '0' otherwise
	VarNodesNb = -1;   // number of var-nodes (variable-nodes)
	ChkNodesNb = -1;   // number of chk-nodes (check-nodes)
	EdgesNb    = -1;   // number of edges of the graph
	MaxChkDeg  = -1;   // maximum chk-node degree
	ptChkDeg   = 0;    // chk-nodes degrees 
	ptChkList  = 0;    // lists of var-nodes connected to each chk-node
	ptChkCoef  = 0;    // coefs of var-nodes connected to each chk-node
	ptSrcIndx  = 0;    // indexes of source var-nodes
	ptParIndx  = 0;    // indexes of source parity-nodes
	ptFixp_FifoIn = 0; // fixed-point conversion for ptFifoIn
	ptDecodedBits = 0; // decoded bits -- estimated F bits
	
	// ptVarPerm    = 0;
	// ptVarPermInv = 0;
	
	// decoding class -- fixed point decoding
	ptDecFixpLdpcBin = 0;  // fixed-point decoding for binary-LDPC codes

}   // end of 'Reset' method

// ###########################################################
// Method name : GetParam
// Description : get the value of the configuration parameters
// ###########################################################

void DECODING::GetParam()
{	
	LdpcDecoding   = CONFIG::LdpcDecoding;   // ldpc decoding (Sum-Product, Min-Sum, Min-Max, etc.)
	LdpcScheduling = CONFIG::LdpcScheduling; // ldpc scheduling (flooding, serial, layered)
	LdpcLayersNb   = CONFIG::LdpcLayersNb;   // number of layers (for layered decoding)
	MaxIterNb      = CONFIG::MaxIterNb;      // maximum number of decoding iterations
	StopCriterion  = CONFIG::StopCriterion;  // stopping criterion
	GallB_thres    = CONFIG::GallB_thres;    // Gallager-B qualified majority threshold
	MS_Offset      = CONFIG::MS_Offset;      // offset factor for min-sum decoding
	FixpSizeIn     = CONFIG::FixpSizeIn;     // size (in bits) of the input LLRs 
	FixpSizeExt    = CONFIG::FixpSizeIn;     // size (in bits) of the extrinsic LLRs (exchanged messages)
	FixpSizeOut    = CONFIG::FixpSizeOut;    // size (in bits) of the output a-posteriori LLRs
	FixpInScale    = CONFIG::FixpInScale;    // scale factor of the decoder's input (fixp decoder only)
	LdpcBinDim     = CONFIG::LdpcInfoSize;   // binary dimension of the LDPC code
	LdpcBinLen     = CONFIG::LdpcCodedSize;  // binary length of the LDPC code
	
	// name of the LDPC file (w/out extension)
	strcpy(LdpcFile, PATH_OF_LDPC_FILE); // path of the LDPC file
	strcat(LdpcFile, CONFIG::LdpcFile);  // name of the LDPC file (w/out extension)
	
	return;

}   // end of 'GetParam' method

// #########################################
// Method name : ReadLdpc
// Description : read the LDPC decoding file
// #########################################
int DECODING::ReadLdpc()
{
    FILE *Ldpc;                  // stream for LDPC decoding file
	char LdpcFileTmp[STR_LEN];   // name of LDPC file with extension!
	char endkey[STR_LEN];        // ending string of key
	char *endendkey;             // points to the ending part of 'endkey'
	int  Chk, Var, Dim;          // local indexes for chk and var-nodes, and their dimensions
	int  ExpChk, ExpVar;         // expanded chk and var-nodes (QC-LDPC codes)
	int  Deg, Coef, CoefTmp;     // local indexes for degrees and non-binary coefs
	int  Symb, SymbDim;          // non-binary symbols (between 0,...,MaxVarCard-1)
	int  MaxVarCard, MaxChkCard; // 1 << MaxVarDim, 1 << MaxChkDim
	int  NodeDimSum;             // sum of node dimensions
	int  Indx, Exp;              // local indexes
	int **ptLeft, **ptRight;     // used to read data from the LDPC file
	int  ExpFactor;              // expading factor (for QC-LDPC codes)
	int  ErrorFlag;              // error flag - returned value!
    
	// ================================
    // Initialization of the error flag
    // ================================
    ErrorFlag = IN_ERROR;
	ExpFactor = 1;
	QC_flag   = 0;

    // ------------------------------------------
    // open the stream for the LDPC decoding file
    // ------------------------------------------
    Ldpc = NULL;
	
	// try to open the parity-check matrix file
	strcpy(LdpcFileTmp, LdpcFile);
	strcat(LdpcFileTmp, PC_MAT_FILE_EXT);
	Ldpc = fopen(LdpcFileTmp, "r");
	
	if (Ldpc == NULL)
	{
		// try to open the quasi-cyclic base matrix file
		strcpy(LdpcFileTmp, LdpcFile);
		strcat(LdpcFileTmp, QC_BMAT_FILE_EXT);
		Ldpc = fopen(LdpcFileTmp, "r");
		
		// if successful, the code is quasi-cyclic
		if(Ldpc != NULL) QC_flag = 1;
	}
	
    if (Ldpc == NULL)
    {
		fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] Cannot open the LDPC file \"%s\" with any of the \"%s\" "
		         		 "or \"%s\" extension (read mode)!\n\n", LdpcFile, PC_MAT_FILE_EXT, QC_BMAT_FILE_EXT);
		goto end;
    }
    
    // ========================
    // read the LDPC file (1/3)
    // ========================
	
	
	// --------------------
	// quasi-cyclic keyword
	// --------------------
	if ( QC_flag == 0 )
	{
		read_keyvalue(&QC_flag, 1, Ldpc, "qc_ldpc");
		if ((strtls_errno() != _ST_KEY_NOT_IN_FILE) && (strtls_errno() != NO_ERROR))
		{
			decoding_errmsg("qc_ldpc", "wrong value (?)"); 
			goto end;
		}
	
		verify_keyvalue(&QC_flag, 1, (int []) {0, 1}, 2);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("qc_ldpc", "value must be either 0 or 1"); goto end;}
	}
	
	// ---------------
	// nb_rows keyword
	// ---------------
	read_keyvalue(&ChkNodesNb, 1, Ldpc, "nb_rows");
	if (strtls_errno() != NO_ERROR) {decoding_errmsg("nb_rows", "wrong value (?)"); goto end;}
	
	verify_keyvalue(&ChkNodesNb, 1, "[1, Inf[");
	if (strtls_errno() != NO_ERROR) {decoding_errmsg("nb_rows", "value must be in [1, Inf["); goto end;}
	
	// ---------------
	// nb_cols keyword
	// ---------------
	read_keyvalue(&VarNodesNb, 1, Ldpc, "nb_cols");
	if (strtls_errno() != NO_ERROR) {decoding_errmsg("nb_cols", "wrong value (?)"); goto end;}
	
	verify_keyvalue(&VarNodesNb, 1, "[1, Inf[");
	if (strtls_errno() != NO_ERROR) {decoding_errmsg("nb_cols", "value must be in [1, Inf["); goto end;}
			
	
	// ==================
	// verify consistency
	// ==================
	
	if ( QC_flag == 1 ) // QC-LDPC codes
	{
		if ( LdpcBinLen % VarNodesNb != 0 )
		{
			fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] QC-LDPC: Inconsistency between \"nb_cols\" "
					 	"(%d) read from the LDPC file and the \"coded_size\" (%d) parameter from the "
					 	"configuration file!\n\n", VarNodesNb, LdpcBinLen);
			goto end;
		}
		
		// --------------------------
		// update the QC-factor value
		// --------------------------
		ExpFactor = LdpcBinLen / VarNodesNb;
		
		/* if ( LdpcBinDim % ExpFactor != 0 )
		{
			fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] QC-LDPC: Inconsistency between "
					 "\"exp_factor\" (%d) and the \"info_size\" (%d) parameter read "
					 "from the configuration file!\n\n", ExpFactor, LdpcBinDim);
			goto end;
		} */
	}
	else
	{
		if ( VarNodesNb != LdpcBinLen )
		{
			fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] Inconsistency between \"nb_cols\" "
					 "(%d) read from the LDPC file and the \"info_size\" (%d) parameter "
					 "from the configuration file!\n\n", VarNodesNb, LdpcBinLen);
			goto end;
		}
		ExpFactor = 1;
	}	
		

    // =====================
    // allocate memory (1/2)
    // =====================
	if ( AllocArray(ptChkDeg,  "DECODING::ptChkDeg",  ExpFactor*ChkNodesNb)  == IN_ERROR ) goto end;
	if ( AllocArray(ptSrcIndx, "DECODING::ptSrcIndx", LdpcBinDim)            == IN_ERROR ) goto end;
	if ( AllocArray(ptParIndx, "DECODING::ptParIndx", LdpcBinLen-LdpcBinDim) == IN_ERROR ) goto end;
	
	// ========================
    // read the LDPC file (2/3)
    // ========================
    
	// ---------------------------
	// indexes of source var-nodes
	// ---------------------------
	if ( find_keyword(Ldpc, "src_indx") == NO_ERROR )
	{
		if ( LdpcBinDim % ExpFactor != 0 )
		{
			fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] QC-LDPC, \"src_indx\" keyword: Inconsistency between "
					 "\"exp_factor\" (%d) and the \"info_size\" (%d) parameter read "
					 "from the configuration file!\n\n", ExpFactor, LdpcBinDim);
			goto end;
		} 
		
		read_numvalue(ptSrcIndx, LdpcBinDim/ExpFactor, Ldpc);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("src_indx", ""); goto end;}
	
		verify_keyvalue(ptSrcIndx, LdpcBinDim/ExpFactor, "[%d, %d[", 0, VarNodesNb);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("src_indx", "values must be in [0, nb_cols["); goto end;}
		
		if ( ExpFactor != 1 )
		{
			// convert to binary indexes
			for ( Indx = LdpcBinDim/ExpFactor - 1 ; Indx >= 0 ; Indx-- )
			{
				Var = ptSrcIndx[Indx];
				
				for ( Exp = ExpFactor-1 ; Exp >= 0 ; Exp-- )
				{
					ptSrcIndx[Indx*ExpFactor + Exp] = Var*ExpFactor + Exp;
				}
			}
		}
		
	}
	else if ( find_keyword(Ldpc, "bin_src_indx") == NO_ERROR )
	{
		read_numvalue(ptSrcIndx, LdpcBinDim, Ldpc);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("bin_src_indx", ""); goto end;}
	
		verify_keyvalue(ptSrcIndx, LdpcBinDim, "[%d, %d[", 0, LdpcBinLen);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("bin_src_indx", "values must be in [0, ldpc_bin_len["); goto end;}
	}
	else
	{
		fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] keywords \"src_indx\" and \"bin_src_indx\" "
					 "are both missing from the LDPC file!\n\n");
		goto end;
	}
	
	// ---------------------------
	// indexes of parity var-nodes
	// ---------------------------
	if ( find_keyword(Ldpc, "par_indx") == NO_ERROR )
	{
		if ( LdpcBinDim % ExpFactor != 0 )
		{
			fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] QC-LDPC, \"par_indx\" keyword: Inconsistency between "
					 "\"exp_factor\" (%d) and the \"info_size\" (%d) parameter read "
					 "from the configuration file!\n\n", ExpFactor, LdpcBinDim);
			goto end;
		} 
		
		read_numvalue(ptParIndx, (LdpcBinLen-LdpcBinDim)/ExpFactor, Ldpc);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("par_indx", ""); goto end;}
	
		verify_keyvalue(ptParIndx, (LdpcBinLen-LdpcBinDim)/ExpFactor, "[%d, %d[", 0, VarNodesNb);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("par_indx", "values must be in [0, nb_cols["); goto end;}
		
		if ( ExpFactor != 1 )
		{
			// convert to binary indexes
			for ( Indx = (LdpcBinLen-LdpcBinDim)/ExpFactor - 1 ; Indx >= 0 ; Indx-- )
			{
				Var = ptParIndx[Indx];
				
				for ( Exp = ExpFactor-1 ; Exp >= 0 ; Exp-- )
				{
					ptParIndx[Indx*ExpFactor + Exp] = Var*ExpFactor + Exp;
				}
			}
		}
		
	}
	else if ( find_keyword(Ldpc, "bin_par_indx") == NO_ERROR )
	{
		read_numvalue(ptParIndx, LdpcBinLen-LdpcBinDim, Ldpc);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("bin_par_indx", ""); goto end;}
	
		verify_keyvalue(ptParIndx, LdpcBinLen-LdpcBinDim, "[%d, %d[", 0, LdpcBinLen);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("bin_par_indx", "values must be in [0, ldpc_bin_len["); goto end;}
	}
	else
	{
		fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] keywords \"par_indx\" and \"bin_par_indx\" "
					 "are both missing from the LDPC file!\n\n");
		goto end;
	}

	// ----------------
	// chk-node degrees
	// ----------------
	if ( find_keyword(Ldpc, "all_row_deg") == NO_ERROR )
	{
		read_numvalue(ptChkDeg, ChkNodesNb, Ldpc);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("all_row_deg", ""); goto end;}
		
		verify_keyvalue(ptChkDeg, ChkNodesNb, "[%d, %d]", 1, VarNodesNb);
		if (strtls_errno() != NO_ERROR) {decoding_errmsg("all_row_deg", "values must be in [1, nb_cols]"); goto end;}
		
		MaxChkDeg = 0;
		for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
		{
			if ( ptChkDeg[Chk] > MaxChkDeg ) MaxChkDeg = ptChkDeg[Chk];
		}
	}

	else if ( find_keyword(Ldpc, "qc_base_matrix") == NO_ERROR )
	{
		if ( QC_flag == 0 )
		{
			fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] the \"qc_ldpc\" keyword is missing! it is "
			                 "mandatory when the \"qc_base_matrix\" keyword is used!\n\n");
			goto end; 
		}
		
		MaxChkDeg = 0;
		for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
		{
			ptChkDeg[Chk] = 0;
			for ( Var = 0 ; Var < VarNodesNb ; Var++ )
			{
				if ( fscanf(Ldpc, "%d", &Coef) == EOF )
				{
					fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] missing value(s) for keyword \"qc_base_matrix\"\n\n");
					goto end;
				}
				else if ( Coef >= 0 ) ptChkDeg[Chk]++;
			}
			if ( ptChkDeg[Chk] > MaxChkDeg ) MaxChkDeg = ptChkDeg[Chk];
		}
	}
	
	else
	{
		fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] at least one of the keywords \"all_row_deg\" "
		                 "or \"qc_base_matrix\" (only for QC-LDPC codes) must be defined in the file!\n\n");
		goto end;
	}

	
	// =====================
    // allocate memory (1/2)
    // =====================
	if ( AllocMatrix(ptChkList, "DECODING::ptChkList", ExpFactor*ChkNodesNb, MaxChkDeg) == IN_ERROR ) goto end;
	
	if ( QC_flag == 1 )
	{
		if ( AllocMatrix(ptChkCoef, "DECODING::ptChkCoef", ChkNodesNb, MaxChkDeg) == IN_ERROR ) goto end;
	}
	
	
	// ========================
    // read the LDPC file (3/3)
    // ========================
	
	// ----------------------------------------
	// list of var-nodes connected to chk-nodes
	// ----------------------------------------
	if ( find_keyword(Ldpc, "all_row_deg") == NO_ERROR )
	{
		if ( QC_flag == 0 )
		{
			if ( find_keyword(Ldpc, "nzentries_per_row") == IN_ERROR )
			{
				decoding_errmsg("nzentries_per_row", "keyword is missing from file!");
				goto end;
			}
			for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
			{
				read_numvalue(ptChkList[Chk], ptChkDeg[Chk], Ldpc);
				if (strtls_errno() != NO_ERROR) {decoding_errmsg("nzentries_per_row", ""); goto end;}
		
				verify_keyvalue(ptChkList[Chk], ptChkDeg[Chk], "[%d, %d[", 0, VarNodesNb);
				if (strtls_errno() != NO_ERROR) {decoding_errmsg("nzentries_per_row", "values must be in [0, nb_cols["); goto end;}
			}
		}
		else // (QC_flag > 0) 
		{
			endkey[0] = '\0';
			if ( (find_keyword(Ldpc, "nzentries_per_row") == IN_ERROR) && \
		     	 (find_keyword(Ldpc, "nzentries_per_row", endkey) == IN_ERROR) )
			{
				decoding_errmsg("nzentries_per_row", "keyword is missing from file!");
				goto end;
			}
			if (strlen(endkey) == 0) strcpy(endkey, "[col:coef]");
		
			if ( strcmp(endkey, "[col:coef]") == 0 )
			{
				ptLeft  = ptChkList;
				ptRight = ptChkCoef;
				strcpy(endkey, ":");
			}
			else if ( strcmp(endkey, "[coef:col]") == 0 )
			{
				ptLeft  = ptChkCoef;
				ptRight = ptChkList;
				strcpy(endkey, ":");
			}
			else if ( strcmp(endkey, "[col_coef]") == 0 )
			{
				ptLeft  = ptChkList;
				ptRight = ptChkCoef;
				strcpy(endkey, "");
			}
			else if ( strcmp(endkey, "[coef_col]") == 0 )
			{
				ptLeft  = ptChkCoef;
				ptRight = ptChkList;
				strcpy(endkey, "");
			}
			else
			{
				decoding_errmsg("nzentries_per_row", "keyword is missing from file!");
				goto end;
			}
			
			
			for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
			{
				read_numvalue(ptLeft[Chk], ptRight[Chk], ptChkDeg[Chk], Ldpc, endkey);
				if (strtls_errno() != NO_ERROR) {decoding_errmsg("nzentries_per_row", ""); goto end;}
		
				verify_keyvalue(ptChkList[Chk], ptChkDeg[Chk], "[%d, %d[", 0, VarNodesNb);
				if (strtls_errno() != NO_ERROR) {decoding_errmsg("nzentries_per_row", "col values must be in [0, nb_cols["); goto end;}
			}
		}
		
		
		
		if ( QC_flag == 1 )
		{
			if ( find_keyword(Ldpc, "qcshift*=coef/", endkey) == NO_ERROR )
			{
				if ( (str2numeric(&Coef, 1, endkey) < 1) || (strtls_errno() != NO_ERROR) )
				{
					decoding_errmsg("qcshift*=coef/", "wrong denominator value!");
					goto end;
				}
				if ( Coef <= 0 )
				{
					decoding_errmsg("qcshift*=coef/", "denominator value must be positive!");
					goto end;
				}
				for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
				{
					for ( Deg = 0 ; Deg < ptChkDeg[Chk] ; Deg++ )
					{
						ptChkCoef[Chk][Deg] = (int) (ptChkCoef[Chk][Deg]*ExpFactor)/Coef;
					}
				}
			}
			for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
			{
				verify_keyvalue(ptChkCoef[Chk], ptChkDeg[Chk], "[0, Inf[");
				if (strtls_errno() != NO_ERROR) {decoding_errmsg("nzentries_per_row", "coef values must be in [0, Inf["); goto end;}
					
				for ( Deg = 0 ; Deg < ptChkDeg[Chk] ; Deg++ )
				{
					ptChkCoef[Chk][Deg] = ptChkCoef[Chk][Deg] % ExpFactor;
				}
			}
		}	
	}

	else if ( find_keyword(Ldpc, "qc_base_matrix") == NO_ERROR )
	{
		// QC_flag is positive (as verified when reading the 'all_row_deg' keyword)
		
		for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
		{
			Deg = 0;
			for ( Var = 0 ; Var < VarNodesNb ; Var++ )
			{
				fscanf(Ldpc, "%d", &Coef);
				
				if ( Coef >= 0 )
				{
					ptChkList[Chk][Deg] = Var;
					ptChkCoef[Chk][Deg] = Coef;
					Deg++;
				}
			}
			if ( Deg != ptChkDeg[Chk] )
			{
				decoding_errmsg("qc_base_matrix", "the row degree is not equal to number of non-zero entries!");
				goto end;
			}
		}
		
		if ( find_keyword(Ldpc, "qcshift*=coef/", endkey) == NO_ERROR )
		{
			if ( (str2numeric(&Coef, 1, endkey) < 1) || (strtls_errno() != NO_ERROR) )
			{
				decoding_errmsg("qcshift*=coef/", "wrong denominator value!");
				goto end;
			}
			if ( Coef <= 0 )
			{
				decoding_errmsg("qcshift*=coef/", "denominator value must be positive!");
				goto end;
			}
						
			for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
			{
				for ( Deg = 0 ; Deg < ptChkDeg[Chk] ; Deg++ )
				{
					ptChkCoef[Chk][Deg] = (int) (ptChkCoef[Chk][Deg]*ExpFactor)/Coef;
				}
			}
		}
		for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
		{
			for ( Deg = 0 ; Deg < ptChkDeg[Chk] ; Deg++ )
			{
				ptChkCoef[Chk][Deg] = ptChkCoef[Chk][Deg] % ExpFactor;
			}
		}
	}
	// else -- cannot happen (as verified when reading the 'all_row_deg' keyword)
	
	
	
	// =====================================================
	// binary QC-LDPC codes: expand the graph by 'ExpFactor'
	// =====================================================
	if ( QC_flag == 1 )
	{
		// -------------------------------------------------------
		// update chk-node degrees and lists of neighbor variables
		// -------------------------------------------------------
		for ( Chk = ChkNodesNb-1 ; Chk >= 0 ; Chk-- )
		{
			for ( Deg = 0 ; Deg < ptChkDeg[Chk] ; Deg++ )
			{
				Coef = ptChkCoef[Chk][Deg];
				Var  = ptChkList[Chk][Deg];
			
				for ( Indx = ExpFactor-1; Indx >= 0 ; Indx-- )
				{
					ExpChk = ExpFactor*Chk + Indx;
					ExpVar = ExpFactor*Var + (Indx + Coef) % ExpFactor;
					
					ptChkList[ExpChk][Deg] = ExpVar;
				}
			}
			
			for ( Indx = ExpFactor-1; Indx >= 0 ; Indx-- )
			{
				ptChkDeg[ExpFactor*Chk + Indx] = ptChkDeg[Chk];
			}
		}
		
		// --------------------------------------------
		// update the number of chk-nodes and var-nodes
		// --------------------------------------------
		ChkNodesNb *= ExpFactor;
		VarNodesNb *= ExpFactor;
	}
	
	// ===========================
	// compute the number of edges
	// ===========================
	EdgesNb = 0;
	for ( Chk = 0 ; Chk < ChkNodesNb ; Chk++ )
	{
		EdgesNb += ptChkDeg[Chk];
	}
	
	// ========================================================================
	// verify consistency with the number of decoding layers (layered decoding)
	// ========================================================================
	if ( (LdpcScheduling == LAYER_SCHEDULING) && (ChkNodesNb % LdpcLayersNb != 0) )
	{
		fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] Inconsistency between \"nb_rows\" (%d) read from "
					 	"the LDPC file and the number of layers (%d) for the layered scheduling read from the "
					 	"configuration file!\n\n", ChkNodesNb, LdpcLayersNb);
		goto end;
	}
		
	
	// ====================================================
	// export parameters (for the 'display_config' function
	// ====================================================
	export_disp_config_param("var_nodes_nb", VarNodesNb);
	export_disp_config_param("chk_nodes_nb", ChkNodesNb);
	export_disp_config_param("edges_nb",     EdgesNb);
	
	if ( QC_flag == 1 ) 
	{
		export_disp_config_param("qc_factor", ExpFactor);
	}
	
    // ====================================
    // LDPC decoding file successfully read
    // ====================================
    ErrorFlag = NO_ERROR;

end:
    if (Ldpc != 0) {fclose(Ldpc); Ldpc = 0;}
    return ErrorFlag;   

}   // end of 'Mem' method

 

// ###############################
// Method name : Mem
// Description : memory allocation
// ###############################

int DECODING::Mem()
{
    // ================================
    // Initialization of the error flag
    // ================================
    int ErrorFlag = IN_ERROR;

    // ===================
    // Allocate the memory 
    // ===================
    
	// -----------------------------------------
	// out FIFOs and buffer for the decoded bits
	// -----------------------------------------
	if ( AllocArray(ptFifoOut1,    "DECODING::ptFifoOut1",    LdpcBinDim)   == IN_ERROR ) goto end;
	if ( AllocArray(ptFifoOut2,    "DECODING::ptFifoOut2",    NB_LDPC_STAT) == IN_ERROR ) goto end;
	if ( AllocArray(ptDecodedBits, "DECODING::ptDecodedBits", LdpcBinLen)   == IN_ERROR ) goto end;
	
	// ------------------------------------------
	// allocate the pointer to the decoding class
	// ------------------------------------------
	if ( AllocPointer(ptDecFixpLdpcBin, "DECODING::ptDecFixpLdpcBin")     == IN_ERROR ) goto end;
	if ( AllocArray(ptFixp_FifoIn, "DECODING::ptFixp_FifoIn", LdpcBinLen) == IN_ERROR ) goto end;
	
    // ===================================
    // memory allocation successfully done
    // ===================================
    ErrorFlag = NO_ERROR;

end:
    
    return ErrorFlag;   

}   // end of 'Mem' method


// #################################################################
// Method name : Init
// Description : initializations needed by the implemented algorithm
// #################################################################

int DECODING::Init()
{
	// ---------------
	// init error flag
	// ---------------
	int ErrorFlag = IN_ERROR;
		
	// ---------------
	// init ptFifoOut2
	// ---------------
	for ( int Indx = 0 ; Indx < NB_LDPC_STAT ; Indx++ )
	{
		ptFifoOut2[Indx] = 0;
	}
	
	// ---------------------------
	// activate the decoding class
	// ---------------------------
	if ( ptDecFixpLdpcBin->Activate(this) == IN_ERROR ) goto end;

	
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

void DECODING::Free()
{
	// -------------------------
    // Free the memory allocated 
    // -------------------------
	FreeArray(ptFifoOut1);
	FreeArray(ptFifoOut2);
	FreeArray(ptChkDeg);
	FreeArray(ptSrcIndx);
	FreeArray(ptParIndx);
	FreeArray(ptFixp_FifoIn);
	FreeArray(ptDecodedBits);
	FreeMatrix(ptChkList);
	FreeMatrix(ptChkCoef);
	FreePointer(ptDecFixpLdpcBin);
	
}   // end of 'Free' method


// ###########################################
// Method name : Main
// Description : main module method definition
// ###########################################

void DECODING::Main()
{	
	int indx;
	int LdpcBinCodim = LdpcBinLen - LdpcBinDim;
	
	// --------------------------
	// set 'ptFixp_FifoIn' values
	// --------------------------
	for ( indx = 0 ; indx < LdpcBinDim ; indx++ )
	{
		ptFixp_FifoIn[ptSrcIndx[indx]] = (1-2*ptFifoIn1[indx])*FixpInScale;
	}
	for ( indx = 0 ; indx < LdpcBinCodim ; indx++ )
	{
		ptFixp_FifoIn[ptParIndx[indx]] = (1-2*ptFifoIn2[indx])*FixpInScale;
	}
	
	// ---------------------------------
	// call the fix-point decoding class
	// ---------------------------------
	ptDecFixpLdpcBin->Main();
	
	// -------------------------------------------------------
	// extract the source bits from the vector of decoded bits
	// -------------------------------------------------------
	for ( indx = 0 ; indx < LdpcBinDim ; indx++ )
	{
		// ptFifoOut1[indx] = ptDecodedBits[ptVarPermInv[indx]];
		ptFifoOut1[indx] = ptDecodedBits[ptSrcIndx[indx]];
	}
	
	return;

}   // end of 'Main' method


// ##############################################
// Static function : decoding_errmsg
// Description : displays error message on stderr
// ##############################################
static void decoding_errmsg(const char *keyname, const char *err_message)
{
	if (strtls_errno() != NO_ERROR) strtls_errmsg();
	
	fprintf (stderr, "\n\n[ERROR- DECODING::ReadLdpc] %s\n"
					 "[error detected when reading the \"%s\" keyword!]\n\n", err_message, keyname);
	
	return;
}

