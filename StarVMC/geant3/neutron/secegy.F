*
* $Id: secegy.F,v 1.1.1.3 2009/02/18 20:32:00 fisyak Exp $
*
* $Log: secegy.F,v $
* Revision 1.1.1.3  2009/02/18 20:32:00  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:43  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:21  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:21:58  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/04 23/02/95  14.46.01  by  S.Giani
*-- Author :
      SUBROUTINE SECEGY(EX,FSE,E,IFSE)
C       THIS ROUTINE SELECTS A PARTIAL ENERGY DISTRIBUTION
C       TO SAMPLE THE EXIT ENERGY FROM
#include "geant321/minput.inc"
      DIMENSION FSE(*),IFSE(*)
#if __GNUC__ < 7
      SAVE
#endif
      EX = 0.0
      IPP=1
      N=1
      IP=1
      R=FLTRNF(0)
      NK=IFSE(IP)
      PROB=0.
   10 IP=IP+1
      LF=IFSE(IP)
      IP=IP+1
C       TEMP FIX UP
      U=FSE(IP)
      IF(LF.EQ.11)U=FLOAT(IFSE(IP))
      IP=IP+1
      NR=IFSE(IP)
      IPR=IP
      IP=IP+1
      NP=IFSE(IP)
      IP=IP+2*NR
   20 CONTINUE
      DO 30 I=1,NP
         IP=IP+2
C       IF E IS LESS THAN THE LOWEST ENERGY OF THE MESH, THEN THE
C       PROBABILITY WILL EQUAL ZERO FOR SELECTING THAT DISTRIBUTION
         IF(E.LT.FSE(IP-1))GO TO 50
   30 CONTINUE
C       TRY THE NEXT PARTIAL DISTRIBUTION
   40 N=N+1
      IF(N.GT.NK)GO TO 170
      IF(LF.EQ.1)GO TO 100
      IF(LF.EQ.5)GO TO 120
      IF((LF.EQ.7).OR.(LF.EQ.9))GO TO 130
      GO TO 140
   50 IF(I.NE.1)GO TO 70
      IF(E+CADIG(E).LT.FSE(IP-1))GO TO 60
      E=E+CADIG(E)
      IP=IP-2
      GO TO 20
   60 CONTINUE
      IP=IP+(NP-1)*2
      GO TO 40
C       DETERMINE THE INTERPOLATING SCHEME
   70 CONTINUE
      DO 80 J=1,NR
         J1=IPR+2*J
         IF(I.LE.IFSE(J1))GO TO 90
   80 CONTINUE
   90 IS=IFSE(J1+1)
      CALL INTERP(E,P,FSE(IP-3),FSE(IP-2),FSE(IP-1),FSE(IP),IS)
      PROB=PROB+P
      IF(R.LE.PROB)GO TO 150
      IP=IP+2*(NP-I)
      GO TO 40
C       SKIP THE DATA FOR LF EQUAL ONE
  100 IP=IP+1
      NR=IFSE(IP)
      NE=IFSE(IP+1)
      IP=IP+2*NR+1
      DO 110 I=1,NE
         IP=IP+2
         NR=IFSE(IP)
         IP=IP+1
         NP=IFSE(IP)
         IP=IP+2*NR+2*NP
  110 CONTINUE
      GO TO 10
C       SKIP THE DATA FOR LF EQUAL FIVE
  120 IP=IP+1
      NR=IFSE(IP)
      NE=IFSE(IP+1)
      IP=IP+2*NR+1
      IP=IP+2*NE
      IP=IP+1
      NR=IFSE(IP)
      NF=IFSE(IP+1)
      IP=IP+2*NF+2*NR+1
      GO TO 10
C       SKIP THE DATA FOR LF EQUAL SEVEN, AND LF EQUAL NINE
  130 IP=IP+1
      NR=IFSE(IP)
      NE=IFSE(IP+1)
      IP=IP+2*NR+1
      IP=IP+2*NE
      GO TO 10
C       SKIP THE DATA FOR LF EQUAL ELEVEN
  140 IP=IP+1
      NR=IFSE(IP)
      NE=IFSE(IP+1)
      IP=IP+2*NR+1
      IP=IP+2*NE
      IP=IP+1
      NR=IFSE(IP)
      NE=IFSE(IP+1)
      IP=IP+2*NR+1
      IP=IP+2*NE
      GO TO 10
C       NOW SELECT THE SECONDARY ENERGY FROM THE CHOSEN DISTRIBUTION
  150 IP=IP+2*(NP-I)
  160 CONTINUE
      IF(LF.EQ.1)CALL SECLF1(FSE(IP+1),IFSE(IP+1),EX,U,E)
      IF(LF.EQ.5)CALL SECLF5(FSE(IP+1),IFSE(IP+1),EX,U,E)
      IF(LF.EQ.7)CALL SECLF7(FSE(IP+1),IFSE(IP+1),EX,U,E)
      IF(LF.EQ.9)CALL SECLF9(FSE(IP+1),IFSE(IP+1),EX,U,E)
      IF(LF.EQ.11)CALL SECL11(FSE(IP+1),IFSE(IP+1),EX,U,E)
      RETURN
  170 CONTINUE
#if defined(CERNLIB_MDEBUG)
      WRITE(IOUT,10000)R,PROB,E
10000 FORMAT(' MICAP: WARNING-SECONDARY ENERGY DISTRIBUTION NOT ',
     +       'CHOSEN IN SECEGY',1P3E11.4)
#endif
C       TEMP CARD
      LF=IFSE(IPP+1)
      U=FSE(IPP+2)
      IF(LF.EQ.11)U=FLOAT(IFSE(IPP+2))
      NR=IFSE(IPP+3)
      NP=IFSE(IPP+4)
      IP=2*NR+2*NP+5
      GO TO 160
      END
