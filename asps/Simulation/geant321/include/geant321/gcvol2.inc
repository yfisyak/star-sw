*
* $Id: gcvol2.inc,v 1.1.1.1 2004/01/15 00:12:24 potekhin Exp $
*
* $Log: gcvol2.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:24  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:50  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:34  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCVOL2_INC
#define CERNLIB_GEANT321_GCVOL2_INC
*
*
* gcvol2.inc
*
#if !defined(CERNLIB_INCLUDE)
      COMMON/GCVOL2/NLEVE2,NAMES2(15),NUMB2(15),
     +LVOL2(15),LIND2(15),INFRO2,NLDEV2(15),LINMX2(15),
     +GTRAN2(3,15),GRMAT2(10,15),GONLY2(15),GLX2(15)
      INTEGER NLEVE2,NAMES2,NUMB2,LVOL2,LIND2,INFRO2,NLDEV2,LINMX2
      REAL GTRAN2,GRMAT2,GONLY2,GLX2
C
#endif
*
* gcvol2.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcvol2
#include "geant321/incend.inc"
#endif

#endif
