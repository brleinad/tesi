#ifndef _TOOLS_STR_H_
#define _TOOLS_STR_H_

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <typeinfo>
#include <cctype>
#include <cstdlib>
#include <climits>

using namespace std;

#include "Tools_Def.h"

#define _ST_KEY_NOT_IN_FILE   -1
#define _ST_WRONG_ARG_FORMAT   2
#define _ST_WRONG_ARG_TYPE     3
#define _ST_KEY_LACKS_VALUES   4
#define _ST_KEY_OUT_OF_BNDS    5
#define _ST_KEY_NOT_IN_LIST    6
#define _ST_KEYNUM_EXCEEDED    7


extern int  str2int_list(int &intkey, char *endkey, const char *strkey, const int sizelist, const int intlist[], const char strlist[][STR_LEN]);
extern int  str2int_list(int &intkey, const char *strkey, const int sizelist, const int intlist[], const char strlist[][STR_LEN]);
extern int  int2str_list(int const intkey,  char *strkey, const int sizelist, const int intlist[], const char strlist[][STR_LEN]);
extern void str2lowercase(char *str);
extern void str2uppercase(char *str);
extern void str2lowercase(char *str1, const char *str2);
extern void str2uppercase(char *str1, const char *str2);
extern int  find_keyword(FILE *File, const char* keyname);
extern int  find_keyword(FILE *File, const char* keyname, char* endkey);

extern int  strtls_errno(void); 
extern void strtls_errmsg(void);
extern void strtls_seterr(int errflag, char const *functid, char const *errmsg);
#define strtls_error(x, y)  strtls_seterr(x, __FUNCTION__, y)

/* ---------------------------------------------------------------------------------------------------------------
 * template functions defined in the "Tools_Str.n" file:
 * -----------------------------------------------------
 * template<class T> int read_keyvalue(T *ptkeyval, const int keynum, FILE *File, const char* keyname)
 * template<class T> int read_numvalue(T *ptkeyval, const int keynum, FILE *File)
 * template<class T> int verify_keyvalue(T *ptkeyval, int keynum, const char *interval)
 * template<class T> int verify_keyvalue(T *ptkeyval, int keynum, const char *intervalformat, T leftbound, T rightbound)
 * template<class T> int verify_keyvalue(T *ptkeyval, int keynum, const T *vallist, int numlist)
 * template<class T> int str2numeric(T *ptnumval, const int numsize, const char *strval)
 * --------------------------------------------------------------------------------------------------------------- */
#include "Tools_Str.n"

#endif

