*
* $Id: hklass.F,v 1.1.1.3 2009/02/18 20:33:23 fisyak Exp $
*
* $Log: hklass.F,v $
* Revision 1.1.1.3  2009/02/18 20:33:23  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:36  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:00  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.44  by  S.Giani
*-- Author :
*$ CREATE HKLASS.FOR
*COPY HKLASS
*
*=== hklass ===========================================================*
*
      SUBROUTINE HKLASS(IT,LT,LA,LL,KFR1,KFR2,KR1R,KR2R,KR1L,KR2L,IV,
     *IMPS,IMVE,IB08,IA08,IB10,IA10,AS,B8,KFA1,KFA2,KFA3,KFA4,IOPT)
 
#include "geant321/dblprc.inc"
#include "geant321/dimpar.inc"
#include "geant321/iounit.inc"
*
*----------------------------------------------------------------------*
*  Hklass89: slight revision by A. Ferrari                             *
*----------------------------------------------------------------------*
*
#include "geant321/finpar2.inc"
#include "geant321/part.inc"
      LOGICAL LSWTCH
      COMMON/FKVALI/LSWTCH
      DIMENSION KFR1(*),KFR2(*),IV(*),IMPS(6,6),IMVE(6,6),
     *IB08(6,21),IB10(6,21),IA08(6,21),IA10(6,21)
      REAL RNDM(2)
C     CLASSIFICATION OF THE HADRONS ACCORDING TO THEIR FLAVOUR CONTENTS
*
*or      IF (LT.EQ.1)WRITE(LUNOUT,288)IT,LT,LA,LL,KR1R,KR2R,KR1L,KR2L,
*or     *AS,B8,KFA1,KFA2,KFA3,KFA4,IOPT
*or  288 FORMAT (8I5,2E12.4,5I5/
*or     *' HKLASS IT,LT,LA,LL,KR1R,KR2R,KR1L,KR2L,AS,B8,KFA1,KFA2,KFA3,'
*or     *,'KFA4,IOPT')
C**RESC=PROBABILITY FOR AN U,AU/D,AD/U,AD/D,AU PAIR TO BECOME E HEAVY
C**RESONANCE RO,R+,R-
      RESC=0.5D0
      IX=0
      CALL GRNDM(RNDM,2)
      X=RNDM(1)
      Z=RNDM(2)
      IF(LA.EQ.0) GO TO 100
      A=KR1R*KR2R*KR1L*KR2L
      IF(A.EQ.0) GO TO 90
      IX=1
      LI=KR1R-6
      LJ=KR1L
      I=IT
      GO TO 10
  101 IX=2
      LI=KR2R-6
      LJ=KR2L
      I=IT+1
      IT=IT+1
      GO TO 10
   90 B=KR1R*KR2R
      C=KR1L*KR2L
      IF(B.GT.0.D0.OR.C.GT.0.D0) GO TO 91
      LJ=KR1R
      IF(KR1R.EQ.0)LJ=KR2R
      LI=KR1L-6
      IF(KR1L.EQ.0)LI=KR2L-6
      I=IT
      GO TO 10
   91 IF(B.GT.0.D0) GO TO 92
      LI=KR1R
      IF(KR1R.EQ.0)LI=KR2R
      KA=KR1L
      KB=KR2L
      CALL INDEX2(KA,KB,IND)
      LJ=IND
      I=IT
      GO TO 20
   92 LI=KR1L-6
      IF(KR1L.EQ.0)LI=KR2L-6
      KA=KR1R-6
      KB=KR2R-6
      CALL INDEX2(KA,KB,IND)
      LJ=IND
      I=IT
      GO TO 30
C     LA=0
  100 CONTINUE
      I=IT
      J=IT-1
      K1I=KFR1(I)
      K2I=KFR2(I)
      K2J=0
      K1J=KFA1
      IF(I.GT.1) GO TO 5555
      IF(IOPT.EQ.3.AND.LL.EQ.1) K1J=KFA2
      IF(IOPT.EQ.2) K1J=KFA1
      IF(IOPT.EQ.2) K2J=KFA2
      IF(IOPT.EQ.4.AND.KFA1.LE.6.AND.LL.EQ.1) K1J=KFA2
      IF(IOPT.EQ.4.AND.KFA1.LE.6.AND.LL.EQ.1) K2J=KFA3
      IF(IOPT.EQ.4.AND.KFA1.GT.6.AND.LL.EQ.0) K1J=KFA2
      IF(IOPT.EQ.4.AND.KFA1.GT.6.AND.LL.EQ.0) K2J=KFA3
      IF(IOPT.EQ.5.AND.LL.EQ.0) K1J=KFA3
      IF(IOPT.EQ.5.AND.LL.EQ.0) K2J=KFA4
      IF(IOPT.EQ.5.AND.LL.EQ.1) K1J=KFA1
      IF(IOPT.EQ.5.AND.LL.EQ.1) K2J=KFA2
 5555 CONTINUE
      IF(I.GT.1)K1J=KFR1(J)
      IF(I.GT.1)K2J=KFR2(J)
      IVY=IV(I)
