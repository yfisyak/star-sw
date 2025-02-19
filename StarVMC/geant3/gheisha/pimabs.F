*
* $Id: pimabs.F,v 1.1.1.3 2009/02/18 20:33:30 fisyak Exp $
*
* $Log: pimabs.F,v $
* Revision 1.1.1.3  2009/02/18 20:33:30  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:40  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:19  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:59  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.38  by  S.Giani
*-- Author :
      SUBROUTINE PIMABS(NOPT)
C
C *** CHARGED PION ABSORPTION BY A NUCLEUS ***
C *** NVE 04-MAR-1988 CERN GENEVA ***
C
C ORIGIN : H.FESEFELDT (09-JULY-1987)
C
C PANOFSKY RATIO (PI- P --> N PI0/PI- P --> N GAMMA) = 3/2
C FOR CAPTURE ON PROTON (HYDROGEN),
C STAR PRODUCTION FOR HEAVIER ELEMENTS
C
#include "geant321/s_defcom.inc"
      DIMENSION RNDM(4)
      SAVE NT
C
      CALL COMPO
      PV(1,1)=0.
      PV(2,1)=0.
      PV(3,1)=0.
      PV(4,1)=RMASS(9)
      PV(5,1)=RMASS(9)
      PV(6,1)=-1.
      PV(7,1)=TOF
      PV(8,1)=IPART
      PV(9,1)=0.
      PV(10,1)=USERW
      IER(87)=IER(87)+1
      IF(ATNO2.GT.1.5) GOTO 30
      CALL GRNDM(RNDM,2)
      RAN=RNDM(1)
      ISW=1
      IF(RAN.LT.0.33) ISW=2
      NOPT=ISW
      RAN=RNDM(2)
      TOF1=-25.*LOG(RAN)
      TOF1=20.*TOF1
      IF(ISW.EQ.1) GOTO 20
      PCM=0.02
      CALL GRNDM(RNDM,2)
      PHI=2.*PI*RNDM(1)
      COST=-1.+2.*RNDM(2)
      SINT=SQRT(ABS(1.-COST*COST))
      PV(1,2)=PCM*SINT*COS(PHI)
      PV(2,2)=PCM*SINT*SIN(PHI)
      PV(3,2)=PCM*COST
      PV(4,2)=PCM
      PV(5,2)=0.
      PV(7,2)=TOF+TOF1
      PV(9,2)=0.
      PV(10,2)=0.
      PV(6,2)=0.
      PV(8,2)=1.
      GOTO 21
   20 PV(1,2)=PV(1,1)
      PV(2,2)=PV(2,1)
      PV(3,2)=PV(3,1)
      PV(4,2)=PV(4,1)
      PV(5,2)=PV(5,1)
      PV(6,2)=0.
      PV(7,2)=TOF+TOF1
      PV(8,2)=8.
      PV(9,2)=0.
      PV(10,2)=0.
   21 INTCT=INTCT+1.
      CALL SETCUR(2)
      NTK=NTK+1
      IF(NPRT(3))
     *WRITE(NEWBCD,1002) XEND,YEND,ZEND,P,NCH
1002  FORMAT(1H0,'PION ABSORBTION   POSITION',3(2X,F8.2),2X,
     * 'PI0/GAMMA MOMENTUM,CHARGE',2X,F8.4,2X,F4.1)
      GO TO 9999
