*
* $Id: dotnuc.F,v 1.1.1.1 2004/01/15 00:12:10 potekhin Exp $
*
* $Log: dotnuc.F,v $
* Revision 1.1.1.1  2004/01/15 00:12:10  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:30:15  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:21:06  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.40  by  S.Giani
*-- Author :
      SUBROUTINE DOTNUC(C,S,C2,S2,PR,I)
C
#if !defined(CERNLIB_SINGLE)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
#endif
      DIMENSION PR(50)
      K1 = 5*I - 4
      K2 = K1 + 1
      SA = PR(K1)
      SB = PR(K2)
      A      = SA*C - SB*S
      PR(K2) = SA*S + SB*C
      K2 = K2 + 1
      B = PR(K2)
      PR(K1) = A*C2 - B*S2
      PR(K2) = A*S2 + B*C2
      RETURN
      END
