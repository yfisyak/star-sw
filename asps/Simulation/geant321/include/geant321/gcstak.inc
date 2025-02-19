*
* $Id: gcstak.inc,v 1.1.1.1 2004/01/15 00:12:24 potekhin Exp $
*
* $Log: gcstak.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:24  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:49  atlascvs
* Importing CERNLIB version 08.21.
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
