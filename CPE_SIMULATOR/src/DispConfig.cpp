/* #################################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : DispConfig.cpp 
## Language             : C++
## Short description    : displays the configuration structure on stdout and results file
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ################################################################################################# */

#include "../include/DispConfig.h"

static int QCfactor     = -1;  // Quasi-Cyclic expansion factor
static int LdpcType     = -1;  // type of the LDPC code
static int VarNodesNb   = -1;  // number of variable nodes
static int ChkNodesNb   = -1;  // number of check-nodes
static int EdgesNb      = -1;  // average var-node degree
static int NbInternsF   = -1;  // number of internal nodes - original circuit F
static int NbInternsP   = -1;  // number of internal nodes - parity circuit P
static int NbCTnodesF   = -1;  // number of critical nodes - original circuit F
static int NbCTnodesP   = -1;  // number of critical nodes - parity circuit P
static int    FixpArithmType   = -1;    // fix-point arithmetic type
static int    FixpInexLthType  = -1;    // fix-point inexact-comparator (less than) type
static int    FixpProbAddType  = -1;    // fix-point probabilistic-adder type
static int    FixpProbAddDepth = -1;    // fix-point probabilistic-adder depth
static int    FixpProbLthType  = -1;    // fix-point probabilistic-comparator (less than) type
static int    FixpProbXorType  = -1;    // fix-point probabilistic-xor type
static double FixpProbAddPerr  = -1.0;  // fix-point probabilistic-adder error probability
static double FixpProbLthPerr  = -1.0;  // fix-point probabilistic-comparator error probability
static double FixpProbXorPerr  = -1.0;  // fix-point probabilistic-xor error probability
static DISP_CONFIG *ptDispC = 0;        // pointer to the DISP_CONFIG structure

