*
* $Id: abbrch.F,v 1.1.1.3 2009/02/18 20:33:23 fisyak Exp $
*
* $Log: abbrch.F,v $
* Revision 1.1.1.3  2009/02/18 20:33:23  fisyak
* *** empty log message ***
*
* Revision 1.2  2004/02/24 15:50:29  brun
* From Peter Hristov:
* We had some problems with the Geant3 version during the tests for the
* physics data challenge. They are related to the fact that TRandom3 for
* sure doesn't generate 0, but it may return 1, so things like
* CALL GRANDOM(RNDM,1)
* X = -LOG(1-RNDM(1))
* may lead to floating point exceptions. So I have replaced most of such
* calls with
* X = -LOG(RNDM(1))
*
* Revision 1.1.1.1  2002/07/24 15:56:24  rdm
* initial import into CVS
*
* Revision 1.1.1.1  2002/06/16 15:18:36  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:15  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:19:53  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.41  by  S.Giani
*-- Author :
*$ CREATE ABBRCH.FOR
*COPY ABBRCH
*
*=== abbrch ===========================================================*
*
      SUBROUTINE ABBRCH(IT,LL,LA,LT,E0,PGX,PGY,PGZ,KFR1,KFR2,RE,
     *KR1R,KR2R,KR1L,KR2L,RPX,RPY,RPZ,RPXR,RPYR,RPZR,RPXL,RPYL,RPZL,
     *RER,REL,IV,B1,B2,KFA1,KFA2,KFA3,KFA4,IOPT,IYY)
#include "geant321/dblprc.inc"
#include "geant321/dimpar.inc"
#include "geant321/iounit.inc"
      DIMENSION RE(*),KFR1(*),KFR2(*),RPX(*),RPY(*),IV(*)
      REAL RNDM(6)