*or      IF(LT.EQ.0) GO TO 606
*or      WRITE(LUNOUT,601)K1I,K2I,K1J,K2J,IVY,I,LL,LA
*or  601 FORMAT(1H0,8I3,27HK1I,K2I,K1J,K2J,IVY,I,LL,LA)
*or  606 CONTINUE
      GO TO(1,4,5,2,3,1,4,5,2,3),IVY
    1 LI=K1I
      LJ=K1J
      IF(LL.EQ.1)LI=K1J-6
      IF(LL.EQ.1)LJ=K1I-6
      GO TO 10
    2 LI=K1J-6
      LJ=K1I-6
      IF(LL.EQ.1) LI=K1I
      IF(LL.EQ.1)LJ=K1J
      GO TO 10
    3 LI=K2J-6
      LJ=K2I-6
      IF(LL.EQ.1)LI=K2I
      IF(LL.EQ.1)LJ=K2J
      GO TO 10
    4 LI=K1J
      IF(LL.EQ.1)LI=K1J-6
      KA=K1I
      KB=K2I
      IF(LL.EQ.0)KA=K1I-6
      IF(LL.EQ.0)KB=K2I-6
      IF(LL.EQ.1)KA=K1I
      IF(LL.EQ.1)KB=K2I
      CALL INDEX2(KA,KB,IND)
      LJ=IND
      IF(LL.EQ.1) GO TO 30
      GO TO 20
    5 LI=K1I
      IF(LL.EQ.1)LI=K1I-6
      KA=K1J
      KB=K2J
      IF(LL.EQ.0)KA=K1J-6
      IF(LL.EQ.0)KB=K2J-6
      CALL INDEX2(KA,KB,IND)
      LJ=IND
      IF(LL.EQ.1) GO TO 20
      GO TO 30
C     MESONENAUSWAHL
   10 CONTINUE
      IF(X.LE.AS) GO TO 11
      INDEX=IMVE(LI,LJ)
      IF(INDEX.EQ.33.AND.Z.LE.0.5D0)INDEX=35
      IF(.NOT.LSWTCH) GO TO 40
      CALL GRNDM(RNDM,1)
      X=RNDM(1)
      IF(X.GE.RESC) GO TO 40
      IF(INDEX.EQ.33.OR.INDEX.EQ.35.OR.INDEX.EQ.96) INDEX=181
      IF(INDEX.EQ.32) INDEX=182
      IF(INDEX.EQ.34) INDEX=183
      GO TO 40
   11 INDEX=IMPS(LI,LJ)
      IF(INDEX.EQ.23) GO TO 15
      IF(INDEX.EQ.31.AND.Z.LE.0.33D0)INDEX=95
      IF(.NOT.LSWTCH) GO TO 40
      IF(INDEX.EQ.31.AND.Z.LE.0.97D0)INDEX=95
      CALL GRNDM(RNDM,1)
      X=RNDM(1)
      IF(X.GE.RESC) GO TO 40
      IF(INDEX.EQ.23.OR.INDEX.EQ.31.OR.INDEX.EQ.95) INDEX=181
      IF(INDEX.EQ.13) INDEX=182
      IF(INDEX.EQ.14) INDEX=183
      GO TO 40
C     BARYONMULTIPLETTS
   20 CONTINUE
      B10=1.D0-B8
      IF(X.LE.B8)GO TO 21
   24 INDEX=IB10(LI,LJ)
      GO TO 40
   21 INDEX=IB08(LI,LJ)
      IF(INDEX.EQ.22.AND.Z.LE.0.5D0)INDEX=17
      IF(INDEX.EQ.137.AND.Z.LE.0.5D0)INDEX=141
      IF(INDEX.EQ.138.AND.Z.LE.0.5D0)INDEX=143
      IF(INDEX.EQ.139.AND.Z.LE.0.5D0)INDEX=144
      IF(INDEX.EQ.0)GO TO 24
      GO TO 40
C     ANTIBARYONMULTIPLETTS
   30 CONTINUE
      A8=B8
      A10=1.D0-A8
      IF(X.LE.A8)GO TO 31
   34 INDEX=IA10(LI,LJ)
      GO TO 40
   31 INDEX=IA08(LI,LJ)
      IF(INDEX.EQ.100.AND.Z.LE.0.5D0)INDEX=18
      IF(INDEX.EQ.149.AND.Z.LE.0.5D0)INDEX=153
      IF(INDEX.EQ.150.AND.Z.LE.0.5D0)INDEX=155
      IF(INDEX.EQ.151.AND.Z.LE.0.5D0)INDEX=156
      IF(INDEX.EQ.0)GO TO 34
      GO TO 40
 15   CONTINUE
      IF(LSWTCH)THEN
        IF(Z.LE.0.5D0)INDEX=31
        IF(Z.LE.0.5D0*0.03D0)INDEX=95
      ELSE
        IF(Z.LE.0.5D0)INDEX=33
        IF(Z.LE.0.5D0*0.67D0)INDEX=95
      ENDIF
      GO TO 40
C     UEBERLESEN DER HADRONDATEN
   40 CONTINUE
      IF(LT.EQ.0) GO TO 604
      WRITE(LUNOUT,602)INDEX
  602 FORMAT(1H0,I3,6H=INDEX)
  604 CONTINUE
      ANF(I)=ANAME(INDEX)
      AMF(I)=AM(INDEX)
      ICHF(I)=ICH(INDEX)
      IBARF(I)=IBAR(INDEX)
      NREF(I)=INDEX
      IF(IX.EQ.1)GO TO 101
      IF(IX.EQ.2)GO TO 500
      GO TO 500
  500 CONTINUE
      IF(LT.EQ.0) GO TO 600
      IZ=0
      IF(IX.EQ.2)I=I-1
  504 CONTINUE
      WRITE(LUNOUT,503)ANF(I),AMF(I),ICHF(I),IBARF(I),NREF(I),LL
  503 FORMAT((1X,A7,1X,F6.3,1X,4(I3,1X),
     *'MAME,MASS,Q,BQ,NR,LL'))
      IF(IX.EQ.0) GO TO 600
      IZ=IZ+1
      IF(IZ.EQ.2) GO TO 600
      I=I+1
      GO TO 504
  600 CONTINUE
      RETURN
      END
