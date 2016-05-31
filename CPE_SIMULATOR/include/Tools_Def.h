#ifndef _TOOLS_DEF_H_
#define _TOOLS_DEF_H_

// ---------------
// Error detection
// ---------------
#define NO_ERROR  0   // no error detected
#define IN_ERROR  1   // error detected

// ---------------------
// maximum string length
// ---------------------
#define STR_LEN  200  // maximum number of characters in char[]


// -------------------
// numerical constants
// -------------------
#define PI_LETI    3.1415926           // PI number
#define R12   ((double) 0.707106781)   // square root of '0.5'

// -------------------------
// function like definitions
// -------------------------
#define MAXIMUM(x, y)    ((x) > (y) ? (x) : (y))
#define MINIMUM(x, y)    ((x) < (y) ? (x) : (y))
#define ABS_VAL(x)       ((x) >  0  ? (x) : (-(x)))
#define SIGN(x)          ((x) >= 0  ? (1) : (-1))



#endif

