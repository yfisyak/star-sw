*
* $Id: gdlw1.F,v 1.1.1.1 2004/01/15 00:12:05 potekhin Exp $
*
* $Log: gdlw1.F,v $
* Revision 1.1.1.1  2004/01/15 00:12:05  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:40  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:23  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.26  by  S.Giani
*-- Author :
      SUBROUTINE GDLW1(LW)
C.
C.    ******************************************************************
C.    *                                                                *
C.    *       Change phisically the line width to LW                   *
C.    *                                                                *
C.    *    ==>Called by : GDRAWP, GDRAWT                               *
C.    *       Author : P.Zanarini   *********                          *
C.    *                                                                *
C.    ******************************************************************
C.
      SAVE IOLD
      DATA IOLD/-1/
C.
C.    ------------------------------------------------------------------
C.
      LINW=MOD(IABS(LW),8)
C
      IF (LINW.NE.IOLD)THEN
         IOLD=LINW
         CALL ISLWSC(FLOAT(LINW))
      ENDIF
      END
