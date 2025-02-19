*
* $Id: gekbin.F,v 1.1.1.1 2004/01/15 00:12:17 potekhin Exp $
*
* $Log: gekbin.F,v $
* Revision 1.1.1.1  2004/01/15 00:12:17  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:30:46  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:21:40  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.23  by  S.Giani
*-- Author :
      SUBROUTINE GEKBIN
C.
C.    ******************************************************************
C.    *                                                                *
C.    *       Routine to find bin number in kinetic energy table       *
C.    *       stored in ELOW(NEKBIN)                                   *
C.    *                                                                *
C.    *    ==>Called by : GBREME,GBREMM,GCOMP,GDRAY,GHEISH,GPAIRM,     *
C.    *                   GLTRAC,GTELEC,GTHADR,GTMUON                  *
C.    *       Author    R.Brun  *********                              *
C.    *                                                                *
C.    ******************************************************************
C.
#include "geant321/gctrak.inc"
#include "geant321/gcmulo.inc"
#include "geant321/gckine.inc"
#include "geant321/gconsp.inc"
C.
C.    ------------------------------------------------------------------
C.
      EK=GEKIN
      IF (ITRTYP.EQ.4.OR.ITRTYP.EQ.8) EK=GEKIN*PMASS/AMASS
      IF (EK.LT.ELOW(1)) THEN
         IEKBIN=1
         GEKRAT=0.
      ELSEIF (EK.GE.ELOW(NEK1)) THEN
         IEKBIN=NEKBIN
         GEKRAT=1.
      ELSE
         IEKBIN=GEKA*LOG10(EK) + GEKB
         GEKRAT=(EK-ELOW(IEKBIN))/(ELOW(IEKBIN+1)-ELOW(IEKBIN))
         GEKRAT=MIN(1.,MAX(GEKRAT,0.))
      ENDIF
C
      END
