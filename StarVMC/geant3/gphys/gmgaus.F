*
* $Id: gmgaus.F,v 1.1.1.3 2009/02/18 20:31:46 fisyak Exp $
*
* $Log: gmgaus.F,v $
* Revision 1.1.1.3  2009/02/18 20:31:46  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/07/24 15:56:25  rdm
* initial import into CVS
*
* Revision 1.1.1.1  2002/06/16 15:18:41  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:20  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:21:26  cernlib
* Geant
*
*
*    EX GMUL
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.22  by  S.Giani
*-- Author :
      SUBROUTINE G3MGAUS(BETA2,DIN)
C.
C.    ******************************************************************
C.    *                                                                *
C     *       Compute multiple scattering angles for a particle        *
C.    *       with parameters VECT in common /GCTRAK/                  *
C.    *       in current medium described in common /GCMATE/           *
C.    *       Output angles overwrite VECT                             *
C.    *                                                                *
C.    *    ==>Called by : G3MULTS                                      *
C.    *       Authors    R.Brun, M.Maire, G.Lynch  *********           *
C.    *                                                                *
C.    ******************************************************************
C.
#include "geant321/gctrak.inc"
#include "geant321/gcphys.inc"
#include "geant321/gcmulo.inc"
#include "geant321/gconsp.inc"
      DIMENSION DIN(3),RNDM(3)
*
*     ------------------------------------------------------------------
*
* *** Computes mean deviation angles in radian
*
*     Scattering corresponding to OMEGA0 = 4E4 scatters and F=0.98.
*
      SIGMA  = 2.557 * CHCMOL*SQRT(STMULS)/(GETOT*BETA2)
*
      CALL GRNDM(RNDM,3)
      PHI = TWOPI*RNDM(2)
      THETA  = SIGMA*SQRT(-2.*LOG(RNDM(1)))
      IF(RNDM(3).GT.0.5)THETA=-THETA
      SINT   = SIN(THETA)
      DIN(1) = SINT*SIN(PHI)
      DIN(2) = SINT*COS(PHI)
      DIN(3) = COS(THETA)
*
      END