// **************************************************************************************
//                       DISPLAY_CONFIG FUNCTION
// **************************************************************************************
int display_config(void)
{
	FILE *Res;             // fstream to results file
	char str_tmp[STR_LEN]; // temporary string
	int  ErrorFlag;        // error flag (returned value)
	int  line_offset;      // 
	
	// ---------------
	// init Error Flag
	// ---------------
	ErrorFlag = IN_ERROR;
	Res       = 0;

	if ( ptDispC != 0 )
	{
		fprintf(stderr, "\n\n[ERROR: display_config] configuration has already been displayed once!\n\n");
		goto end;
	}
	
	// -------------------------
	// resize window (if needed)
	// -------------------------
	line_offset = 3;
	
	#ifdef MAKE_TERM_RESIZE
		#ifdef TIOCGWINSZ
		struct winsize ws; // window size
		if ( ioctl(0, TIOCGWINSZ, &ws) == 0 )
		{
			if ( (ws.ws_row < 35) || (ws.ws_col < DISP_LINE_LEN+line_offset) )
			{
				if (ws.ws_row < 35) ws.ws_row = 35;
				if (ws.ws_col < DISP_LINE_LEN+line_offset) ws.ws_col = DISP_LINE_LEN+line_offset;
				sprintf(str_tmp, "resize -s %d %d >/dev/null 2>&1", ws.ws_row, ws.ws_col);
				if ( system(str_tmp) == -1 )
				{
					fprintf(stderr, "\n[Warning - xterm window cannot be resized]\n");
					fprintf(stderr, "[Make sure the window is large enough for correct display on stdout]\n");
					fprintf(stderr, "[Waiting for 3 seconds...]\n");
					sleep(3);
				}
			}
		}
		else 
		{
			fprintf(stderr, "\n[Warning - xterm window cannot be resized]\n");
			fprintf(stderr, "[Make sure the window is large enough for correct display on stdout]\n");
			fprintf(stderr, "[Waiting for 3 seconds...]\n");
			sleep(3);
		}
		#else
		fprintf(stderr, "\n[Warning - xterm window cannot be resized]\n");
		fprintf(stderr, "[Make sure the window is large enough for correct display on stdout]\n");
		fprintf(stderr, "[Waiting for 3 seconds...]\n");
		sleep(3);
		#endif
	#endif 
	
	// ==================================================
	// Allocate memory / define the DISP_CONFIG structure
	// ==================================================
	if ( AllocPointer(ptDispC, "display_config::ptDispC") == IN_ERROR ) goto end;
	
	strncpy(ptDispC->ConfFile,    CONFIG::ConfFile,    DISP_LINE_LEN - 21);
	strncpy(ptDispC->LdpcFile,    CONFIG::LdpcFile,    DISP_LINE_LEN - 21);
	strncpy(ptDispC->NetlistFile, CONFIG::NetlistFile, DISP_LINE_LEN - 21);
	
	int2str_list(CONFIG::LdpcDecoding, ptDispC->LdpcDecoding, 5, \
	            (int []) {SUM_PRODUCT, MIN_SUM, SC_MIN_SUM, GALLAGER_B, STOCHASTIC}, \
				(char [][STR_LEN]) {"Sum-Product", "Min-Sum", "SC-Min-Sum", "Gallager-B", "Stochastic"});
	
	if (CONFIG::LdpcDecoding == MIN_SUM)
	{
		if ( CONFIG::MS_Offset > 0 )
		{
			sprintf(str_tmp, "[of=%d]", CONFIG::MS_Offset);
			strcat(ptDispC->LdpcDecoding, str_tmp);
		}
	}
	
	if ((CONFIG::LdpcDecoding == GALLAGER_B) && (CONFIG::GallB_thres > 1))
	{
		sprintf(str_tmp, "[t=%d]", CONFIG::GallB_thres);
		strcat(ptDispC->LdpcDecoding, str_tmp);
	}
	
	int2str_list(CONFIG::LdpcScheduling, ptDispC->LdpcScheduling, 3, \
	            (int [])           {FLOOD_SCHEDULING, SERIAL_SCHEDULING, LAYER_SCHEDULING}, \
				(char [][STR_LEN]) {   "flooding",        "serial",       "layered:" });
	
	if (CONFIG::LdpcScheduling == LAYER_SCHEDULING)
	{
		sprintf(str_tmp, "%d", CONFIG::LdpcLayersNb);
		strcat(ptDispC->LdpcScheduling, str_tmp);
	}
	
	if ( QCfactor > 0 )
	{
		sprintf(ptDispC->LdpcType, "QC[exp=%d]", QCfactor);
	}
	else strcpy(ptDispC->LdpcType, "Binary");
	
	
	strcpy(ptDispC->FixpDecoding,      "");
	strcpy(ptDispC->FixpInScale,       "");
	strcpy(ptDispC->FixpArithmetic[0], "");
	strcpy(ptDispC->FixpArithmetic[1], "");
	
	// --------------------
	// fixed-point decoding
	// --------------------
	sprintf(ptDispC->FixpDecoding, "fixed-point quantization: input and extrinsic LLRs = %d bits, output LLRs = %d bits", CONFIG::FixpSizeIn, CONFIG::FixpSizeOut);
	sprintf(ptDispC->FixpInScale,  "      input scale factor: %d", (int) CONFIG::FixpInScale);
	
	switch ( FixpArithmType )
	{
		case FIXP_EXACT_ARITHM:
			break;
				
		case FIXP_PROBA_ARITHM:
				
			sprintf(ptDispC->FixpArithmetic[0], "probabilistic arithmetic: ");
			sprintf(ptDispC->FixpArithmetic[1], "                        : ");
				
			strcpy(str_tmp, "");
			if ( FixpProbAddType == ADD_EXACT )
			{
				sprintf(str_tmp, "adder [exact]");
			}
			else if ( FixpProbAddType == ADD_PROBA )
			{
				sprintf(str_tmp, "adder [depth = %d, perr = %.4f]", FixpProbAddDepth, FixpProbAddPerr);
			}
			strcat(ptDispC->FixpArithmetic[0], str_tmp);
				
			strcpy(str_tmp, "");
			if ( FixpProbLthType == LTH_EXACT )
			{
				sprintf(str_tmp, "comp [exact]");
			}
			else if ( FixpProbLthType == LTH_FROM_ADD )
			{
				sprintf(str_tmp, "comp [from adder]");
			}
			else if ( FixpProbLthType == LTH_PROBA )
			{
				sprintf(str_tmp, "comp [perr = %.4f]", FixpProbLthPerr);
			}
			strcat(ptDispC->FixpArithmetic[1], str_tmp);
			
			strcpy(str_tmp, "");
			if ( FixpProbXorType == XOR_EXACT )
			{
				sprintf(str_tmp, " -- xor [exact]");
			}
			else if ( FixpProbXorType == XOR_PROBA )
			{
				sprintf(str_tmp, " -- xor [perr = %.4f]", FixpProbXorPerr);
			}
			strcat(ptDispC->FixpArithmetic[1], str_tmp);
			
			break;
			
		case FIXP_INEXA_ARITHM:
			
			strcpy(ptDispC->FixpArithmetic[0], "      inexact arithmetic: adder [lookup-table]");
				
			if ( FixpInexLthType == LTH_EXACT )
			{
				sprintf(str_tmp, " -- comp [exact]");
			}
			else if ( FixpInexLthType == LTH_FROM_ADD )
			{
				sprintf(str_tmp, " -- comp [from adder]");
			}
			else if ( FixpInexLthType == LTH_INEXA )
			{
				sprintf(str_tmp, " -- comp [lookup table]", FixpProbLthPerr);
			}
			
			strcat(ptDispC->FixpArithmetic[0], str_tmp);
			break;
			
		default:
			break;
	}
	
	sprintf(ptDispC->NbInputs,    "%d",   CONFIG::NbInputs);
	sprintf(ptDispC->NbInternsF,  "%d",   NbInternsF);
	sprintf(ptDispC->NbOutputsF,  "%d",   CONFIG::NbOutputsF);
	sprintf(ptDispC->NbInternsP,  "%d",   NbInternsP);
	sprintf(ptDispC->NbOutputsP,  "%d",   CONFIG::NbOutputsP);
	
	sprintf(ptDispC->MaxIterNb,   "%d",   CONFIG::MaxIterNb);
	sprintf(ptDispC->VarNodesNb,  "%d",   VarNodesNb);
	sprintf(ptDispC->ChkNodesNb,  "%d",   ChkNodesNb);
	sprintf(ptDispC->AveVarDeg,   "%.2f", (double) EdgesNb/VarNodesNb);
	sprintf(ptDispC->AveChkDeg,   "%.2f", (double) EdgesNb/ChkNodesNb);
	if (CONFIG::StopCriterion == STOP_MAX_ITER) strcat(ptDispC->MaxIterNb, "*");
	
	if ( CONFIG::CriticThres[0] > 0 ) sprintf(ptDispC->CritThresF, "%d", NbCTnodesF);
	else sprintf(ptDispC->CritThresF, "N/A");
	
	if ( CONFIG::CriticThres[1] > 0 ) sprintf(ptDispC->CritThresP, "%d", NbCTnodesP);
	else sprintf(ptDispC->CritThresP, "N/A");
	
	if ( CONFIG::CodingRate < 0.1 )
	{
		sprintf(ptDispC->CodingRate, " %.4f", CONFIG::CodingRate);
	}
	else sprintf(ptDispC->CodingRate, " %.2f", CONFIG::CodingRate); 
	
	// ===============================
	// display configuration on stdout
	// ===============================
	printf("\n");
	printf("===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================|\n");
	printf(" Configuration file: %s%*s|\n", STRLEFT(ptDispC->ConfFile,    DISP_LINE_LEN - 21));
	printf("     LDPC-code file: %s%*s|\n", STRLEFT(ptDispC->LdpcFile,    DISP_LINE_LEN - 21));
	printf("       NETLIST file: %s%*s|\n", STRLEFT(ptDispC->NetlistFile, DISP_LINE_LEN - 21));
	printf("--------------------------------------------------------------------------------------------------------------------|\n");
    printf(" Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   |\n");
    printf("%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%6d :%*s%s%*s|%5d :%*s%s%*s|\n", \
	        STRCENTER(ptDispC->NbInputs,    11), \
			STRCENTER(ptDispC->NbInternsF,  14), \
		    STRCENTER(ptDispC->NbOutputsF,  14), \
			STRCENTER(ptDispC->NbInternsP,  14), \
		    STRCENTER(ptDispC->NbOutputsP,  14), \
			CONFIG::CriticThres[0], STRCENTER(ptDispC->CritThresF,  14), \
			CONFIG::CriticThres[1], STRCENTER(ptDispC->CritThresP,  14)  );
	printf("--------------------------------------------------------------------------------------------------------------------|\n");
	printf("   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter |\n");
	printf("%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|\n", \
			STRCENTER(ptDispC->LdpcType,       15), \
			STRCENTER(ptDispC->CodingRate,      8), \
			STRCENTER(ptDispC->VarNodesNb,     13), \
			STRCENTER(ptDispC->ChkNodesNb,     13), \
			STRCENTER(ptDispC->AveVarDeg,       9), \
			STRCENTER(ptDispC->AveChkDeg,       9), \
			STRCENTER(ptDispC->LdpcDecoding,   19), \
			STRCENTER(ptDispC->LdpcScheduling, 13), \
			STRCENTER(ptDispC->MaxIterNb,       9)  );
	printf("--------------------------------------------------------------------------------------------------------------------|\n");
	
	printf(" %s%*s|\n", STRLEFT(ptDispC->FixpDecoding, DISP_LINE_LEN-1));
	printf(" %s%*s|\n", STRLEFT(ptDispC->FixpInScale,  DISP_LINE_LEN-1));
	
	if ( strlen(ptDispC->FixpArithmetic[0]) > 0 )
	{
		printf(" %s%*s|\n", STRLEFT(ptDispC->FixpArithmetic[0], DISP_LINE_LEN-1));
	}
	if ( strlen(ptDispC->FixpArithmetic[1]) > 0 )
	{
		printf(" %s%*s|\n", STRLEFT(ptDispC->FixpArithmetic[1], DISP_LINE_LEN-1));
	}
	printf("--------------------------------------------------------------------------------------------------------------------|\n");
	printf("                                             Simulation results                                                     |\n");
	printf("--------------------------------------------------------------------------------------------------------------------|\n");
	printf("        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average |\n");
	printf("   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb |\n");
	printf("----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------|\n");
	
	// ================================
	// display configuration on resfile
	// ================================
	
	// ------------------------------------
    // open the stream for the results file
    // ------------------------------------
    if( (Res = fopen(CONFIG::ResultsFile, "w")) == NULL )
    {
		fprintf (stderr, "\n\n[ERROR: display_config] Can not open the results file "\
	                 	 "\"%s\" (write mode)!\n\n", CONFIG::ResultsFile);
		goto end;
    }
	
	fprintf(Res, "#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#\n");
	fprintf(Res, "# Configuration file: %s%*s#\n", STRLEFT(ptDispC->ConfFile,    DISP_LINE_LEN - 21));
	fprintf(Res, "#     LDPC-code file: %s%*s#\n", STRLEFT(ptDispC->LdpcFile,    DISP_LINE_LEN - 21));
	fprintf(Res, "#       NETLIST file: %s%*s#\n", STRLEFT(ptDispC->NetlistFile, DISP_LINE_LEN - 21));
	fprintf(Res, "#--------------------------------------------------------------------------------------------------------------------#\n");
    fprintf(Res, "# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #\n");
    fprintf(Res, "#%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%6d :%*s%s%*s|%5d :%*s%s%*s#\n", \
	        STRCENTER(ptDispC->NbInputs,    11), \
			STRCENTER(ptDispC->NbInternsF,  14), \
		    STRCENTER(ptDispC->NbOutputsF,  14), \
			STRCENTER(ptDispC->NbInternsP,  14), \
		    STRCENTER(ptDispC->NbOutputsP,  14), \
			CONFIG::CriticThres[0], STRCENTER(ptDispC->CritThresF,  14), \
			CONFIG::CriticThres[1], STRCENTER(ptDispC->CritThresP,  14)  );
	fprintf(Res, "#--------------------------------------------------------------------------------------------------------------------#\n");
	fprintf(Res, "#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #\n");
	fprintf(Res, "#%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s|%*s%s%*s#\n", \
			STRCENTER(ptDispC->LdpcType,       15), \
			STRCENTER(ptDispC->CodingRate,      8), \
			STRCENTER(ptDispC->VarNodesNb,     13), \
			STRCENTER(ptDispC->ChkNodesNb,     13), \
			STRCENTER(ptDispC->AveVarDeg,       9), \
			STRCENTER(ptDispC->AveChkDeg,       9), \
			STRCENTER(ptDispC->LdpcDecoding,   19), \
			STRCENTER(ptDispC->LdpcScheduling, 13), \
			STRCENTER(ptDispC->MaxIterNb,       9)  );
	fprintf(Res, "#--------------------------------------------------------------------------------------------------------------------#\n");
	
	fprintf(Res, "# %s%*s#\n", STRLEFT(ptDispC->FixpDecoding, DISP_LINE_LEN-1));
	fprintf(Res, "# %s%*s#\n", STRLEFT(ptDispC->FixpInScale,  DISP_LINE_LEN-1));
	
	if ( strlen(ptDispC->FixpArithmetic[0]) > 0 )
	{
		fprintf(Res, "# %s%*s#\n", STRLEFT(ptDispC->FixpArithmetic[0], DISP_LINE_LEN-1));
	}
	if ( strlen(ptDispC->FixpArithmetic[1]) > 0 )
	{
		fprintf(Res, "# %s%*s#\n", STRLEFT(ptDispC->FixpArithmetic[1], DISP_LINE_LEN-1));
	}
	fprintf(Res, "#--------------------------------------------------------------------------------------------------------------------#\n");
	fprintf(Res, "#                                             Simulation results                                                     #\n");
	fprintf(Res, "#--------------------------------------------------------------------------------------------------------------------#\n");
	fprintf(Res, "#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #\n");
	fprintf(Res, "#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #\n");
	fprintf(Res, "#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#\n");
	
	// --------------------------
	// successful confing display
	// --------------------------
	ErrorFlag = NO_ERROR;
	
end:

    if (Res     != 0) {fclose(Res); Res = 0; }
	if (ptDispC != 0) {FreePointer(ptDispC); ptDispC = 0;}
	
	return ErrorFlag;
}

