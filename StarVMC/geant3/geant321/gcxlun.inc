*
* $Id: gcxlun.inc,v 1.1.1.3 2009/02/18 20:33:07 fisyak Exp $
*
* $Log: gcxlun.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:07  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:34  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCXLUN_INC
#define CERNLIB_GEANT321_GCXLUN_INC
*
*
* gcxlun.inc
*
#if !defined(CERNLIB_INCLUDE)
      COMMON/GCXLUN/LUNIT(128)
*
#endif
*
* gcxlun.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcxlun
#include "geant321/incend.inc"
#endif

#endif
