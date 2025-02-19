*
* $Id: erprop.F,v 1.5 2013/02/22 20:14:17 fisyak Exp $
*
* $Log: erprop.F,v $
* Revision 1.5  2013/02/22 20:14:17  fisyak
* Freeze
*
* Revision 1.1.1.1  2002/06/16 15:18:35  hristov
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
      SUBROUTINE ERPROP
C.
C.    ******************************************************************
C.    *                                                                *
C.    *       Performs the error propagation in a step                 *
C.    *                                                                *
C.    *    ==>Called by : ERTRCH / ERTRNT                              *
C.    *       Author    E.Nagy  *********                              *
C.    *                                                                *
C.    ******************************************************************
C.
#include "geant321/gctmed.inc"
#include "geant321/gckine.inc"
#include "geant321/gctrak.inc"
#include "geant321/gcunit.inc"
#include "geant321/erwork.inc"
#include "geant321/ertrio.inc"
#include "geant321/trcom3.inc"
*
#ifndef SINGLEFIELD
      DOUBLE PRECISION VECTD(3), HFD(3)
#endif
      DIMENSION DUM(15)
*
* *** Prepares the end-point
*
      DO 11 I = 1,3
         XF(I) = VECT(I)
         PF(I) = VECT(7)*VECT(3+I)
         HF(I) = 0.
   11 CONTINUE
*
      IF (IFIELD.EQ.3) THEN
         HF(3) = FIELDM
      ELSEIF (IFIELD.NE.0) THEN
#ifdef SINGLEFIELD
         CALL GUFLD (VECT, HF)
#else
         DO J=1,3
            VECTD(J)=VECT(J)
         END DO
         CALL GUFLD(VECTD, HFD)
         DO J=1,3
            HF(J)=HFD(J)
         END DO
#endif
      ENDIF
*
* *** Propagates the error (in SC-variables)
*
      MVAR  = 0
      IFLAG = 0
      ITRAN = 0
      IF (.NOT.LEEXAC) THEN
         CALL TRPROP (XI ,PPI, HI, XF, PF, HF, CHTR, STEP, DUM,
     &                MVAR, IFLAG, ITRAN, IERR)
      ELSE
         CALL TRPRFN (XI ,PPI, HI, XF, PF, HF, CHTR, STEP, DUM,
     &                MVAR, IFLAG, ITRAN, IERR)
      ENDIF
*
      IF(IERR.NE.0) THEN
c     added by A. Rotondi and L. Lavezzi (may 2010): the flag
c     NOPRNT has been added to the common ERTRIO1 to be
c     able to prevent the IERR related message from being
c     printed out (default is on):
         IF(NOPRNT.NE.1) WRITE (LOUT, 778) IERR
c     
c     added by A. Rotondi and L. Lavezzi (01/04/2010) to update
c     the XI, PPI, HI even when the error calculation fails
         IF(IERR.EQ.3) THEN
            CALL UCOPY (XF, XI, 3)
            CALL UCOPY (PF, PPI, 3)
            CALL UCOPY (HF, HI, 9)
         ENDIF
c     end
         RETURN
      ENDIF
*
* *** Transport the matrix
*
      CALL SSMT5T (A, EF, EF)
*
      IF (CHARGE.NE.0.) THEN
*
* ***    Add multiple scattering
*
         CALL ERMCSC (EF)
*
* ***    Add fluctuation due to ionization to the error matrix
*          (and (later) due to bremsstrahlung and pair-production)
*
          EF(1) = EF(1) + (GETOT*GETOT*DEDX2)/(VECT(7)**6)
*
      ENDIF
*
* *** Copy variables for the next step
*
      CALL UCOPY (XF, XI, 3)
      CALL UCOPY (PF, PPI, 3)
      CALL UCOPY (HF, HI, 9)
*
*
  778 FORMAT(//4X,' *** Error in subr. TRPROP',I4,'  called by',
     &                'subr. ERPROP'//)
*
      END
