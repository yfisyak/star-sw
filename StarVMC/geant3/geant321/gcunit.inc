*
* $Id: gcunit.inc,v 1.1.1.3 2009/02/18 20:33:09 fisyak Exp $
*
* $Log: gcunit.inc,v $
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
#ifndef CERNLIB_GEANT321_GCUNIT_INC
#define CERNLIB_GEANT321_GCUNIT_INC
*
*
* gcunit.inc
*
#if !defined(CERNLIB_INCLUDE)
      COMMON/GCUNIT/LIN,LOUT,NUNITS,LUNITS(5)
      INTEGER LIN,LOUT,NUNITS,LUNITS
#if __GNUC__ >= 7
      integer chmail /6/
#else
      COMMON/GCMAIL/CHMAIL
      CHARACTER*132 CHMAIL
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
