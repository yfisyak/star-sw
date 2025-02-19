*
* $Id: ubits.F,v 1.2 2018/06/28 19:27:03 fisyak Exp $
*
* $Log: ubits.F,v $
* Revision 1.2  2018/06/28 19:27:03  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:47  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:30  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/02/15 17:49:51  mclareni
* Kernlib
*
*
#include "kerngen/pilot.h"
      SUBROUTINE UBITS (I,N,K,M)
C
C CERN PROGLIB# M503    UBITS           .VERSION KERNFOR  3.17  820204
C
C ARGUMENTS:
C    I - A FULLWORD ARRAY CONTAINING THE BIT STRING TO BE EXAMINED
C    N - THE NUMBER OF BITS IN THE BIT STRING
C    K - ARRAY TO CONTAIN THE LOCATIONS OF THE BITS WITH VALUE 1
C    M - NUMBER OF BITS FOUND TO HAVE THE VALUE 1
C
      DIMENSION I(9), K(N)
C
C
      CALL UPKBYT (I, 1, K, N, 0)
C
      J = 0
      DO 10 L=1,N
      IF (K(L).EQ.0)   GO TO 10
      J = J + 1
      K(J) = L
   10 CONTINUE
      M = J
C
      IF (M.EQ.N)      RETURN
      J = J + 1
      DO 20 L=J,N
   20 K(L) = 0
      RETURN
      END
