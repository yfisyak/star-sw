*
* $Id: coscat.F,v 1.1.1.3 2009/02/18 20:33:31 fisyak Exp $
*
* $Log: coscat.F,v $
* Revision 1.1.1.3  2009/02/18 20:33:31  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:39  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:18  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:58  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.38  by  S.Giani
*-- Author :
      SUBROUTINE COSCAT
C
C *** MOMENTUM GENERATION FOR COHERENT ELASTIC SCATTERING ***
C *** NVE 13-JUL-1988 CERN GENEVA ***
C
C ORIGIN : H.FESEFELDT (03-DEC-1986)
C
C APPROXIMATION OF BESSEL FUNCTION FOR TETA(LAB)<=20 DEG.
C IS USED . THE NUCLEAR RADIUS IS TAKEN AS R=1.25*E-13*(A)**1/3FM
C
#include "geant321/s_defcom.inc"
#include "geant321/s_coscom.inc"
#include "geant321/s_kginit.inc"
C
      EXTERNAL FCTCOS
      DIMENSION FF(20),ATNOX(3)
      DIMENSION RNDM(1)
C
      DATA ATNOX/9.,56.,207./
C
C --- INITIALIZATION INDICATED BY KGINIT(14) ---
      IF (KGINIT(14) .NE. 0) GO TO 10
      KGINIT(14)=1
C
      IF(.NOT.NPRT(10)) GOTO 10
      WRITE(NEWBCD,2001)
 2001 FORMAT(1H0,'DS/DT FOR COHERENT ELASTIC SCATTERING')
      DO 3 L=1,3
      WRITE(NEWBCD,2003) ATNOX(L),P
 2003 FORMAT(1H0,'CALCULATED CROSS SECTIONS FOR A=',F5.1,' AND P=',F8.2)
      DO 2 I=1,20
      TETA=(I-1)*PI/360.
      T=2.*P**2*(1.-COS(TETA*1.D0))
      IF(ATNOX(L).GT.62.) GOTO 4
      FF(I)=TWPI*ATNOX(L)**1.63*EXP(-14.5D0*ATNOX(L)**0.65*T)
     *     +TWPI*1.4*ATNOX(L)**0.33*EXP(-10.D0*T)
      GOTO 2
    4 FF(I)=TWPI*ATNOX(L)**1.33*EXP(-60.0D0*ATNOX(L)**0.33*T)
     *     +TWPI*0.4*ATNOX(L)**0.40*EXP(-10.D0*T)
    2 CONTINUE
      WRITE(NEWBCD,2004) FF
 2004 FORMAT(1H ,10E12.3)
    3 CONTINUE
   10 IF(P.LT.0.01) GO TO 9999
      IF(ATNO2.LT.0.5) GO TO 9999
      IER(46)=IER(46)+1
      RAN=RANRES(DUM)
      CALL VZERO(IPA(1),MXGKCU)
      IPA(1)=IPART
      IF(ATNO2.GT.62.) GOTO 11
      AA=ATNO2**1.63
      BB=14.5*ATNO2**0.66
      CC=1.4*ATNO2**0.33
      DD=10.
      AA=AA/BB
      CC=CC/DD
      RR=(AA+CC)*RAN
      GOTO 12
   11 AA=ATNO2**1.33
      BB=60.*ATNO2**0.33
      CC=0.4*ATNO2**0.40
      DD=10.
      AA=AA/BB
      CC=CC/DD
      RR=(AA+CC)*RAN
   12 T1=-LOG(RAN)/BB
      T2=-LOG(RAN)/DD
      EPS=0.001
      IND1=10
      CALL RTMI(T,VAL,FCTCOS,T1,T2,EPS,IND1,IER1)
      IF(IER1.EQ.0) GOTO 14
      T=0.25*(3.*T1+T2)
      IER(68)=IER(68)+1
   14 CALL GRNDM(RNDM,1)
      PHI=RNDM(1)*TWPI
      RR=0.5*T/P**2
      IF(RR.GT.1.) RR=0.
      COST=1.-RR
*     SINT=SQRT(MAX((1.-COST)*(1.+COST),0.))
      SINT=SQRT(MAX(RR*(2.-RR),0.))
      IF(SINT.NE.0.) THEN
      PV( 1,MXGKPV-1)=P*PX
      PV( 2,MXGKPV-1)=P*PY
      PV( 3,MXGKPV-1)=P*PZ
      PV( 4,MXGKPV-1)=EN
      PV( 5,MXGKPV-1)=AMAS
      PV( 6,MXGKPV-1)=NCH
      PV( 7,MXGKPV-1)=TOF
      PV( 8,MXGKPV-1)=IPART
      PV( 9,MXGKPV-1)=0.
      PV(10,MXGKPV-1)=USERW
      PV(1,1)=P*SINT*SIN(PHI)
      PV(2,1)=P*SINT*COS(PHI)
      PV(3,1)=P*COST
      PV(4,1)=EN
      PV(5,1)=AMAS
      PV(6,1)=NCH
      PV(7,1)=TOF
      PV(8,1)=IPART
      PV(9,1)=0.
      PV(10,1)=0.
      CALL DEFS1(1,MXGKPV-1,1)
      SINL1=SINL
      COSL1=COSL
      SINP1=SINP
      COSP1=COSP
      CALL SETCUR(1)
      ELSE
      SINL1=SINL
      COSL1=COSL
      SINP1=SINP
      COSP1=COSP
      ENDIF
      IF(NPRT(4))
     *WRITE(NEWBCD,1004) AMAS,P,SINL1,COSL1,SINP1,COSP1,SINL,COSL,
     *                   SINP,COSP,T1,T,T2,IER1
C
 1004 FORMAT(1H ,'COHERENT ELASTIC SCATTERING    MASS ',F8.3,' MOMENTUM
     * ',F8.3/1H ,'DIRECTION ',4F10.4,' CHANGED TO ',4F10.4/
     *1H ,'T1,T,T2 ',3E10.3,' IER1 ',I2)
C
 9999 CONTINUE
      END
