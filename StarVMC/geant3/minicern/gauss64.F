*
* $Id: gauss64.F,v 1.2 2018/06/28 19:26:58 fisyak Exp $
*
* $Log: gauss64.F,v $
* Revision 1.2  2018/06/28 19:26:58  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:45  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:34  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/04/01 15:02:13  mclareni
* Mathlib gen
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION DGAUSS(F,A,B,EPS)
#include "gen/imp64.inc"

      CHARACTER NAME*(*)
      PARAMETER (NAME = 'DGAUSS')
#include "gausscod.inc"

   99 DGAUSS=H
      RETURN
      END
#endif
