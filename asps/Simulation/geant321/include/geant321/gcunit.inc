*
* $Id: gcunit.inc,v 1.1.1.1 2004/01/15 00:12:24 potekhin Exp $
*
* $Log: gcunit.inc,v $
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
#ifndef CERNLIB_GEANT321_GCUNIT_INC
#define CERNLIB_GEANT321_GCUNIT_INC
*
*
* gcunit.inc
*
#if !defined(CERNLIB_INCLUDE)
      COMMON/GCUNIT/LIN,LOUT,NUNITS,LUNITS(5)
      INTEGER LIN,LOUT,NUNITS,LUNITS
      COMMON/GCMAIL/CHMAIL
#if __GNUC__ < 7
      CHARACTER*132 CHMAIL
#else
      integer chmail/6/
#endif
C
#endif
*
* gcunit.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcunit
#include "geant321/incend.inc"
#endif

#endif
