*
* $Id: twopad.F,v 1.1.1.3 2009/02/18 20:33:23 fisyak Exp $
*
* $Log: twopad.F,v $
* Revision 1.1.1.3  2009/02/18 20:33:23  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:37  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:16  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:20:02  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.44  by  S.Giani
*-- Author :
*$ CREATE TWOPAD.FOR
*COPY TWOPAD
*
*=== twopad ===========================================================*
*
      SUBROUTINE TWOPAD(UMO,ECM1,ECM2,PCM1,PCM2,COD1,COF1,SIF1,
     *COD2,COF2,SIF2,AM1,AM2)
 
#include "geant321/dblprc.inc"
#include "geant321/dimpar.inc"
#include "geant321/iounit.inc"
      REAL RNDM(1)
C*****TWO PARTICLE DECAY IN THE CM - SYSTEM
      COMMON /FKGAMR/ REDU,AMO,AMM(15 )
      UMO2=UMO*UMO
      AM11=AM1*AM1
      AM22=AM2*AM2
      ECM1=(UMO2+AM11-AM22)/(2.D0*UMO)
      ECM2=UMO-ECM1
      WAU=ECM1**2-AM11
      IF (WAU.LT.0.D0) REDU=REDU-5.D0
      WAU=ABS(WAU)
      PCM1=SQRT(WAU)
      PCM2=PCM1
      CALL COSI(SIF1,COF1)
      CALL GRNDM(RNDM,1)
      COD1=RNDM(1)
      COD1=2.D0*COD1-1.D0
      COD2=-COD1
      COF2=-COF1
      SIF2=-SIF1
      RETURN
      END
