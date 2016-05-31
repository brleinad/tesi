/* ##############################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : FIXP.h (header of FIXP.cpp) file
## Language             : C++
## Short description    : implements fix-point arithmetic 
##                      : [exact arithmetic, inexact arithmetic, and probabilistic arithmetic]
##                      :
## History              : 09/10/2012 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ############################################################################################## */

#ifndef _FIXP_H_
#define _FIXP_H_

#include "Tools.h"
#include "Config.h"
#include "DispConfig.h"

#define FIXP_UNDEF_ARITHM   -1  // fix-point arithmetic -- undefined!
#define FIXP_EXACT_ARITHM    1  // fix-point exact arithmetic
#define FIXP_INEXA_ARITHM    2  // fix-point inexact arithmetic
#define FIXP_PROBA_ARITHM    3  // fix-point probabilistic arithmetic

#define LTH_UNDEF       -1      // LTH (less than) comparator type: undefined
#define LTH_EXACT        1      // LTH (less than) comparator type: exact
#define LTH_INEXA        2      // LTH (less than) comparator type: inexact
#define LTH_PROBA        3      // LTH (less than) comparator type: probabilistic
#define LTH_FROM_ADD     4      // LTH (less than) comparator type: from adder
#define ADD_UNDEF       -1      // ADDER type: undefined
#define ADD_EXACT        1      // ADDER type: exact
#define ADD_PROBA        3      // ADDER type: probabilistic
#define XOR_UNDEF       -1      // XOR type: undefined
#define XOR_EXACT        1      // XOR type: exact
#define XOR_PROBA        3      // XOR type: probabilistic
#define SCU_EXACT        1      // SCU type: exact
#define SCU_PROBA        3      // SCU type: probabilistic


// ========================
// FIXP DECLARATION SECTION
// ========================

class FIXP;
typedef int(FIXP::*pt2func_1arg)(int);
typedef int(FIXP::*pt2func_2arg)(int, int);
typedef int(FIXP::*pt2func_3arg)(int, int, int);

class FIXP 
{
public:
	 FIXP();  // constructor
    ~FIXP();  // destructor
	
	// ----------------
	// class activation 
	// ----------------
	int  Activate(); 
	
	// ----------------------------
	// arithmetic function pointers
	// ----------------------------
	pt2func_1arg get_fixp_sgn(void);
	pt2func_1arg get_fixp_abs(void);
	pt2func_1arg get_fixp_sat(void);
	pt2func_2arg get_fixp_add(void);
	pt2func_2arg get_fixp_lth(void);
	pt2func_2arg get_fixp_xor(void);
	pt2func_3arg get_fixp_scu(void);
	
private:
	// ----------------------------------------------------
    // DECLARATION OF THE DEC_FIXP_LDPC_BIN PRIVATE METHODS
    // ----------------------------------------------------
	void Reset();         // reset ressources
	void Free();          // resources release
	void GetParam();      // get the configuration parameter values
    int  ReadFixpFile();  // read fix-point type file  
	int  ReadFixpStr();   // read fix-point type string
	int  Init();          // initialization
	
	// ------------------------------------------------------------------------
	// config parameters: these parameters must be set before class activation!
	// ------------------------------------------------------------------------
	int    FixpSizeExt;   // size (in bits) of the extrinsic LLRs (exchanged messages)
	int    FixpSizeOut;   // size (in bits) of the output a-posteriori LLRs
	char   FixpArthFile[STR_LEN]; // fixed-point arithmetic file
	
	// ----------------------------------------------
	// parameters needed by the implemented functions
	// ----------------------------------------------
	int  MinFixpExt;  // minimum value for extrinsic LLRs (exchanged messages)
	int  MaxFixpExt;  // maximum value for extrinsic LLRs (exchanged messages)
	int  MinFixpOut;  // minimum value for output a-posteriori LLRs
	int  MaxFixpOut;  // maximum value for output a-posteriori LLRs
	int  FixpArithmType; // fix-point arithmetic type: exact, inexact, probabilistic
	
	// ------------------------------------
	// Lookup Tables for inexact arithmetic
	// ------------------------------------
	int **ptLutInexAdd;  // inexact-adder Lookup Table
	int **ptLutInexLth;  // inexact-LTH (less than) comparator Lookup Table
	int FixpInexLthType; // LTH (less than) comparator type: exact, inexact, from adder
	
	// --------------------------------------------
	// parameters used for probabilistic arithmetic
	// --------------------------------------------
	int    FixpProbAddType;   // ADDER type: exact or probabilistic
	int    FixpProbAddDepth;  // depth: number of bits (starting with LSB) that can be in error
	double FixpProbAddPerr;   // error probability 
	int    FixpProbLthType;   // LTH (less than) comparator type: exact, probabilistic, from adder
	double FixpProbLthPerr;   // error probability of the LTH (less than) comparator
	int    FixpProbXorType;   // XOR type: exact or probabilistic
	double FixpProbXorPerr;   // error probability of the XOR gate
	int    FixpProbScuType;   // Self-Correction Unit (SCU) type: exact or probabilistic
	double FixpProbScuPerr;   // error probability of the Self-Correction Unit (SCU)
	int    MaxAddError;       // determined acording to 'FixpProbAddDepth' and 'FixpSizeOut'
	
