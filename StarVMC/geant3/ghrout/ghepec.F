*
* $Id: ghepec.F,v 1.1.1.3 2009/02/18 20:32:48 fisyak Exp $
*
* $Log: ghepec.F,v $
* Revision 1.1.1.3  2009/02/18 20:32:48  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:40  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:19  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:21:13  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.40  by  S.Giani
*-- Author :
      SUBROUTINE GHEPEC(LEDPAR)
C**
C** MOMENTUM CONSERVATION AT HIGH ENERGIES
C**
#include "geant321/mxgkgh.inc"
#include "geant321/s_prntfl.inc"
#include "geant321/s_blank.inc"
C
#if !defined(CERNLIB_SINGLE)
      DOUBLE PRECISION AHMF,BHMF
#endif
C**
      IF(LEDPAR.LE.0) RETURN
C**
      MX=MXGKPV-10
      MX5=MX+5
      MX6=MX+6
      MX7=MX+7
      MX9=MX+9
C**
C** APPLY CORRECTION ON LEADING PARTICLE
C**
        IF(NPRT(4))
     $     WRITE(NEWBCD,1002) LEDPAR,(PV(J,LEDPAR),J=1,10)
C**
        CALL SUB3(MX9,MXGKPV,MX5)
        CALL ANG(MXGKPV,LEDPAR,COST,TETA)
        CALL LENGTX(LEDPAR,PPP)
        PTLED=PPP*SQRT(1.-COST**2)
        CALL SUB3(LEDPAR,MX5,LEDPAR)
        CALL ANG(MXGKPV,LEDPAR,COST,TETA)
        CALL LENGTX(LEDPAR,PPP)
        PPP=PPP*COST
        CALL LENGTX(MXGKPV,PBEAM)
        PV(1,MX6)=PV(1,MXGKPV)*PPP/PBEAM
        PV(2,MX6)=PV(2,MXGKPV)*PPP/PBEAM
        PV(3,MX6)=PV(3,MXGKPV)*PPP/PBEAM
        CALL CROSS3(MXGKPV,LEDPAR,MX7)
        CALL CROSS3(MX7,MXGKPV,MX7)
        CALL LENGTX(MX7,PPP)
        PV(1,MX7)=PV(1,MX7)*PTLED/PPP
        PV(2,MX7)=PV(2,MX7)*PTLED/PPP
        PV(3,MX7)=PV(3,MX7)*PTLED/PPP
        CALL ADD3(MX6,MX7,LEDPAR)
        CALL LENGTX(LEDPAR,PPP)
        AHMF=PPP
        BHMF=PV(5,LEDPAR)
        PV(4,LEDPAR)=DSQRT(AHMF**2+BHMF**2)
C**
      IF(NPRT(4)) THEN
         WRITE(NEWBCD,1003) LEDPAR,(PV(J,LEDPAR),J=1,10)
      ENDIF
C**
      RETURN
 1002 FORMAT(1H ,'LEADING PARTICLE ',I3,2X,10F8.3)
 1003 FORMAT(1H ,'CORRECTED 4-VECT ',I3,2X,10F8.3)
 
      END
