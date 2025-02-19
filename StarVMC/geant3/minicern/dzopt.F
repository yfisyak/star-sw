*
* $Id: dzopt.F,v 1.2 2018/06/28 19:26:58 fisyak Exp $
*
* $Log: dzopt.F,v $
* Revision 1.2  2018/06/28 19:26:58  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:48  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:22  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 10:47:07  mclareni
* Zebra
*
*
*------------------------------------------------------------
#include "zebra/pilot.h"
#if (defined(CERNLIB_DEBUGON))&&(defined(CERNLIB_VFORT))
#include "zebra/debugvf1.inc"
#endif
      SUBROUTINE DZOPT(CHOPT)
#include "zebra/dzc1.inc"
      CHARACTER *(*) CHOPT,CLETT

      PARAMETER
     X (CLETT = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz')


#if (defined(CERNLIB_DEBUGON))&&(defined(CERNLIB_VFORT))
#include "zebra/debugvf2.inc"
#endif


      DO 10 I=1,26
   10 IFLOPT(I) = 0


      DO 20 I=1,LEN(CHOPT)
          J = INDEX(CLETT,CHOPT(I:I))
          IF (J.NE.0) IFLOPT(J - ((J-1)/26)*26) = 1
   20 CONTINUE

  999 RETURN
      END
