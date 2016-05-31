#include "../include/Tools_Str.h"

// #####################################################
   static int  strtls_errnumber = 0;
   static char strtls_errmessage[STR_LEN] = "";
// #####################################################

// #######################################################################################################################################
   int str2int_list(int &intkey, char *endkey, const char *strkey, const int sizelist, const int intlist[], const char strlist[][STR_LEN])
// #######################################################################################################################################
{
	/* ---------------------------------------------------------------------------------------------
	 * arguments: int  &intkey   - integer value that is determined by the function 
	 *            char *endkey   - residue (end) of the 'strkey' keyword
	 *            char *strkey   - keyword (string value)
	 *            int  sizelist  - number of strings in 'strlist' = number of integers in 'intlist'
	 *            char strlist[][STR_LEN] - list of 'sizelist' strings 
	 *            int  intlist[] - list of 'sizelist' integer values
	 * output   : error_flag
	 * description: if the beginning of the 'strkey' keyword matches one of the strings in 'strlist', 
	 * the 'intkey' value  is set to the corresponding integer value in 'intlist', and  the 'endkey' 
	 * string is equel to the residual (remaining) part of the 'strkey' keyword;  in this case, the 
	 * output value 'error_flag' is set to 0 (NO_ERROR). 
	 * otherwise, the 'endkey' string is equal to the 'strkey' keyword,  and the 'error_flag' value
	 * is set to 1 (IN_ERROR)
	 * --------------------------------------------------------------------------------------------- */
	char err_message[STR_LEN];
		
	for ( int indx = 0 ; indx < sizelist ; indx++ )
	{
		if ( strncmp(strkey, strlist[indx], strlen(strlist[indx])) == 0 )
		{
			intkey = intlist[indx];
			strcpy(endkey, &strkey[strlen(strlist[indx])]);
				
			strtls_error(NO_ERROR, "");
			return NO_ERROR;
		}
	}
	
	intkey = -1;
	strcpy(endkey, strkey);
	
	sprintf(err_message, "string value (\"%s\") not in the list!", strkey);
	strtls_error(_ST_KEY_NOT_IN_LIST, err_message);
	return IN_ERROR;
}

// #########################################################################################################################
   int str2int_list(int &intkey, const char *strkey, const int sizelist, const int intlist[], const char strlist[][STR_LEN])
// #########################################################################################################################
{
	/* ---------------------------------------------------------------------------------------------
	 * arguments: int  &intkey   - integer value that is determined by the function 
	 *            char *strkey   - keyword (string value)
	 *            int  sizelist  - number of strings in 'strlist' = number of integers in 'intlist'
	 *            char strlist[][STR_LEN] - list of 'sizelist' strings 
	 *            int  intlist[] - list of 'sizelist' integer values
	 * output   : error_flag
	 * description: if the 'strkey' keyword  matches one of the strings in  'strlist', the 'intkey' 
	 * value is set to the corresponding integer value in 'intlist'. in this case, the output value
	 * 'error_flag' is set to 0 (NO_ERROR). 
	 * otherwise, the 'error_flag' value is set to 1 (IN_ERROR)
	 * --------------------------------------------------------------------------------------------- */
	char err_message[STR_LEN];
		
	for ( int indx = 0 ; indx < sizelist ; indx++ )
	{
		if ( strcmp(strkey, strlist[indx]) == 0 )
		{
			intkey = intlist[indx];
			
			strtls_error(NO_ERROR, "");
			return NO_ERROR;
		}
	}
	
	intkey = -1;
	
	sprintf(err_message, "string value (\"%s\") not in the list!", strkey);
	strtls_error(_ST_KEY_NOT_IN_LIST, err_message);
	return IN_ERROR;
}

// ########################################################################################################################
   int int2str_list(const int intkey, char *strkey, const int sizelist, const int intlist[], const char strlist[][STR_LEN])