C**
C** STAR PRODUCTION FOR PION ABSORPTION IN HEAVY ELEMENTS
C**
   30 ENP(1)=0.0135
      ENP(3)=0.0058
      NT=1
      TEX=ENP(1)
      BLACK=0.5*LOG(ATNO2)
      CALL POISSO(BLACK,NBL)
      IF(NBL.LE.0) NBL=1
      IF(NPRT(3))
     *WRITE(NEWBCD,3003) NBL,TEX
      IF(NT+NBL.GT.MXGKPV-2) NBL=MXGKPV-2-NT
      EKIN=TEX/NBL
      EKIN2=0.
      DO 31 I=1,NBL
      IF(NT.EQ.MXGKPV-2) GOTO 31
      CALL GRNDM(RNDM,4)
      RAN2=RNDM(1)
      EKIN1=-EKIN*LOG(RAN2)
      EKIN2=EKIN2+EKIN1
      IPA1=16
      PNRAT=1.-ZNO2/ATNO2
      IF(RNDM(2).GT.PNRAT) IPA1=14
      NT=NT+1
      COST=-1.+RNDM(3)*2.
      SINT=SQRT(ABS(1.-COST*COST))
      PHI=TWPI*RNDM(4)
      IPA(NT)=-IPA1
      PV(5,NT)=ABS(RMASS(IPA1))
      PV(6,NT)=RCHARG(IPA1)
      PV(7,NT)=2.
      PV(4,NT)=EKIN1+PV(5,NT)
      PP=SQRT(ABS(PV(4,NT)**2-PV(5,NT)**2))
      PV(1,NT)=PP*SINT*SIN(PHI)
      PV(2,NT)=PP*SINT*COS(PHI)
      PV(3,NT)=PP*COST
      IF(EKIN2.GT.TEX) GOTO 33
   31 CONTINUE
   33 TEX=ENP(3)
      BLACK=0.50*LOG(ATNO2)
      CALL POISSO(BLACK,NBL)
      IF(NT+NBL.GT.MXGKPV-2) NBL=MXGKPV-2-NT
      IF(NBL.LE.0) NBL=1
      EKIN=TEX/NBL
      EKIN2=0.
      IF(NPRT(3))
     *WRITE(NEWBCD,3004) NBL,TEX
      DO 32 I=1,NBL
      IF(NT.EQ.MXGKPV-2) GOTO 32
      CALL GRNDM(RNDM,4)
      RAN2=RNDM(1)
      EKIN1=-EKIN*LOG(RAN2)
      EKIN2=EKIN2+EKIN1
      NT=NT+1
      COST=-1.+RNDM(2)*2.
      SINT=SQRT(ABS(1.-COST*COST))
      PHI=TWPI*RNDM(3)
      RAN=RNDM(4)
      IPA(NT)=-30
      IF(RAN.GT.0.60) IPA(NT)=-31
      IF(RAN.GT.0.90) IPA(NT)=-32
      INVE=ABS(IPA(NT))
      PV(5,NT)=RMASS(INVE)
      PV(6,NT)=RCHARG(INVE)
      PV(7,NT)=2.
      PV(4,NT)=PV(5,NT)+EKIN1
      PP=SQRT(ABS(PV(4,NT)**2-PV(5,NT)**2))
      PV(1,NT)=PP*SINT*SIN(PHI)
      PV(2,NT)=PP*SINT*COS(PHI)
      PV(3,NT)=PP*COST
      IF(EKIN2.GT.TEX) GOTO 40
   32 CONTINUE
C**
C** STORE ON EVENT COMMON
C**
   40 CALL GRNDM(RNDM,1)
      RAN=RNDM(1)
      TOF1=-25.*LOG(RAN)
      TOF1=20.*TOF1
      DO 41 I=2,NT
      IF(PV(7,I).LT.0.) PV(5,I)=-PV(5,I)
      PV(7,I)=TOF+TOF1
      PV(8,I)=ABS(IPA(I))
      PV(9,I)=0.
   41 PV(10,I)=0.
      INTCT=INTCT+1.
      CALL SETCUR(2)
      NTK=NTK+1
      IF(NT.EQ.2) GO TO 9999
      DO 50 I=3,NT
      IF(NTOT.LT.NSIZE/12) GOTO 43
      GO TO 9999
   43 CALL SETTRK(I)
   50 CONTINUE
C
 3003 FORMAT(1H ,I3,' BLACK TRACK PARTICLES PRODUCED WITH TOTAL KINETIC
     * ENERGY OF ',F8.3,' GEV')
 3004 FORMAT(1H ,I5,' HEAVY FRAGMENTS WITH TOTAL ENERGY OF',F8.4,' GEV')
C
 9999 CONTINUE
      END
