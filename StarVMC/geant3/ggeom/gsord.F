*
* $Id: gsord.F,v 1.1.1.3 2009/02/18 20:32:21 fisyak Exp $
*
* $Log: gsord.F,v $
* Revision 1.1.1.3  2009/02/18 20:32:21  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/07/24 15:56:25  rdm
* initial import into CVS
*
* Revision 1.1.1.1  2002/06/16 15:18:39  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:17  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:56  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.30  by  S.Giani
*-- Author :
      SUBROUTINE G3SORD (CHNAME, IAX)
C.
C.    *****************************************************************
C.    *                                                               *
C.    *    Flags volume CHNAME whose contents will have to be ordered   *
C.    *    along axis IAX, by setting the search flag to -IAX         *
C.    *           IAX = 1    X axis                                   *
C.    *           IAX = 2    Y axis                                   *
C.    *           IAX = 3    Z axis                                   *
C.    *           IAX = 4    Rxy (static ordering only  -> GTMEDI)    *
C.    *           IAX = 14   Rxy (also dynamic ordering -> GTNEXT)    *
C.    *           IAX = 5    Rxyz (static ordering only -> GTMEDI)    *
C.    *           IAX = 15   Rxyz (also dynamic ordering -> GTNEXT)   *
C.    *           IAX = 6    PHI   (PHI=0 => X axis)                  *
C.    *           IAX = 7    THETA (THETA=0 => Z axis)                *
C.    *                                                               *
C.    *    Called by : <USER>                                         *
C.    *    Authors   : R.Brun, F.Bruyant, A.McPherson  *********      *
C.    *                                                               *
C.    *****************************************************************
C.
#include "geant321/gcbank.inc"
#include "geant321/gcnum.inc"
#include "geant321/gcunit.inc"
      CHARACTER*4 CHNAME
C.
C.    ------------------------------------------------------------------
*
      IVO = 0
      IF (JVOLUM.GE.0) CALL GLOOK (CHNAME, IQ(JVOLUM+1), NVOLUM, IVO)
      IF (IVO.EQ.0) THEN
         WRITE (CHMAIL, 1001) CHNAME
         CALL GMAIL (0, 0)
         GO TO 999
      ENDIF
*
      IF ((IAX.LE.0.OR.IAX.GT.7).AND.IAX.NE.14.AND.IAX.NE.15) THEN
         WRITE (CHMAIL, 1002) CHNAME, IAX
         CALL GMAIL (0, 0)
         GO TO 999
      ENDIF
*
      JVO = LQ(JVOLUM-IVO)
      NIN = Q(JVO+3)
      IF (NIN.LE.0.OR.NIN.GT.500) THEN
         WRITE (CHMAIL,1003) CHNAME, NIN
         CALL GMAIL (0, 0)
         GO TO 999
      ENDIF
*
* *** Set search flag
*
      Q(JVO+1) = -IAX
*
 1001 FORMAT (' GSORD : Volume ',A4,' does not exist  *****')
 1002 FORMAT (' GSORD : Volume ',A4,', axis',I3,' not allowed  *****')
 1003 FORMAT (' GSORD : Volume ',A4,' not accepted, NIN=',I5,'  *****')
*                                                              END GSORD
  999 END
