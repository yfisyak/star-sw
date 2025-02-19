*
* $Id: gcstak.inc,v 1.1.1.3 2009/02/18 20:33:09 fisyak Exp $
*
* $Log: gcstak.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:09  fisyak
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
#ifndef CERNLIB_GEANT321_GCSTAK_INC
#define CERNLIB_GEANT321_GCSTAK_INC
*
*
* gcstak.inc
*
#if !defined(CERNLIB_INCLUDE)
#if defined(CERNLIB_TYPE)
#include "geant321/gtstak.inc"
#endif
      PARAMETER (NWSTAK=12,NWINT=11,NWREAL=12,NWTRAC=NWINT+NWREAL+5)
      COMMON /GCSTAK/ NJTMAX, NJTMIN, NTSTKP, NTSTKS, NDBOOK, NDPUSH,
     +                NJFREE, NJGARB, NJINVO, LINSAV(15), LMXSAV(15)
      EQUIVALENCE (ISTORD,NJTMIN)
C
#endif
*
* gcstak.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcstak
#include "geant321/incend.inc"
#endif

#endif
