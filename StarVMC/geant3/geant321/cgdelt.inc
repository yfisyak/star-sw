*
* $Id: cgdelt.inc,v 1.1.1.3 2009/02/18 20:33:07 fisyak Exp $
*
* $Log: cgdelt.inc,v $
* Revision 1.1.1.3  2009/02/18 20:33:07  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:42  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_CGDELT_INC
#define CERNLIB_GEANT321_CGDELT_INC
*
*
* cgdelt.inc
*
#if !defined(CERNLIB_INCLUDE)
      PARAMETER (DELWOR = 2.**13,    DELSCR = 2.**11)
      PARAMETER (DEWOR  = .5/DELWOR, EEWOR  = 1./DELWOR)
      PARAMETER (DESCR  = .5/DELSCR, EESCR  = 1./DELSCR)
#endif
*
* cgdelt.inc
*
#if defined(CERNLIB_INCLUDE)
#include "geant321/incbeg.inc"
       +   CGDELT.
#include "geant321/incend.inc"
*
#endif

#endif
