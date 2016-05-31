#ifndef _TOOLS_MEM_H_
#define _TOOLS_MEM_H_

/* ###########################################################################################################################
##
## Organization         : CEA/LETI
##                      :
## File name            : Tools.n
## Language             : C++
## Short description    : this file defines the following templates:
##                      : memory allocation (return 0 if successful allocation, 1 if not):
##                      :     template<class T> int AllocPointer(T * &ptPointer, char *PointerName) 
##                      :     template<class T> int AllocArray(T * &ptArray, char *ArrayName, int Idim)
##                      :     template<class T> int AllocMatrix(T ** &ptMatrix, char *MatrixName, int Idim, int Jdim)
##                      :     template<class T> int AllocMatrix3D(T *** &ptMatrix, char *MatrixName, int Idim, int Jdim, int Kdim)
##                      :
##                      : verification of the memory allocation (returns 0 if successful allocation, 1 if not):
##                      :     template<class T> int AllocVerify(T ptPointer, char *PointerName)
##                      :
##                      : memory deallocation
##                      :     template<class T> void FreePointer(T &ptPointer)
##                      :     template<class T> void FreeArray(T &ptArray)
##                      :     template<class T> void FreeMatrix(T &ptMatrix)
##                      :     template<class T> void FreeMatrix3D(T &ptMatrix)
##                      :
## History              : 24/10/07 created by Valentin SAVIN (CEA)
##                      :
## COPYRIGHT            : CEA
##
## ######################################################################################################################## */

#include <stdio.h>      // fprintf
#include <new>          // std::nothrow
#include <cerrno>       // errno

#define _MEM_IREF   0   // to acces the first element of the first dimension of the matrix
#define _MEM_JREF   0   // to acces the first element of the second dimension of the matrix

#ifndef IN_ERROR
#define IN_ERROR  1
#endif

#ifndef NO_ERROR
#define NO_ERROR  0
#endif

// ===========================
// memory allocation templates
// ===========================

// -----------------
// memory allocation
// -----------------
template<class T> int AllocPointer(T * &ptPointer, const char *PointerName)
{
    int LocalErrorFlag = IN_ERROR;
    
    // -----------------------------------
    // Initialization of the pointer value
    // -----------------------------------
    ptPointer = 0;
    
    // -----------------
    // memory allocation
    // -----------------
    ptPointer = new (nothrow) T;

    if ( ptPointer == 0 )
    {
		fprintf(stderr, "\n[Error] Memory allocation failure for \"%s\" pointer in \"AllocPointer\" function\n"
	                	"[errno = %d]\n\n", PointerName, errno);
		goto end;
    }
    
    // ----------------------------
    // successful memory allocation
    // ----------------------------
    LocalErrorFlag = NO_ERROR;

end:

    return LocalErrorFlag;
}

// -----------------------
// array memory allocation
// -----------------------
template<class T> int AllocArray(T * &ptArray, const char *ArrayName, int Idim)
{
    int LocalErrorFlag = IN_ERROR;
    
    // -----------------------------------
    // Initialization of the pointer value
    // -----------------------------------
    ptArray = 0;
    
    // -----------------
    // memory allocation
    // -----------------
    ptArray = new (nothrow) T[Idim];

    if ( ptArray == 0 )
    {
		fprintf(stderr, "\n[Error] Memory allocation failure for \"%s\" pointer in \"AllocArray\" function\n"
	                	"[errno = %d]\n\n", ArrayName, errno);
		goto end;
    }
    
    // ----------------------------
    // successful memory allocation
    // ----------------------------
    LocalErrorFlag = NO_ERROR;

end:

    return LocalErrorFlag;
}

// ------------------------
// matrix memory allocation
// ------------------------
template<class T> int AllocMatrix(T ** &ptMatrix, const char *MatrixName, int Idim, int Jdim)
{
    int RowCounter;   // counter over the rows
    int LocalErrorFlag = IN_ERROR;
 
    // ----------------------------------
    // Initialization of the matrix value
    // ----------------------------------
    ptMatrix = 0;

    // -------------------------
    // Allocate pointers to rows
    // -------------------------
    ptMatrix = new (nothrow) T*[Idim];

    if ( ptMatrix == 0 )
    {
        fprintf(stderr, "\n[Error] Memory allocation failure for \"%s\" pointer in \"AllocMatrix\" function\n"
                        "[error on allocation of pointers to rows - errno = %d]\n\n", MatrixName, errno);
        goto end;
    }

    // -------------
    // Allocate rows
    // -------------
    ptMatrix[_MEM_IREF] = new (nothrow) T[Idim * Jdim];

    if ( ptMatrix[_MEM_IREF] == 0 )
    {
        fprintf(stderr, "\n[Error] Memory allocation failure for \"%s\" pointer in \"AllocMatrix\" function\n"
                        "[error on allocation of rows - errno = %d]\n\n", MatrixName, errno);
        goto end;
    }

    // -------------------------------
    // Initialize the pointers to rows
    // -------------------------------
    for ( RowCounter = _MEM_IREF + 1 ; RowCounter < Idim ; RowCounter++ )
    {
        ptMatrix[RowCounter] = ptMatrix[RowCounter - 1] + Jdim;
    }

    // ----------------------------
    // successful memory allocation
    // ----------------------------
    LocalErrorFlag = NO_ERROR;

end:

    // --------------------------------------------------------------------------------------
    // If the array of pointers to rows has been allocated and the array of rows has not been
    // allocated, free the memory used by the array of pointers
    // --------------------------------------------------------------------------------------

    if ( ( ptMatrix != 0 ) && ( ptMatrix[_MEM_IREF] == 0 ) )
    {
        delete[] ptMatrix;
        ptMatrix = 0;
    }

    return LocalErrorFlag;
}

