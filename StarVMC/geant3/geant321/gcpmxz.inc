*
* $Id: gcpmxz.inc,v 1.1.1.3 2009/02/18 20:33:10 fisyak Exp $
*
* $Log: gcpmxz.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:10  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:35  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCPMXZ_INC
#define CERNLIB_GEANT321_GCPMXZ_INC
*
*
* gcpmxz.inc
*
#if !defined(CERNLIB_INCLUDE)
      INTEGER MAXELZ
      PARAMETER (MAXELZ=100)
C
#endif
*
* gcpmxz.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcpmxz
#include "geant321/incend.inc"
#endif

#endif
