*
* $Id: gcsets.inc,v 1.1.1.3 2009/02/18 20:33:08 fisyak Exp $
*
* $Log: gcsets.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:08  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:33  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCSETS_INC
#define CERNLIB_GEANT321_GCSETS_INC
*
*
* gcsets.inc
*
#if !defined(CERNLIB_INCLUDE)
      COMMON/GCSETS/IHSET,IHDET,ISET,IDET,IDTYPE,NVNAME,NUMBV(20)
C
#if defined(CERNLIB_TYPE)
#include "geant321/gtsets.inc"
#endif
#endif
*
* gcsets.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcsets
#include "geant321/incend.inc"
#endif

#endif