// ########################################################################################################################
{
	/* ---------------------------------------------------------------------------------------------
	 * arguments: int  &intkey   - integer value  
	 *            char *strkey   - keyword (string value) that is determined by the function
	 *            int  sizelist  - number of strings in 'strlist' = number of integers in 'intlist'
	 *            char strlist[][STR_LEN] - list of 'sizelist' strings 
	 *            int  intlist[] - list of 'sizelist' integer values
	 * output   : error_flag
	 * description: if the 'intkey' value  matches one of the integers in  'intlist', the 'strkey' 
	 * string is set to the corresponding value in 'strlist'. in this case, the output value
	 * 'error_flag' is set to 0 (NO_ERROR). 
	 * otherwise, the 'error_flag' value is set to 1 (IN_ERROR)
	 * --------------------------------------------------------------------------------------------- */
	char err_message[STR_LEN];
		
	for ( int indx = 0 ; indx < sizelist ; indx++ )
	{
		if ( intkey == intlist[indx] )
		{
			strcpy(strkey, strlist[indx]);
			
			strtls_error(NO_ERROR, "");
			return NO_ERROR;
		}
	}
	
	strcpy(strkey, "");
	
	sprintf(err_message, "integer value (%d) not in the list!", intkey);
	strtls_error(_ST_KEY_NOT_IN_LIST, err_message);
	return IN_ERROR;
}

// ###############################
   void str2lowercase( char *str )
// ###############################
{
	/* ------------------------------------------------
	 * convert string pointed to by 'str' to lower case 
	 * ------------------------------------------------ */
	
	int i, len;
	len = strlen(str);
	
	for ( i = 0 ; i < len ; i++ )
	{
		str[i] = tolower(str[i]);
	}
}

// ##################################################
   void str2lowercase( char *str1, const char *str2 )
// ##################################################
{
	/* ------------------------------------------------
	 * convert string pointed to by 'str' to lower case 
	 * ------------------------------------------------ */
	
	int i, len;
	len = strlen(str2);
	
	for ( i = 0 ; i < len ; i++ )
	{
		str1[i] = tolower(str2[i]);
	}
}

// ###############################
   void str2uppercase( char *str )
// ###############################
{
	/* ------------------------------------------------
	 * convert string pointed to by 'str' to upper case 
	 * ------------------------------------------------ */
	int i, len;
	len = strlen(str);
			
	for ( i = 0 ; i < len ; i++ )
	{
		str[i] = toupper(str[i]);
	}
}

// ##################################################
   void str2uppercase( char *str1, const char *str2 )
// ##################################################
{
	/* ------------------------------------------------
	 * convert string pointed to by 'str' to upper case 
	 * ------------------------------------------------ */
	int i, len;
	len = strlen(str2);
			
	for ( i = 0 ; i < len ; i++ )
	{
		str1[i] = toupper(str2[i]);
	}
}

// #################################################
   int find_keyword(FILE *File, const char* keyname)
// #################################################
{
	/* ----------------------------------------------------------------------------------
	 * locate keyword pointed to by the 'keyname' string in the file pointed to by 'File'  
	 * output : 
	 * NO_ERROR : keyword find in file
	 * IN_ERROR : keyword not find in file (in this case, the strtls_errno() 
	 *          : and strtls_errmsg() are set tocorresponding values) 
	 * ---------------------------------------------------------------------------------- */
	
	char   arg[STR_LEN]; // used to read from the config file 
	char   Chtmp;        // temporary character
	
	// ----------------------------------------
	// init str tools (strtls) errno and errmsg
	// ----------------------------------------
	strtls_error(NO_ERROR, "");
	
	// --------------------------
	// rewind then read from file
	// --------------------------
			
	rewind(File);
	
	while ( fscanf(File,"%s", arg) != EOF )
    {
		if ( (strcmp(arg, "END_CONFIGURATION") == 0) || (strcmp(arg, "end_configuration") == 0) )
        {
            break;
        }
		
		else if ( strncmp(arg, "&", 1) == 0 )
		{
			//skip the current line
			while ( fscanf( File,"%c", &Chtmp ) != EOF )
			{ 
				if ( (Chtmp == '\n') || (Chtmp == '\r') ) break;
			}
			continue;
		}
        
        else if ( strcmp(arg, keyname) == 0 )
        {
			return NO_ERROR;
        }
	}
	
	sprintf(arg, "keyword \"%s\" not in file!", keyname);
	strtls_error(_ST_KEY_NOT_IN_FILE, arg);
	return IN_ERROR;

}

