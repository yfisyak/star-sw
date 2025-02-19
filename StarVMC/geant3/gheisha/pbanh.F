*
* $Id: pbanh.F,v 1.1.1.3 2009/02/18 20:33:31 fisyak Exp $
*
* $Log: pbanh.F,v $
* Revision 1.1.1.3  2009/02/18 20:33:31  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:40  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:19  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:58  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.38  by  S.Giani
*-- Author :
      SUBROUTINE PBANH(NOPT)
C *** ANTI PROTON ANNIHILATION AT REST ***
C *** NVE 04-MAR-1988 CERN GENEVA ***
C
C ORIGIN : H.FESEFELDT (09-JULY-1987)
C
C NOPT=0    NO ANNIHILATION
C NOPT=1    ANNIH.IN PI+ PI-
C NOPT=2    ANNIH.IN PI0 PI0
C NOPT=3    ANNIH.IN PI- PI0
C NOPT=4    ANNIH.IN GAMMA GAMMA
C
#include "geant321/s_defcom.inc"
C
      DIMENSION BRR(3)
      DIMENSION RNDM(3)
      DATA BRR/0.125,0.25,0.5/
C
      PV(1,1)=0.
      PV(2,1)=0.
      PV(3,1)=0.
      PV(4,1)=ABS(RMASS(15))
      PV(5,1)=RMASS(15)
      PV(6,1)=-1.
      PV(7,1)=TOF
      PV(8,1)=IPART
      PV(9,1)=0.
      PV(10,1)=USERW
      IER(86)=IER(86)+1
      ISW=1
      CALL GRNDM(RNDM,1)
      RAN=RNDM(1)
      IF(RAN.GT.BRR(1)) ISW=2
      IF(RAN.GT.BRR(2)) ISW=3
      IF(RAN.GT.BRR(3)) ISW=4
      NOPT=ISW
C**
C**  EVAPORATION
C**
      CALL COMPO
      IF (ISW .EQ. 1) THEN
         RMNVE1=RMASS(7)
         RMNVE2=RMASS(9)
      ELSEIF (ISW .EQ. 2) THEN
         RMNVE1=RMASS(8)
         RMNVE2=RMASS(8)
      ELSEIF (ISW .EQ. 3) THEN
         RMNVE1=RMASS(9)
         RMNVE2=RMASS(8)
      ELSEIF (ISW .EQ. 4) THEN
         RMNVE1=RMASS(1)
         RMNVE2=RMASS(1)
      ENDIF
      EK=RMASS(14)+ABS(RMASS(15))-RMNVE1-RMNVE2
      TKIN=EXNU(EK)
      EK=EK-TKIN
      IF(EK.LT.0.0001) EK=0.0001
      EK=0.5*EK
      EN=EK+0.5*(RMNVE1+RMNVE2)
      S=AMAS*AMAS+RMASS(14)**2+2.0*RMASS(14)*EN
      RS=SQRT(S)
      PCM=SQRT(ABS(EN*EN-RMNVE1*RMNVE2))
      CALL GRNDM(RNDM,2)
      PHI=2.*PI*RNDM(1)
      COST=-1.+2.*RNDM(2)
      SINT=SQRT(ABS((1.-COST)*(1.+COST)))
      PV(1,2)=PCM*SINT*COS(PHI)
      PV(2,2)=PCM*SINT*SIN(PHI)
      PV(3,2)=PCM*COST
      DO 1 I=1,3
    1 PV(I,3)=-PV(I,2)
      PV(5,2)=RMNVE1
      PV(5,3)=RMNVE2
      IF(ISW.LE.3) GOTO 2
      PV(5,2)=0.
      PV(5,3)=0.
    2 PV(4,2)=SQRT(PV(5,2)**2+PCM**2)
      PV(4,3)=SQRT(PV(5,3)**2+PCM**2)
      PV(7,2)=TOF
      PV(7,3)=TOF
      PV(9,2)=0.
      PV(9,3)=0.
      PV(10,2)=0.
      PV(10,3)=0.
      GOTO (21,22,23,24),ISW
   21 PV(6,2)=1.
      PV(6,3)=-1.
      PV(8,2)=7.
      PV(8,3)=9.
      GOTO 25
   22 PV(6,2)=0.
      PV(6,3)=0.
      PV(8,2)=8.
      PV(8,3)=8.
      GOTO 25
   23 PV(6,2)=-1.
      PV(6,3)=0.
      PV(8,2)=9.
      PV(8,3)=8.
      GOTO 25
   24 PV(6,2)=0.
      PV(6,3)=0.
      PV(8,2)=1.
      PV(8,3)=1.
   25 NT=3
      IF(ATNO2.LT.1.5) GOTO 40
      AFC=0.312+0.200*LOG(LOG(S))+S**1.5/6000.
