*
* $Id: gscanu.F,v 1.1.1.3 2009/02/18 20:32:10 fisyak Exp $
*
* $Log: gscanu.F,v $
* Revision 1.1.1.3  2009/02/18 20:32:10  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/07/24 15:56:26  rdm
* initial import into CVS
*
* Revision 1.1.1.1  2002/06/16 15:18:41  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:20  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:21:36  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.31  by  S.Giani
*-- Author :
      SUBROUTINE G3SCANU
*
************************************************************************
*             SCAN utility called at the end of each tracking step     *
*             INWVOL is different from 0 when the track has reached    *
*                    a volume boundary                                 *
*                                                                      *
*          ==>Called by : <USER>,GUSTEP                                *
*             Author    R.Brun  *********                              *
************************************************************************
*
#include "geant321/gcbank.inc"
#include "geant321/gcscal.inc"
#include "geant321/gcmate.inc"
#include "geant321/gctrak.inc"
#include "geant321/gckine.inc"
#include "geant321/gcvolu.inc"
#include "geant321/gcscan.inc"
      SAVE ISLOLD,IDOLD,IDNUM
*
*     -----------------------------------------------------------------
*
      IF(SLENG.LE.0.)THEN
         SX0=0.
         SABS=0.
         ITETA=ITRA
         ISLOLD=0
         IDOLD=0
      ENDIF
      SX0=SX0+STEP/RADL
      SABS=SABS+STEP/ABSL
      IF(INWVOL.NE.2)THEN
*
*            Compute new ISL,IDET
         ISL=0
         INEW=0
         DO 20 IL=NLEVEL,1,-1
            DO 10 I=1,NSLIST
               IF(NAMES(IL).EQ.ISLIST(I))THEN
                  ISL=I
                  IDNUM=NUMBER(IL)
                  IF(IL.EQ.NLEVEL.OR.IDNUM.NE.IDOLD)INEW=1
                  GO TO 30
               ENDIF
  10        CONTINUE
  20     CONTINUE
  30     CONTINUE
         IF(INWVOL.EQ.3.OR.ISL.NE.ISLOLD.OR.INEW.NE.0)THEN
            CALL G3SSCAN(ISLOLD,IDOLD)
            IDOLD=IDNUM
            ISLOLD=ISL
         ENDIF
      ENDIF
*
      CALL G3DEBUG
*
      END