// **************************************************************************************
//                     EXPORT_DISP_CONFIG_PARAM FUNCTION
// **************************************************************************************
void export_disp_config_param(const char *paramname, int paramvalue)
{
	
	if ( strcmp(paramname, "ldpc_type") == 0 )
	{
		LdpcType = paramvalue;
	}
	else if ( strcmp(paramname, "var_nodes_nb") == 0 )
	{
		VarNodesNb = paramvalue;
	}
	else if ( strcmp(paramname, "chk_nodes_nb") == 0 )
	{
		ChkNodesNb = paramvalue;
	}
	else if ( strcmp(paramname, "qc_factor") == 0 )
	{
		QCfactor = paramvalue;
	}
	else if ( strcmp(paramname, "edges_nb") == 0 )
	{
		EdgesNb = paramvalue;
	}
	else if ( strcmp(paramname, "fixp_arithmetic_type") == 0 )
	{
		FixpArithmType = paramvalue;	
	}
	else if ( strcmp(paramname, "fixp_inexa_lth_type") == 0 )
	{
		FixpInexLthType = paramvalue;
	}
	else if ( strcmp(paramname, "fixp_proba_add_type") == 0 )
	{
		FixpProbAddType = paramvalue;
	}
	else if ( strcmp(paramname, "fixp_proba_add_depth") == 0 )
	{
		FixpProbAddDepth = paramvalue;
	}
	else if ( strcmp(paramname, "fixp_proba_lth_type") == 0 )
	{
		FixpProbLthType = paramvalue;
	}
	else if ( strcmp(paramname, "fixp_proba_xor_type") == 0 )
	{
		FixpProbXorType = paramvalue;
	}
	else if ( strcmp(paramname, "nb_intern_nodes") == 0 )
	{
		if (NbInternsF < 0) NbInternsF = paramvalue;
		else NbInternsP = paramvalue;
	}
	else if ( strcmp(paramname, "nb_critic_nodes") == 0 )
	{
		if (NbCTnodesF < 0) NbCTnodesF = paramvalue;
		else NbCTnodesP = paramvalue;
	}
}

// **************************************************************************************
//                     EXPORT_DISP_CONFIG_PARAM FUNCTION
// **************************************************************************************
void export_disp_config_param(const char *paramname, double paramvalue)
{
	if ( strcmp(paramname, "fixp_proba_add_perr") == 0 )
	{
		FixpProbAddPerr = paramvalue;
	}
	else if ( strcmp(paramname, "fixp_proba_lth_perr") == 0 )
	{
		FixpProbLthPerr = paramvalue;
	}
	else if ( strcmp(paramname, "fixp_proba_xor_perr") == 0 )
	{
		FixpProbXorPerr = paramvalue;
	}
}

	

