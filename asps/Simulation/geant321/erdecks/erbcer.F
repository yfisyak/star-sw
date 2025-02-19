*
* $Id: erbcer.F,v 1.1.1.1 2004/01/15 00:11:58 potekhin Exp $
*
* $Log: erbcer.F,v $
* Revision 1.1.1.1  2004/01/15 00:11:58  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:28:40  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1996/03/06 15:37:34  mclareni
* Add geane321 source directories
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.49  by  S.Giani
*-- Author :
      SUBROUTINE ERBCER (E)
*
C.    ******************************************************************
C.    *                                                                *
C.    *       After the back-tracking transforms the error matrix      *
C.    *                  back to the original                          *
C.    *                  particle direction                            *
C.    *                                                                *
C.    *       Arguments                                                *
C.    *           E        - Error Matrix (Triangular)                 *
C.    *                                                                *
C.    *    ==>Called by : ERPEND                                       *
C.    *       Author    E.Nagy  *********                              *
C.    *                                                                *
C.    ******************************************************************
*
         DIMENSION E(15)
*
      J = 0
      DO 10 I = 1, 5
         DO 5 K = I, 5
            J = J + 1
            IF (I.EQ.2) E(J) = -E(J)
            IF (K.EQ.2) E(J) = -E(J)
            IF (I.EQ.4) E(J) = -E(J)
            IF (K.EQ.4) E(J) = -E(J)
    5    CONTINUE
   10 CONTINUE
*                                                           END ERBCER
      END
