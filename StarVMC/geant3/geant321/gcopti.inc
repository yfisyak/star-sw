*
* $Id: gcopti.inc,v 1.1.1.3 2009/02/18 20:33:07 fisyak Exp $
*
* $Log: gcopti.inc,v $
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
#ifndef CERNLIB_GEANT321_GCOPTI_INC
#define CERNLIB_GEANT321_GCOPTI_INC
*
*
* gcopti.inc
*
#if !defined(CERNLIB_INCLUDE)
      COMMON/GCOPTI/ IOPTIM
C
#if defined(CERNLIB_TYPE)
#include "geant321/gtopti.inc"
#endif
#endif
*
* gcopti.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gcopti
#include "geant321/incend.inc"
#endif

#endif