C*****POSSIBILITY OF THE CUT OFF OF THE RIGHT AND LEFT JET
*      CUTBAM=0.2D+00/(2.D+00+0.5D+00*LOG(E0+2.D+00))
      CUTBAM=0.D0
      I=IT
      J=IT-1
      IVA=1
      IF (LT.EQ.1) WRITE(LUNOUT,288)IT,LL,LA,LT,E0,PGX,PGY,PGZ,KR1R,
     *KR2R,KR1L,KR2L,RPZ,RPXR,RPYR,RPZR,RPXL,RPYL,RPZL,RER,REL,B1,B2,
     *KFA1,KFA2,KFA3,KFA4,IOPT,IYY
  288 FORMAT(4I5,4E12.4,4I5/11E11.3/6I5/
     *  ' ABBRCH ,IT,LL,LA,LT,E0,PGX,PGY,PGZ,KR1R,KR2R,
     *KR1L,KR2L,RPZ,RPXR,RPYR,RPZR,RPXL,RPYL'/' RPZL,RER,REL,B1,B2,
     *KFA1,KFA2,KFA3,KFA4,IOPT,IYY')
      RM=0.764D0
      RMK=0.891D0
      DM=1.863D0
      IF(LA.EQ.1)GOTO10
C*****CHOICE OF THE CUT OFF ENERGY
      IF(I.GT.1)GOTO50
      AM0=1.D0
      KFAA=KFA1
      IF(IOPT.EQ.2) KFAA=MAX(KFA2,KFA3)
      IF(IOPT.EQ.5) KFAA=MAX(KFA3,KFA4)
      IF (KFAA.GT.6)KFAA=KFAA-6
      IF(KFAA.EQ.1.OR.KFAA.EQ.2) AM0=RM
      IF(KFAA.EQ.3) AM0=RMK
      IF(KFAA.EQ.4) AM0=DM
      GOTO60
   50 CONTINUE
      IF(KFR1(J).EQ.1.OR.KFR1(J).EQ.2)AM0=RM
      IF(KFR1(J).EQ.7.OR.KFR1(J).EQ.8)AM0=RM
      IF(KFR1(J).EQ.3.OR.KFR1(J).EQ.9)AM0=RMK
      IF(KFR1(J).EQ.4.OR.KFR1(J).EQ.10)AM0=DM
      BM0=0.D0
      IF(KFR2(J).EQ.3.OR.KFR2(J).EQ.9) BM0=RMK
      IF(KFR2(J).EQ.4.OR.KFR2(J).EQ.10)BM0=DM
      IF(AM0.LT.BM0)AM0=BM0
   60 CONTINUE
      CALL GRNDM(RNDM,6)
      X=RNDM(1)
      IF(I.EQ.1)RX=E0
      IF(I.GT.1)RX=RE(J)
      AM=AM0-1.D0/B1*LOG(X)
      IF (RNDM(2).LT.CUTBAM)AM=AM0+0.9D0*RX*RNDM(3)
      X=RNDM(4)
      ESA=AM0-1.D0/B2*LOG(1.D0-X+1.D-10)
      IF (RNDM(5).LT.CUTBAM)ESA=AM0+0.9D0*RX*RNDM(6)
*  *** Now: ***
      PSA=ABS(ESA-AM0)*(ESA+AM0)
      EAB=SQRT(3.D0*.5D0*PSA+AM**2)
      IF(RX.GT.EAB)GOTO30
      IF(IYY.EQ.1.AND.I.EQ.1.AND.IOPT.NE.5) GOTO 30
   10 CONTINUE
      LA=1
      IF(I.EQ.1) GO TO 40
      IF(LL.EQ.1)GOTO20
      KR1R=KFR1(J)
      KR2R=KFR2(J)
      RER=RE(J)
      RPXR=-PGX
      RPYR=-PGY
      RPZR=-PGZ
      RE(J)=E0
      KFR1(J)=KFA2
      KFR2(J)=0
      IV(J)=IVA+5
      IF(IOPT.EQ.5) KFR2(J)=KFA2
      IF(IOPT.EQ.5) KFR1(J)=KFA1
      IF(IOPT.EQ.5) IV(J)=7
      RPX(J)=0.D0
      RPY(J)=0.D0
      IF(IOPT.NE.4.OR.KFA1.GT.6) GO TO 1111
      IV(J)=7
      KFR1(J)=KFA2
      KFR2(J)=KFA3
 1111 CONTINUE
      PGX=0.D0
      PGY=0.D0
      PGZ=0.D0
      IF(LT.EQ.0)GOTO101
      WRITE(LUNOUT,2)KR1R,KR2R,RER,RPXR,RPYR,RPZR
    2 FORMAT(1H0,27HQR1,QR2,RER,RPXR,RPYR,RPZR=,2I3,4F8.4)
  101 CONTINUE
      GO TO 30
   20 CONTINUE
      KR1L=KFR1(J)
      KR2L=KFR2(J)
      REL=RE(J)
      RPXL=-PGX
      RPYL=-PGY
      RPZL=-PGZ
      IF(IOPT.NE.4.OR.KFA1.LT.6) GO TO 4444
      IV(J)=2
      KFR1(J)=KFA2
      KFR2(J)=KFA3
      RE(J)=E0
      RPX(J)=0.D0
      RPY(J)=0.D0
      PGX=0.D0
      PGY=0.D0
      PGZ=0.D0
 4444 CONTINUE
      IF(LT.EQ.0)GO TO 102
      WRITE(LUNOUT,3)KR1L,KR2L,REL,RPXL,RPYL,RPZL
    3 FORMAT(1H0,27HQL1,QL2,REL,RPXL,RPYL,RPZL=,2I3,4F8.4)
  102 CONTINUE
      GOTO30
   40 CONTINUE
      IF(LL.EQ.1)GO TO 70
      KR1R=KFA1
      KR2R=0
      IF(IOPT.EQ.5) KR1R=KFA3
      IF(IOPT.EQ.5) KR2R=KFA4
      RER=E0
      RPXR=0.D0
      RPYR=0.D0
      RPZR=0.D0
      PGX=0.D0
      PGY=0.D0
      PGZ=0.D0
      IF (IOPT.EQ.2)  KR1R=KFA1
      IF (IOPT.EQ.2)KR2R=KFA2
      IF(IOPT.NE.4.OR.KFA1.LE.6) GO TO 3333
 3331 CONTINUE
      KR1R=KFA2
      KR2R=KFA3
 3333 CONTINUE
      IF(LT.EQ.0)GO TO 103
      WRITE(LUNOUT,2)KR1R,KR2R,RER,RPXR,RPYR,RPZR
  103 CONTINUE
      GO TO 30
   70 CONTINUE
      KR1L=KFA2
      KR2L=0
      IF(IOPT.EQ.5) KR1L=KFA1
      IF(IOPT.EQ.5) KR2L=KFA2
      REL=E0
      RPXL=0.D0
      RPYL=0.D0
      RPZL=0.D0
      IF(IOPT.EQ.2) KR1L=KFA1
      IF(IOPT.EQ.2)KR2L=KFA2
      IF(IOPT.NE.4.OR.KFA1.GT.6) GO TO 2222
 2221 CONTINUE
      KR1L=KFA2
      KR2L=KFA3
 2222 CONTINUE
      IF(LT.EQ.0)GO TO 104
      WRITE(LUNOUT,3)KR1L,KR2L,REL,RPXL,RPYL,RPZL
  104 CONTINUE
      GO TO 30
   30 CONTINUE
      IF(LT.EQ.0)GO TO 100
      WRITE(LUNOUT,1)I,LL,LA,AM0,AM,PSA,EAB,RX
    1 FORMAT(1H0,26HI,LL,LA,AM0,AM,APS,EAB,RX=,3I3,5F8.4)
  100 CONTINUE
      RETURN
      END
