*
* $Id: gcshno.inc,v 1.1.1.1 2004/01/15 00:12:24 potekhin Exp $
*
* $Log: gcshno.inc,v $
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
#ifndef CERNLIB_GEANT321_GCSHNO_INC
#define CERNLIB_GEANT321_GCSHNO_INC
*
*
* gcshno.inc
*
#if !defined(CERNLIB_INCLUDE)
      PARAMETER ( NSBOX=1,  NSTRD1=2, NSTRD2=3, NSTRAP=4, NSTUBE=5,
     +  NSTUBS=6, NSCONE=7, NSCONS=8, NSSPHE=9, NSPARA=10,NSPGON=11,
     +  NSPCON=12,NSELTU=13,NSHYPE=14,NSGTRA=28, NSCTUB=29 )
#endif
*
* gcshno.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcshno
#include "geant321/incend.inc"
#endif

#endif