// ---------------------------------------------------------------------------------
// memory allocation for "irregular" matrix: matrix with rows of variable dimensions
//   Idim = number of rows
// ptJdim = array of length Idim, specifying the length of each row
// ---------------------------------------------------------------------------------
template<class T> int AllocMatrix(T ** &ptMatrix, const char *MatrixName, int Idim, int *ptJdim)
{
    int RowCounter;   // counter over the rows
	int NbElements;   // number of elements of the matrix = sum_{row} ptJdim[row]
    int LocalErrorFlag = IN_ERROR;
 
    // ----------------------------------
    // Initialization of the matrix value
    // ----------------------------------
    ptMatrix = 0;

    // -------------------------
    // Allocate pointers to rows
    // -------------------------
    ptMatrix = new (nothrow) T*[Idim];

    if ( ptMatrix == 0 )
    {
        fprintf(stderr, "\n[Error] Memory allocation failure for \"%s\" pointer in \"AllocIrregMatrix\" function\n"
                        "[error on allocation of pointers to rows - errno = %d]\n\n", MatrixName, errno);
        goto end;
    }

    // -------------
    // Allocate rows
    // -------------
	// compute the total number of elements of the matrix
	NbElements = 0;
	for ( RowCounter = 0 ; RowCounter < Idim ; RowCounter++ )
	{
		NbElements += ptJdim[RowCounter];
	}
	
	// alloc memory for all the elements of the matrix
    ptMatrix[_MEM_IREF] = new (nothrow) T[NbElements];

    if ( ptMatrix[_MEM_IREF] == 0 )
    {
        fprintf(stderr, "\n[Error] Memory allocation failure for \"%s\" pointer in \"AllocIrregMatrix\" function\n"
                        "[error on allocation of rows - errno = %d]\n\n", MatrixName, errno);
        goto end;
    }

    // -------------------------------
    // Initialize the pointers to rows
    // -------------------------------
    for ( RowCounter = _MEM_IREF + 1 ; RowCounter < Idim ; RowCounter++ )
    {
        ptMatrix[RowCounter] = ptMatrix[RowCounter - 1] + ptJdim[RowCounter-1];
    }

    // ----------------------------
    // successful memory allocation
    // ----------------------------
    LocalErrorFlag = NO_ERROR;

end:

    // --------------------------------------------------------------------------------------
    // If the array of pointers to rows has been allocated and the array of rows has not been
    // allocated, free the memory used by the array of pointers
    // --------------------------------------------------------------------------------------

    if ( ( ptMatrix != 0 ) && ( ptMatrix[_MEM_IREF] == 0 ) )
    {
        delete[] ptMatrix;
        ptMatrix = 0;
    }

    return LocalErrorFlag;
}

