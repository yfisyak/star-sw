*
* $Id: dmm55.F,v 1.2 2009/03/30 18:53:36 fisyak Exp $
*
* $Log: dmm55.F,v $
* Revision 1.2  2009/03/30 18:53:36  fisyak
* Switch from upper to lower error matrix packing
*
* Revision 1.1.1.3  2009/02/18 20:33:06  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:43  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:21  fca
* AliRoot sources
*
* Revision 1.1.1.1  1996/03/06 15:37:36  mclareni
* Add geane321 source directories
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.50  by  S.Giani
*-- Author :
      SUBROUTINE DMM55(A,B,C)
C *** ---------------------------------------------                     05/07/81
C *** MULTIPLICATION OF 5X5 MATRICES: A*B -> C.
C *** FOR:I,J=1,5   C(I,J)=SUM:K=1,5(A(I,K)B(K,J))
C *** NB: B AND C MAY WELL BE THE SAME MATRIX
C
C        Author: A. Haas (Freiburg University)
C
C *** ---------------------------------------------
      DOUBLE PRECISION A,B,C,B1J,B2J,B3J,B4J,B5J
      DIMENSION A(25),B(25),C(25)
#if 0
      DO 10 J5=5,25,5
      B5J=B(J5)
      J4=J5-1
      B4J=B(J4)
      J3=J4-1
      B3J=B(J3)
      J2=J3-1
      B2J=B(J2)
      J1=J2-1
      B1J=B(J1)
      C(J1)=A( 1)*B1J+A( 6)*B2J+A(11)*B3J+A(16)*B4J+A(21)*B5J
      C(J2)=A( 2)*B1J+A( 7)*B2J+A(12)*B3J+A(17)*B4J+A(22)*B5J
      C(J3)=A( 3)*B1J+A( 8)*B2J+A(13)*B3J+A(18)*B4J+A(23)*B5J
      C(J4)=A( 4)*B1J+A( 9)*B2J+A(14)*B3J+A(19)*B4J+A(24)*B5J
   10 C(J5)=A( 5)*B1J+A(10)*B2J+A(15)*B3J+A(20)*B4J+A(25)*B5J
*
#else
*     A'*B' -> C' => B*A -> C
      dimension D(25)
      call dcopy(B, D, 25)
      call dxmpy(D,A,C,5,5,5)
#endif
      END
