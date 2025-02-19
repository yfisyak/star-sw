*
* $Id: gdelet.F,v 1.1.1.1 2009/02/18 20:33:26 fisyak Exp $
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.26  by  S.Giani
*-- Author :
      SUBROUTINE G3DELET(IVIEW)
C.
C.    ******************************************************************
C.    *                                                                *
C.    *       Delete view number IVIEW from view banks                 *
C.    *                                                                *
C.    *    ==>Called by : <USER>, <GXINT>, GDTR0, GDTR99               *
C.    *       Author : P.Zanarini   *********                          *
C.    *                                                                *
C.    ******************************************************************
C.
#include "geant321/gcbank.inc"
#include "geant321/gcdraw.inc"
#include "geant321/gcunit.inc"
C.
C.    ------------------------------------------------------------------
C.
      IF (IVIEW.GE.1.AND.IVIEW.LE.NKVIEW) THEN
         IF (LQ(JDRAW-IVIEW).NE.0) THEN
            IF (Q(JDRAW+IVIEW).NE.3.) THEN
               Q(JDRAW+IVIEW)=1.
               CALL MZDROP(IXCONS,LQ(JDRAW-IVIEW),' ')
*
*             Reset view number to 0 (screen)
               IF (IDVIEW.EQ.IVIEW) IDVIEW = 0
*
            ELSE
               WRITE (CHMAIL,10000)
               CALL GMAIL(0,0)
*
            ENDIF
*
         ENDIF
*
      ENDIF
10000 FORMAT (' ERROR IN G3DELET: CANNOT DELETE PROTECTED VIEW')
      END
