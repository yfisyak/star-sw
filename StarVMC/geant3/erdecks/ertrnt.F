*
* $Id: ertrnt.F,v 1.2 2011/02/11 15:51:14 fisyak Exp $
*
* $Log: ertrnt.F,v $
* Revision 1.2  2011/02/11 15:51:14  fisyak
* Merge with latest updates
*
* Revision 1.1.1.1  2002/06/16 15:18:36  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:15  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 15:37:35  mclareni
* Add geane321 source directories
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.49  by  S.Giani
*-- Author :
      SUBROUTINE ERTRNT
C.
C.    ******************************************************************
C.    *                                                                *
C.    *    Average neutral track is extrapolated by one step           *
C.    *                                                                *
C.    *    ==>Called by : ERTRGO                                       *
C.    *       Original routine : GTNINO                                *
C.    *       Authors   M.Maire, E.Nagy  *********                     *
C.    *                                                                *
C.    ******************************************************************
C.
#include "geant321/ertrio.inc"
#include "geant321/gconst.inc"
#include "geant321/gctmed.inc"
#include "geant321/gctrak.inc"
*
* *** Compute point where to store error matrix
*
      STEPER = BIG
      DO 20 IPR = 1,NEPRED
         STEPE  = BIG
c         IF (LELENG) STEPE = ERLENG(IPR) - SLENG
         IF (LEPLAN) THEN
            SCAL1 = 0.
            SCAL2 = 0.
            DO 18 I=1,3
               SCAL1 = SCAL1 + ERPLO(I,4,IPR)*(ERPLO(I,3,IPR)-VECT(I))
               SCAL2 = SCAL2 + ERPLO(I,4,IPR)*VECT(I+3)
   18       CONTINUE
            STEPE = SCAL1/SCAL2
         ENDIF
         IF (STEPE.LE.PREC) STEPE = BIG
c *********************
c     A. Rotondi and L. Lavezzi (sept 2010)
c     when leleng (track length propagation) 
c     if track length (ERLENG) <= 0 then the
c     particle must not move; else if the step
c     is <= PREC it is set = to it
         IF (LELENG) THEN
            STEPE = ERLENG(IPR) - SLENG
            IF(ERLENG(IPR).LE.0.) THEN
               STEPE = 0
            ELSE IF(STEPE.LE.PREC) THEN
               STEPE = PREC
            ENDIF
         ENDIF
c *********************

         IF (STEPE.LT.STEPER) THEN
            STEPER = STEPE
            INLIST = IPR
         ENDIF
   20 CONTINUE
*
      STEP = BIG
      CALL GTNEXT
*
      IF(STEPER.LT.SNEXT) THEN
         STEP = STEPER
         INWVOL = 0
         IMEC   = 27
         NMEC   = NMEC + 1
         LMEC(NMEC) = IMEC
      ELSE
         STEP = SNEXT + PREC
         INWVOL = 2
         IMEC   = 1
         NMEC   = NMEC + 1
         LMEC(NMEC) = IMEC
         IF ((STEPER-SNEXT).LE.(2*PREC)) THEN
            IMEC   = 27
            NMEC   = NMEC + 1
            LMEC(NMEC) = IMEC
         ENDIF
      ENDIF
*
* *** Linear transport
*
      DO 25 I=1,3
         VECT(I) = VECT(I) + STEP*VECT(I+3)
   25 CONTINUE
*
      SLENG = SLENG + STEP
*
* *** Propagate error matrix
*
      IF (.NOT. LEONLY) CALL ERPROP
*
* *** Store informations
*
      IF(IMEC.EQ.27) CALL ERSTOR
*
      END
