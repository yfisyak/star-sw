*
* $Id: gccurs.inc,v 1.1.1.1 2004/01/15 00:12:23 potekhin Exp $
*
* $Log: gccurs.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:23  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:47  atlascvs
* Importing CERNLIB version 08.21.
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