	// ============================
	// arithmetic-function pointers
	// ============================
	int (FIXP::*fixp_sgn)(int);      // sign of integer value
	int (FIXP::*fixp_abs)(int);      // absolute value of integer
	int (FIXP::*fixp_sat)(int);      // saturate integer's value between [MinFixpExt,  MaxFixpExt]
	int (FIXP::*fixp_add)(int, int); // addition;  result is within [MinFixpOut, MaxFixpOut]
	int (FIXP::*fixp_lth)(int, int); // less than; 1 iff first argument is less than the second
	int (FIXP::*fixp_xor)(int, int); // xor; bitxor of input arguments (input arguments must be 0 or 1)
	int (FIXP::*fixp_scu)(int, int, int); // self-correction unit (all input arguments must be 0 or 1)
	
	// ==========================
	// exact arithmetic functions
	// ==========================
	int fixp_exact_sgn(int x) 
	{ 
		return ((x) >= 0 ? 0 : 1); 
	}
	int fixp_exact_abs(int x) 
	{ 
		return ((x) >= 0 ? (x) : (-x)); 
	}
	int fixp_exact_sat(int x)
	{
		if      ( x > MaxFixpExt ) return MaxFixpExt;
		else if ( x < MinFixpExt ) return MinFixpExt;
		else return x;
	}
	int fixp_exact_add(int x, int y)
	{ 
		int s = x+y; 
		if      (s < MinFixpOut) s = MinFixpOut;
		else if (s > MaxFixpOut) s = MaxFixpOut;
		return s;
	}
	int fixp_exact_lth(int x, int y)
	{
		if ( x < y ) return 1;
		else return 0;
	}
	int fixp_exact_xor(int x, int y)
	{
		return x^y;
	}
	int fixp_exact_scu(int x, int y, int e)
	{
		// if ((x != y) && (e == 0)) => return 1
		// if ((x == y) || (e == 1)) => return 0
		
		return (x^y) & (1^e);
	}
	
	// ============================
	// inexact arithmetic functions
	// ============================
	int fixp_inexa_add(int x, int y)
	{ 
		return ptLutInexAdd[x-MinFixpOut][y-MinFixpOut];
	}
	int fixp_inexa_lth(int x, int y)
	{
		return ptLutInexLth[x-MinFixpExt][y-MinFixpExt];
	}
	int fixp_inexa_lth_from_add(int x, int y)
	{
		int tmp = fixp_inexa_add(x, -y);
				
		if ( tmp < 0 ) return 1; // x <  y
		else return 0;           // x >= y
	}
	
	// ==================================
	// probabilistic arithmetic functions
	// ==================================
	int fixp_proba_add_full_depth(int x, int y)
	{ 
		int error, sum, err_sum;
		
		sum = x+y; 
		if      (sum < MinFixpOut) sum = MinFixpOut;
		else if (sum > MaxFixpOut) sum = MaxFixpOut;
		
		if ( RandU() < FixpProbAddPerr )
		{
			error = MinFixpOut + (rand() % (MaxFixpOut-MinFixpOut+1));
			if ( (err_sum = sum^error) < MinFixpOut ) err_sum = error;
		}
		else err_sum = sum;
		
		return err_sum;
	}
	
	int fixp_proba_add_part_depth(int x, int y)
	{ 
		int error, sum, err_sum;

		sum = x+y; 
		if      (sum < MinFixpOut) sum = MinFixpOut;
		else if (sum > MaxFixpOut) sum = MaxFixpOut;
		
		if ( RandU() < FixpProbAddPerr )
		{
			error = 1 + (rand() % MaxAddError);
			if (sum == 0) err_sum = (1 - 2*(rand()%2))*error; 
			else if ( (err_sum = sum^error) < MinFixpOut ) err_sum = 0;
		}
		else err_sum = sum;
		
		return err_sum;
	}
	
	int fixp_proba_lth(int x, int y)
	{
		int error, lessthan;
		
		if ( x < y ) 
		{
			 lessthan = 1;
		}
		else lessthan = 0;
		
		if ( RandU() < FixpProbLthPerr ) 
		{
			 error = 1;
		}
		else error = 0;
		
		return lessthan^error;
	}
	
	int fixp_proba_lth_from_add(int x, int y)
	{
		int tmp = (*this.*fixp_add)(x, -y);
		
		if ( tmp < 0 ) return 1; // x <  y
		else return 0;           // x >= y
	}	
	
	int fixp_proba_xor(int x, int y)
	{
		if ( RandU() < FixpProbXorPerr ) 
		{
			 return (x ^ y) ^ 1;
		}
		else
		{
			return x ^ y;
		}
	}
	
	int fixp_proba_scu(int x, int y, int e)
	{
		int exact_scu; 
		exact_scu = (x^y) & (1^e);
		
		if ( RandU() < FixpProbScuPerr ) 
		{
			 return exact_scu ^ 1;
		}
		else
		{
			return exact_scu;
		}
	}
	
};




#endif

