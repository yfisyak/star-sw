*
* $Id: gctrak.inc,v 1.1.1.1 2004/01/15 00:12:24 potekhin Exp $
*
* $Log: gctrak.inc,v $
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
#ifndef CERNLIB_GEANT321_GCTRAK_INC
#define CERNLIB_GEANT321_GCTRAK_INC
*
*
* gctrak.inc
*
#if !defined(CERNLIB_INCLUDE)
#if defined(CERNLIB_TYPE)
#include "geant321/gttrak.inc"
#endif
      PARAMETER (MAXMEC=30)
      COMMON/GCTRAK/VECT(7),GETOT,GEKIN,VOUT(7),NMEC,LMEC(MAXMEC)
     + ,NAMEC(MAXMEC),NSTEP ,MAXNST,DESTEP,DESTEL,SAFETY,SLENG
     + ,STEP  ,SNEXT ,SFIELD,TOFG  ,GEKRAT,UPWGHT,IGNEXT,INWVOL
     + ,ISTOP ,IGAUTO,IEKBIN, ILOSL, IMULL,INGOTO,NLDOWN,NLEVIN
     + ,NLVSAV,ISTORY
      PARAMETER (MAXME1=30)
      COMMON/GCTPOL/POLAR(3), NAMEC1(MAXME1)
C
#endif
*
* gctrak.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gctrak
#include "geant321/incend.inc"
#endif

#endif
