*
* $Id: vzero.F,v 1.3 2018/06/28 19:27:04 fisyak Exp $
*
* $Log: vzero.F,v $
* Revision 1.3  2018/06/28 19:27:04  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:47  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:32  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/02/15 17:50:18  mclareni
* Kernlib
*
*
#include "kerngen/pilot.h"
      SUBROUTINE VZERO (A,N)
C
C CERN PROGLIB# F121    VZERO           .VERSION KERNFOR  4.40  940929
C ORIG. 01/07/71, modif. 24/05/87 to set integer zero
C                 modif. 25/05/94 to depend on QINTZERO
C
#if defined(CERNLIB_QINTZERO)
      INTEGER   A(*)
#endif
#if !defined(CERNLIB_QINTZERO)
      DIMENSION A(*)
#endif
C
      IF (N.LE.0)  RETURN
      DO 9 I= 1,N
#if defined(CERNLIB_QINTZERO)
    9 A(I)= 0
#endif
#if !defined(CERNLIB_QINTZERO)
    9 A(I)= 0.
#endif
C
      RETURN
      END
