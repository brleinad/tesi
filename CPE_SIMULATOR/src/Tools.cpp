/* ######################################################################################################################
## Organization         : CEA/LETI
##                      :
## File name            : Tools.cpp
## Language             : C++
## Short description    : tool functions
##                      : double RandU(void);       // generates uniform distributed variables in ]0, 1[ 
##                      : double RandN(void);       // generates gaussian distributed unitary variables with zero mean 
##                      : void sort_array(double *ptArray, int ArrayNum, int order); // sorts array in specified order
##                      : void rand_perm(int *ptPerm, int Len);                      // generates random permutation
##                      :
## History              : 09/10/2012 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
## ###################################################################################################################### */
#include "../include/Tools.h"

// #########################################################
// Function name: RandU
// Description : generates random uniform variables in [0,1[
// Extracted from Numerical Receipes in C language page 280
// #########################################################

double RandU(void)
{
    static long iy   = 0;
	static long Seed = RAND_SEED;
    static long iv[32];
	
    int    j;
    long   k;
    double temp;
    
    // ==============
    // Initialization 
    // ==============

    if ( ( Seed <= 0 ) || ( iy == 0 ) )
    {
        if ( -(Seed) < 1)
        {
            Seed = 1;          // Be sure to prevent Seed=0 
        }
        else
        {
            Seed = -(Seed);
        }

        for ( j = 32 + 7 ; j >= 0 ; j-- )
        {
            // ----------------------------------------
	    	// Load the shuffle table (after 8 warm-up)
	    	// ---------------------------------------- 

            k     = Seed / 127773;
            Seed = 16807 * ( Seed - k * 127773 ) - 2836 * k;

            if ( Seed < 0 )
            {
                Seed += 2147483647;
            }

            if ( j < 32 )
            {
                iv[j] = Seed;
            }

        }   /* end of 'for ( j = 32 + 7 ; j >= 0 ; j-- )' loop */

        iy = iv[0];
    }

    // ================================
    // Start here when not initializing 
    // ================================

    k = (Seed) / 127773;

    // ------------------------------------------------------------------------------
    // Compute Seed=(16807 * Seed) % 2147483647 without overflows by Schrage's method 
    // ------------------------------------------------------------------------------

    Seed = 16807 * ( Seed - k * 127773 ) - 2836 * k;

    if ( Seed < 0 )
    {
        Seed += 2147483647;
    }

    // ---------------------------------
    // Index will be in the range [0-31]
    // --------------------------------- 

    j = iy / ( 1 + ( 2147483647 - 1 ) / 32 );

    // -----------------------------------------------------------
    // Output previously stored value and refill the shuffle table 
    // -----------------------------------------------------------

    iy    = iv[j];
    iv[j] = Seed;

    if ( ( temp = ( 1.0 / 2147483647 ) * iy ) > ( 1.0 - 1.2e-7 ) )
    {
        return (double) ( 1.0 - 1.2e-7 );    // because users don't expect endpoint value 
    }
    else
    {
        return temp;
    }

}   // end of 'RandU' function

// ######################################################################################
// Function name: RandGaussVar
// Description : generates random centered unitary Gaussian variables (mean = 0, std = 1)
// ######################################################################################
double RandN(void)
{
	double X, Y;
	double UnitGaussVar;
	// --------------------------------------------
    // Computes 2 uniform random variables on ]0,1] 
    // -------------------------------------------- 

    X = 1.0 - RandU();
    Y = 1.0 - RandU();
	    
	// -----------------------------------------
	// computes random unitary gaussian variable 
	// -----------------------------------------

    UnitGaussVar = sqrt(-2.0 * log(X)) * cos(2.0 * PI_LETI * Y);
	
	// ---------------------------------------------------------------
	// return gaussian variable with given mean and standard deviation
	// ---------------------------------------------------------------
	
	return UnitGaussVar;

}

// #############################################################################################
// Function name:sort_array(double *ptArray, int ArrayNum, int order)
// Description  : sort 'ptArray' vector (increasing if 'order' = +1, decreasing if 'order' = +1) 
// #############################################################################################
void sort_array(double *ptArray, int ArrayNum, int order)
{
	int I, J, K;
	double Param;
	
	switch (order)
	{
	case 1: // increasing
		
		I = 0;
		while ( I < ArrayNum )
		{
			Param = ptArray[I];
			for ( J = 0 ; J < I ; J++ )
			{
				if ( Param < ptArray[J] ) break;
			}
			for ( K = I ; K > J ; K-- )
			{
				ptArray[K] = ptArray[K-1];
			}
			ptArray[J] = Param;
			I++;
		}
	
		break;
		
	case -1: // decreasing
		
		I = 0;
		while ( I < ArrayNum )
		{
			Param = ptArray[I];
			for ( J = 0 ; J < I ; J++ )
			{
				if ( Param > ptArray[J] ) break;
			}
			for ( K = I ; K > J ; K-- )
			{
				ptArray[K] = ptArray[K-1];
			}
			ptArray[J] = Param;
			I++;
		}
		
		break;
		
	default:
		break;
	}	

}