C     TARG=AFC*(ATNO2**0.33 -1.0)
      CFA=0.025*((ATNO2-1.)/120.)*EXP(-(ATNO2-1.)/120.)
      TARG=1.
      TEX=ENP(1)
      IF(TEX.LT.0.001) GOTO 445
      BLACK=(1.5+1.25*TARG)*ENP(1)/(ENP(1)+ENP(3))
      CALL POISSO(BLACK,NBL)
      IF(IFIX(TARG)+NBL.GT.ATNO2) NBL=ATNO2-TARG
      IF(NT+NBL.GT.MXGKPV-2) NBL=MXGKPV-2-NT
      IF(NBL.LE.0) GOTO 445
      EKIN=TEX/NBL
      EKIN2=0.
      CALL STEEP(XX)
      DO 441 I=1,NBL
      IF(NT.EQ.MXGKPV-2) GOTO 441
      IF(EKIN2.GT.TEX) GOTO 443
      CALL GRNDM(RNDM,1)
      RAN1=RNDM(1)
      CALL NORMAL(RAN2)
      EKIN1=-EKIN*LOG(RAN1)-CFA*(1.+0.5*RAN2)
      IF(EKIN1.LT.0.0) EKIN1=-0.010*LOG(RAN1)
      EKIN1=EKIN1*XX
      EKIN2=EKIN2+EKIN1
      IF(EKIN2.GT.TEX) EKIN1=TEX-(EKIN2-EKIN1)
      IF(EKIN1.LT.0.) EKIN1=0.001
      IPA1=16
      PNRAT=1.-ZNO2/ATNO2
      CALL GRNDM(RNDM,3)
      IF(RNDM(1).GT.PNRAT) IPA1=14
      NT=NT+1
      COST=-1.+RNDM(2)*2.
      SINT=SQRT(ABS(1.-COST*COST))
      PHI=TWPI*RNDM(3)
      IPA(NT)=-IPA1
      PV(5,NT)=ABS(RMASS(IPA1))
      PV(6,NT)=RCHARG(IPA1)
      PV(7,NT)=TOF
      PV(8,NT)=IPA1
      PV(9,NT)=0.
      PV(10,NT)=0.
      PV(4,NT)=EKIN1+PV(5,NT)
      PP=SQRT(ABS(PV(4,NT)**2-PV(5,NT)**2))
      PV(1,NT)=PP*SINT*SIN(PHI)
      PV(2,NT)=PP*SINT*COS(PHI)
      PV(3,NT)=PP*COST
  441 CONTINUE
  443 IF(ATNO2.LT.230.) GOTO 445
      IF(EK.GT.2.0) GOTO 445
      II=NT+1
      KK=0
      EKA=EK
      IF(EKA.GT.1.) EKA=EKA*EKA
      IF(EKA.LT.0.1) EKA=0.1
      IKA=IFIX(3.6/EKA)
      DO 444 I=1,NT
      II=II-1
      IF(IPA(II).NE.-14) GOTO 444
      IPA(II)=-16
      IPA1  = 16
      PV(5,II)=ABS(RMASS(IPA1))
      PV(6,II)=RCHARG(IPA1)
      PV(8,II)=IPA1
      KK=KK+1
      IF(KK.GT.IKA) GOTO 445
  444 CONTINUE
C**
C** THEN ALSO DEUTERONS, TRITONS AND ALPHAS
C**
  445 TEX=ENP(3)
      IF(TEX.LT.0.001) GOTO 40
      BLACK=(1.5+1.25*TARG)*ENP(3)/(ENP(1)+ENP(3))
      CALL POISSO(BLACK,NBL)
      IF(NT+NBL.GT.MXGKPV-2) NBL=MXGKPV-2-NT
      IF(NBL.LE.0) GOTO 40
      EKIN=TEX/NBL
      EKIN2=0.
      CALL STEEP(XX)
      DO 442 I=1,NBL
      IF(NT.EQ.MXGKPV-2) GOTO 442
      IF(EKIN2.GT.TEX) GOTO 40
      CALL GRNDM(RNDM,1)
      RAN1=RNDM(1)
      CALL NORMAL(RAN2)
      EKIN1=-EKIN*LOG(RAN1)-CFA*(1.+0.5*RAN2)
      IF(EKIN1.LT.0.0) EKIN1=-0.010*LOG(RAN1)
      EKIN1=EKIN1*XX
      EKIN2=EKIN2+EKIN1
      IF(EKIN2.GT.TEX) EKIN1=TEX-(EKIN2-EKIN1)
      IF(EKIN1.LT.0.) EKIN1=0.001
      CALL GRNDM(RNDM,3)
      COST=-1.+RNDM(1)*2.
      SINT=SQRT(ABS(1.-COST*COST))
      PHI=TWPI*RNDM(2)
      RAN=RNDM(3)
      IPA(NT+1)=-30
      IF(RAN.GT.0.60) IPA(NT+1)=-31
      IF(RAN.GT.0.90) IPA(NT+1)=-32
      INVE=ABS(IPA(NT+1))
      PV(5,NT+1)=RMASS(INVE)
      NT=NT+1
      PV(6,NT)=RCHARG(INVE)
      PV(7,NT)=TOF
      PV(8,NT)=ABS(IPA(NT))
      PV(9,NT)=0.
      PV(10,NT)=0.
      PV(4,NT)=PV(5,NT)+EKIN1
      PP=SQRT(ABS(PV(4,NT)**2-PV(5,NT)**2))
      PV(1,NT)=PP*SINT*SIN(PHI)
      PV(2,NT)=PP*SINT*COS(PHI)
      PV(3,NT)=PP*COST
  442 CONTINUE
   40 INTCT=INTCT+1.
      CALL SETCUR(2)
      NTK=NTK+1
      IF(NT.EQ.2) GO TO 9999
      DO 50 I=3,NT
      IF(NTOT.LT.NSIZE/12) GOTO 43
      GO TO 9999
   43 CALL SETTRK(I)
   50 CONTINUE
      CALL LENGTX(3,PP)
      IF(NPRT(3))
     *WRITE(NEWBCD,1001) XEND,YEND,ZEND,P,NCH,PP,PV(6,3)
1001  FORMAT(1H0,'PB ANNIHILATION AT REST  POSITION',3(1X,F8.2),1X,
     * 'PI MOMENTA,CHARGES',2(1X,F8.4,1X,F4.1))
C
 9999 CONTINUE
      END