// ---------------------------
// 3D-matrix memory allocation
// ----------------------------
template<class T> int AllocMatrix3D(T *** &ptMatrix, const char *MatrixName, int Idim, int Jdim, int Kdim)
{
    int IelemCounter;   // counter over the number of elements of the first dimension
    int JelemCounter;   // counter over the number of elements of the second dimension
    int KelemCounter;   // counter over the number of elements of the third dimension
    int LocalErrorFlag = IN_ERROR;   

    // ----------------------------------
    // Initialization of the matrix value
    // ----------------------------------
    ptMatrix = 0;

    // ---------------------------------------------
    // Allocate pointers to first dimension elements
    // ---------------------------------------------

    ptMatrix = new (nothrow) T**[Idim];

    if ( ptMatrix == 0 )
    {
        fprintf(stderr, "\n[Error] Memory allocation failure for \"%s\" pointer in \"AllocMatrix3D\" function\n"
                        "[error on allocation of pointers to first dimension elements - errno = %d]\n\n", MatrixName, errno);
        goto end;
    }

    // ----------------------------------------------
    // Allocate pointers to second dimension elements
    // ----------------------------------------------

    ptMatrix[_MEM_IREF] = new (nothrow) T*[Idim * Jdim];

    if ( ptMatrix[_MEM_IREF] == 0 )
    {
        fprintf(stderr, "\n[Error] Memory allocation failure for \"%s\" pointer in \"AllocMatrix3D\" function\n"
                        "[error on allocation of pointers to secodnd dimension elements - errno = %d]\n\n", MatrixName, errno);
        delete[] ptMatrix;
        goto end;
    }

    // ---------------------------------------------
    // Allocate pointers to third dimension elements
    // ---------------------------------------------

    ptMatrix[_MEM_IREF][_MEM_JREF] = new T[Idim * Jdim * Kdim];

    if ( ptMatrix[_MEM_IREF][_MEM_JREF] == 0 )
    {
        fprintf(stderr, "\n[Error] Memory allocation failure for \"%s\" pointer in \"AllocMatrix3D\" function\n"
                        "[error on allocation of pointers to third dimension elements - errno = %d]\n\n", MatrixName, errno);
        delete[] ptMatrix[_MEM_IREF];
        delete[] ptMatrix;
        goto end;
    }

    // ----------------------------------------------------
    // Initialize the pointers to second dimension elements
    // ----------------------------------------------------

    for ( IelemCounter = _MEM_IREF + 1 ; IelemCounter < Idim ; IelemCounter++ )
    {
        ptMatrix[IelemCounter] = ptMatrix[IelemCounter - 1] + Jdim;
    }

    // ---------------------------------------------------
    // Initialize the pointers to third dimension elements
    // ---------------------------------------------------

    KelemCounter = 0;

    for ( IelemCounter = _MEM_IREF ; IelemCounter < Idim ; IelemCounter++ )
    {
        for ( JelemCounter = _MEM_JREF ; JelemCounter < Jdim ; JelemCounter++ )
        {
            ptMatrix[IelemCounter][JelemCounter] = ptMatrix[_MEM_IREF][_MEM_JREF] + ( KelemCounter * Kdim );

            KelemCounter++;
        }
    }
    
    // ----------------------------
    // successful memory allocation
    // ----------------------------
    LocalErrorFlag = NO_ERROR;

end:

    return LocalErrorFlag;
}

// =================================
// verify memory allocation template
// =================================

template<class T> int AllocVerify(T ptPointer, const char *PointerName)
{

    if ( ptPointer == 0 )
    {
		fprintf(stderr, "\n[Error] Memory allocation failure for \"%s\" pointer in \"memory_allocation()\" function\n\n", PointerName);
		return IN_ERROR;
    }

    return NO_ERROR;
}

// =====================
// free memory templates
// =====================

// -----------------------
// array memory allocation
// -----------------------
template<class T> void FreePointer(T &ptPointer)
{
    if ( ptPointer != 0 )
    {
        delete ptPointer;
        ptPointer = 0;
    }
}

// -----------------------
// array memory allocation
// -----------------------
template<class T> void FreeArray(T &ptArray)
{
    if ( ptArray != 0 )
    {
        delete[] ptArray;
        ptArray = 0;
    }
}

// ------------------------
// matrix memory allocation
// ------------------------
template<class T> void FreeMatrix(T &ptMatrix)
{
    // ------------------
    // Free the row array
    // ------------------

    if ( ( ptMatrix != 0 ) && ( ptMatrix[_MEM_IREF] != 0 ) )
    {
        delete[] ptMatrix[_MEM_IREF];
    }

    // ----------------------------------
    // Free the array of pointers to rows
    // ----------------------------------

    if ( ptMatrix != 0 )
    {
        delete[] ptMatrix;
        ptMatrix = 0;
    }
} 

// ---------------------------
// 3D-matrix memory allocation
// ----------------------------
template<class T> void FreeMatrix3D(T &ptMatrix)
{
    // ------------------------------------------
    // Free the array of third dimension elements
    // ------------------------------------------

    if ( ( ptMatrix != 0 ) && ( ptMatrix[_MEM_IREF] != 0 ) && ( ptMatrix[_MEM_IREF][_MEM_JREF] != 0 ) )
    {
        delete[] ptMatrix[_MEM_IREF][_MEM_JREF];
    }

    // -------------------------------------------------------
    // Free the array of pointers to second dimension elements
    // -------------------------------------------------------

    if ( ( ptMatrix != 0 ) && ( ptMatrix[_MEM_IREF] != 0 ) )
    {
        delete[] ptMatrix[_MEM_IREF];
    }

    // ------------------------------------------------------
    // Free the array of pointers to first dimension pointers
    // ------------------------------------------------------

    if ( ptMatrix != 0 )
    {
        delete[] ptMatrix;
        ptMatrix = 0;
    }
}

#endif  // _TOOLS_MEM_H_
