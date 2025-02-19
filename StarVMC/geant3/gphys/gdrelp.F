*
* $Id: gdrelp.F,v 1.1.1.3 2009/02/18 20:31:46 fisyak Exp $
*
* $Log: gdrelp.F,v $
* Revision 1.1.1.3  2009/02/18 20:31:46  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/07/24 15:56:25  rdm
* initial import into CVS
*
* Revision 1.1.1.1  2002/06/16 15:18:40  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:20  fca
* AliRoot sources
*
* Revision 1.1.1.1  1995/10/24 10:21:24  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.21  by  S.Giani
*-- Author :
      SUBROUTINE G3DRELP(A,Z,DENS,T,DEDX)
C.
C.    ******************************************************************
C.    *                                                                *
C.    *  Calculates the mean 1/DENS*dE/dx of a  MUON  with kinetic     *
C.    *  energy T in an element of atomic number Z, atomic weight A    *
C.    *  and density DENS ( the density is just used for the           *
C.    *  calculation of the density effect in the case of high T).     *
C.    *                                                                *
C.    *   ------------------------------------------------------       *
C.    *   It calls GDRELP with the substitution EMMU -- > PMASS !      *
C.    *    ( and put back the right value of PMASS after)       !      *
C.    *   -----------------------------------------------------        *
C.    *                                                                *
C.    *    ==>Called by : G3DRELA                                      *
C.    *       Author    L.Urban    *********                           *
C.    *                                                                *
C.    ******************************************************************
C.
#include "geant321/gconsp.inc"
*
      CALL G3DRELX(A,Z,DENS,T,REAL(PMASS),DEDX)
*
      END