// ###############################################################
   int find_keyword(FILE *File, const char* keyname, char *endkey)
// ###############################################################
{
	/* ----------------------------------------------------------------------------------
	 * locate keyword pointed to by the 'keyname' string in the file pointed to by 'File'  
	 * output : 
	 * NO_ERROR : keyword find in file
	 * IN_ERROR : keyword not find in file (in this case, the strtls_errno() 
	 *          : and strtls_errmsg() are set tocorresponding values) 
	 * ---------------------------------------------------------------------------------- */
	
	char   arg[STR_LEN]; // used to read from the config file 
	char   Chtmp;        // temporary character
	int    keylen;       // length of the 'keyname' string
	
	keylen    = strlen(keyname);
	
	// ----------------------------------------
	// init str tools (strtls) errno and errmsg
	// ----------------------------------------
	strtls_error(NO_ERROR, "");
	
	// --------------------------
	// rewind then read from file
	// --------------------------
			
	rewind(File);
	
	while ( fscanf(File,"%s", arg) != EOF )
    {
		if ( (strcmp(arg, "END_CONFIGURATION") == 0) || (strcmp(arg, "end_configuration") == 0) )
        {
            break;
        }
		
		else if ( strncmp(arg, "&", 1) == 0 )
		{
			//skip the current line
			while ( fscanf( File,"%c", &Chtmp ) != EOF )
			{ 
				if ( (Chtmp == '\n') || (Chtmp == '\r') ) break;
			}
			continue;
		}
        
        else if ( strncmp(arg, keyname, keylen) == 0 )
        {
			strcpy(endkey, arg+keylen);
			return NO_ERROR;
        }
	}
	
	sprintf(arg, "keyword \"%s\" not in file!", keyname);
	strtls_error(_ST_KEY_NOT_IN_FILE, arg);
	
	endkey[0] = '\0';
	return IN_ERROR;

}


// ######################
   int strtls_errno(void)
// ######################
{
	return strtls_errnumber;
} 

// ########################
   void strtls_errmsg(void)
// ########################
{
	fprintf(stderr, "\n\n%s\n", strtls_errmessage);
	switch ( strtls_errnumber )
	{
	case NO_ERROR:
		fprintf(stderr, "[errno %d: no error detected!]\n\n", strtls_errnumber);
		break;
		
	case IN_ERROR:
		fprintf(stderr, "[errno %d: error detected (without specific ID)!]\n\n", strtls_errnumber);
		break;
		
	case _ST_KEY_NOT_IN_FILE:
		fprintf(stderr, "[errno %d: specified keyword was not found in file!]\n\n", strtls_errnumber);
		break;
		
	case _ST_WRONG_ARG_FORMAT:
		fprintf(stderr, "[errno %d: wrong format for input argument (string/keyword)!]\n\n", strtls_errnumber);
		break;
		
	case _ST_WRONG_ARG_TYPE:
		fprintf(stderr, "[errno %d: unsupported type for input argument(s)!]\n\n", strtls_errnumber);
		break;
	
	case _ST_KEY_LACKS_VALUES:
		fprintf(stderr, "[errno %d: missing value(s) for specified keyword!]\n\n", strtls_errnumber);
		break;
		
	case _ST_KEY_OUT_OF_BNDS:
		fprintf(stderr, "[errno %d: keyword's value(s) out of specified bounds!]\n\n", strtls_errnumber);
		break;
		
	case _ST_KEY_NOT_IN_LIST:
		fprintf(stderr, "[errno %d: keyword's value(s) not in the specified list of values!]\n\n", strtls_errnumber);
		break;
		
	case _ST_KEYNUM_EXCEEDED:
		fprintf(stderr, "[errno %d: keyword/string contains too many numeric values!]\n\n", strtls_errnumber);
		break;
		
	default:
		fprintf(stderr, "[errno %d: unknown error ID!]\n\n", strtls_errnumber);
		break;
	}
	
	return;
}

// ########################################################################
   void strtls_seterr(int errflag, char const *functid, char const *errmsg)
// ########################################################################
{
	strtls_errnumber = errflag;
	sprintf(strtls_errmessage, "[ERROR: %s] %s", functid, errmsg);
	return;
}




