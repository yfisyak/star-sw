*
* $Id: gccurs.inc,v 1.1.1.3 2009/02/18 20:33:07 fisyak Exp $
*
* $Log: gccurs.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:07  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:31  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCCURS_INC
#define CERNLIB_GEANT321_GCCURS_INC
*
*
* gccurs.inc
*
#if !defined(CERNLIB_INCLUDE)
#if defined(CERNLIB_TYPE)
#include "geant321/gtcurs.inc"
#endif
      COMMON/GCCURS/INTFLA,SIZD2,FACHV,HALF,SAVPLX,SAVPLY,YPLT,XPLT
*
#endif
*
* gccurs.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gccurs
#include "geant321/incend.inc"
#endif

#endif
