*
* $Id: gamma64.F,v 1.2 2018/06/28 19:26:58 fisyak Exp $
*
* $Log: gamma64.F,v $
* Revision 1.2  2018/06/28 19:26:58  fisyak
* Merge with geant3
*
* Revision 1.1.1.1  2002/06/16 15:18:44  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:34  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/04/01 15:01:54  mclareni
* Mathlib gen
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_IBM)
#if defined(CERNLIB_DOUBLE)
      FUNCTION DGAMMA(X)
C
#include "gen/imp64.inc"
C
      CHARACTER*(*) NAME
      PARAMETER(NAME='GAMMA/DGAMMA')
#endif
#if !defined(CERNLIB_DOUBLE)
      FUNCTION GAMMA(X)
C
      CHARACTER*(*) NAME
      PARAMETER(NAME='GAMMA')
#endif
C
      CHARACTER*80 ERRTXT

      DIMENSION C(0:15)

      DATA C( 0) /3.65738 77250 83382 44D0/
      DATA C( 1) /1.95754 34566 61268 27D0/
      DATA C( 2) /0.33829 71138 26160 39D0/
      DATA C( 3) /0.04208 95127 65575 49D0/
      DATA C( 4) /0.00428 76504 82129 09D0/
      DATA C( 5) /0.00036 52121 69294 62D0/
      DATA C( 6) /0.00002 74006 42226 42D0/
      DATA C( 7) /0.00000 18124 02333 65D0/
      DATA C( 8) /0.00000 01096 57758 66D0/
      DATA C( 9) /0.00000 00059 87184 05D0/
      DATA C(10) /0.00000 00003 07690 81D0/
      DATA C(11) /0.00000 00000 14317 93D0/
      DATA C(12) /0.00000 00000 00651 09D0/
      DATA C(13) /0.00000 00000 00025 96D0/
      DATA C(14) /0.00000 00000 00001 11D0/
      DATA C(15) /0.00000 00000 00000 04D0/

      U=X
      IF(U .LE. 0) THEN
       WRITE(ERRTXT,101) U
       CALL MTLPRT(NAME,'C302.1',ERRTXT)
       H=0
       GO TO 9
      ENDIF
    8 F=1
      IF(U .LT. 3) THEN
       DO 1 I = 1,INT(4-U)
       F=F/U
    1  U=U+1
      ELSE
       DO 2 I = 1,INT(U-3)
       U=U-1
    2  F=F*U
      END IF
      H=U+U-7
      ALFA=H+H
      B1=0
      B2=0
      DO 3 I = 15,0,-1
      B0=C(I)+ALFA*B1-B2
      B2=B1
    3 B1=B0
#if defined(CERNLIB_DOUBLE)
    9 DGAMMA=F*(B0-H*B2)
#endif
#if !defined(CERNLIB_DOUBLE)
    9 GAMMA =F*(B0-H*B2)
#endif
      RETURN
  101 FORMAT('ARGUMENT IS NEGATIVE = ',1P,E15.1)
      END
#endif
