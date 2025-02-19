*
* $Id: cangle.F,v 1.1.1.3 2009/02/18 20:32:06 fisyak Exp $
*
* $Log: cangle.F,v $
* Revision 1.1.1.3  2009/02/18 20:32:06  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:43  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:21  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:21:55  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/04 23/02/95  14.46.01  by  S.Giani
*-- Author :
      SUBROUTINE CANGLE(D,LD,E,FM,LEN)
C       THIS ROUTINE SELECTS THE SCATTERING ANGLE AT A COLLISION
      DIMENSION D(*),LD(*)
#if __GNUC__ < 7
      SAVE
#endif
      I=0
      IPP=1
      NR=LD(IPP)
      NE=LD(IPP+1)
      NR2=2*NR
      IP=2+NR2
      INT=LD(IP)
   10 IP=IP+1
      I=I+1
      EINCD=D(IP)
      IF(E.LE.EINCD)GO TO 30
      IP1=IP
      IP=IP+1
      NP=LD(IP)
      IP=IP+2*NP
      IF(IP.GE.LEN)GO TO 20
      GO TO 10
C       E IS GREATER THAN THE LAST INCIDENT ENERGY
C       USE THE LAST DISTRIBUTION
   20 IP=IP-2*NP-1
      GO TO 70
   30 IF(I.EQ.1)GO TO 60
C       CHOOSE WHICH DISTRIBUTION TO SAMPLE FROM
C       THE INTERPOLATION SCHEME IS ASSUMED LINEAR-LINEAR IF IT
C       IS NOT EQUAL TO THREE (LINEAR-LOG).  THIS IS GENERALLY TRUE
      IF(INT.NE.3)GO TO 40
      PROB=ALOG(EINCD/E)/ALOG(EINCD/D(IP1))
   40 PROB=(EINCD-E)/(EINCD-D(IP1))
      R=FLTRNF(0)
      IF(R.LE.PROB)GO TO 50
C       SELECT FROM THE SECOND DISTRIBUTION
      NP=LD(IP+1)
      GO TO 70
C       SELECT FROM THE FIRST DISTRIBUTION
   50 IP=IP1
      GO TO 70
C       E IS LESS THAN THE FIRST INCIDENT ENERGY
C       USE THE FIRST DISTRIBUTION
   60 NP=LD(IP+1)
   70 CONTINUE
      PROB1=0.0
      R=FLTRNF(0)
      DO 80 I=2,NP
         N=IP+2*I+1
         A1=D(N-3)
         IF(R.LE.D(N))GO TO 90
         PROB1=D(N)
   80 CONTINUE
      FM=1.0
      RETURN
   90 FM=A1+(R-PROB1)*(D(N-1)-A1)/(D(N)-PROB1)
      IF(ABS(FM).GT.1.) FM = 1.0
      RETURN
      END
