*
* $Id: gckmax.inc,v 1.3 2013/02/22 20:14:17 fisyak Exp $
*
* $Log: gckmax.inc,v $
* Revision 1.3  2013/02/22 20:14:17  fisyak
* Freeze
*
* Revision 1.1.1.1  2002/06/16 15:18:38  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:32  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_GCKMAX_INC
#define CERNLIB_GEANT321_GCKMAX_INC
*
*
* gckmax.inc
*
#if !defined(CERNLIB_INCLUDE)
      INTEGER MXGKIN
      PARAMETER (MXGKIN=300)
#endif
*
* gckmax.inc
*
#if defined(CERNLIB_INCLUDE)
*
#include "geant321/incbeg.inc"
     +   gckmax
#include "geant321/incend.inc"
#endif

#endif
