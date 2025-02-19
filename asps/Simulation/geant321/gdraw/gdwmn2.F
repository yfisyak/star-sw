*
* $Id: gdwmn2.F,v 1.1.1.1 2004/01/15 00:12:06 potekhin Exp $
*
* $Log: gdwmn2.F,v $
* Revision 1.1.1.1  2004/01/15 00:12:06  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:43  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:29  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.27  by  S.Giani
*-- Author :
      SUBROUTINE GDWMN2(U0,V0)
C.
C.    ******************************************************************
C.    *                                                                *
C.    *       Draw a 2D-Lady at position (U0,V0)                       *
C.    *                                                                *
C.    *    ==>Called by : <USER>, <GXINT>, GDSPEC                      *
C.    *       Source adapted from GDGIRL                               *
C.    *       Author : H. Plothow-Besch/CERN-PPE                       *
C.    *                                                                *
C.    ******************************************************************
C.
#include "geant321/gcdraw.inc"
      DIMENSION U(17),V(17),LEN(11),UN(17,11),VN(17,11)
      DIMENSION UN1(17),VN1(17),UN2( 8),VN2( 8)
      DIMENSION UN3( 7),VN3( 7),UN4(13),VN4(13)
      DIMENSION UN5( 9),VN5( 9),UN6(11),VN6(11)
      DIMENSION UN7( 5),VN7( 5),UN8(12),VN8(12)
      DIMENSION UN9( 7),VN9( 7),UN10( 8),VN10( 8)
      DIMENSION UN11(10),VN11(10)
C
      EQUIVALENCE (UN1(1),UN(1,1)),(VN1(1),VN(1,1))
      EQUIVALENCE (UN2(1),UN(1,2)),(VN2(1),VN(1,2))
      EQUIVALENCE (UN3(1),UN(1,3)),(VN3(1),VN(1,3))
      EQUIVALENCE (UN4(1),UN(1,4)),(VN4(1),VN(1,4))
      EQUIVALENCE (UN5(1),UN(1,5)),(VN5(1),VN(1,5))
      EQUIVALENCE (UN6(1),UN(1,6)),(VN6(1),VN(1,6))
      EQUIVALENCE (UN7(1),UN(1,7)),(VN7(1),VN(1,7))
      EQUIVALENCE (UN8(1),UN(1,8)),(VN8(1),VN(1,8))
      EQUIVALENCE (UN9(1),UN(1,9)),(VN9(1),VN(1,9))
      EQUIVALENCE (UN10(1),UN(1,10)),(VN10(1),VN(1,10))
      EQUIVALENCE (UN11(1),UN(1,11)),(VN11(1),VN(1,11))
C
      SAVE LEN,UN1,VN1,UN2,VN2,UN3,VN3,UN4,VN4,UN5,VN5,UN6,VN6
      SAVE     UN7,VN7,UN8,VN8,UN9,VN9,UN10,VN10,UN11,VN11
 
      DATA LEN/17, 8, 7, 13, 9, 11, 5, 12, 7, 8, 10/
 
*     Dress
      DATA UN1/ 0.9, 0.6, 1.0, 1.0,-0.1, -0.6, -0.9,-0.5,-0.8, -1.0,
     +         -0.7 , -0.1 , 0.25, 1.4, 0.95, 0.9, 0.9/
      DATA VN1/ 0.8, 1.5, 2.4, 3.4, 2.5,  3.4,  2.4, 1.4, 0.6, -2.3,
     +         -2.25, -2.15,-2.1 ,-1.9,-1.0 , 0.4, 0.8/
 
*     RArm
      DATA UN2/ 0.9, 0.9, 1.6, 1.3, 1.0, 1.0, 1.2, 0.9/
      DATA VN2/ 0.8, 0.4, 1.5, 3.2, 3.4, 2.4, 1.5, 0.8/
 
*     Collar
      DATA UN3/-0.1,  1.0,  0.6,-0.1, -0.25, -0.6,-0.1/
      DATA VN3/ 2.5,  3.4,  3.5, 2.5,  3.5 ,  3.4, 2.5/
 
*     Head
      DATA UN4/-0.1,-0.6,-0.25,-0.1,-0.1,-0.3,-0.5,-0.20, 0.2, 0.4, 0.6,
     +          1.0,-0.1/
      DATA VN4/ 2.5, 3.4, 3.5 , 3.6, 3.7, 3.7, 4.2, 4.75, 4.6, 3.6, 3.5,
     +          3.4, 2.5/
 
*     Hair
      DATA UN5/ 0.2, 1.0,  1.0, 1.25, 1.25, 1.0, 0.6, 0.4, 0.2/
      DATA VN5/ 4.6, 4.3,  3.9, 3.6 , 3.3 , 3.4, 3.5, 3.6, 4.6/
 
*     Hardhead
      DATA UN6/0.2,-0.4,-0.7,-0.25, 0.0, 0.4 , 0.8, 1.1, 1.1, 1.0, 0.2/
      DATA VN6/4.6, 4.8, 4.9, 4.85, 5.1, 5.15, 5.0, 4.7, 4.3, 4.3, 4.6/
 
*     LArm
      DATA UN7/-0.8 , -0.6, -0.8, -1.0, -0.8 /
      DATA VN7/ 2.7 ,  3.4,  3.3,  3.0,  2.7 /
 
*     Paper
      DATA UN8/-0.8 ,-1.0,-1.3 ,-1.6,-0.9,-0.9,-0.75,-0.7 ,
     +         -0.6 ,-0.5, -0.9,-0.8 /
      DATA VN8/ 2.7 , 3.0, 3.5 , 2.7, 1.6, 1.4, 1.2 , 1.3 ,
     +          1.15, 1.4,  2.4, 2.7 /
 
*     LHand
      DATA UN9/-0.9, -0.9, -0.75, -0.7 , -0.55, -0.95, -0.9/
      DATA VN9/ 1.6,  1.4,  1.2 ,  1.3 ,  1.45,  2.0 ,  1.6/
 
*     RLeg
      DATA UN10/-0.7 ,-0.6,-0.8,-0.3,-0.4, 0.0,-0.1 ,-0.7 /
      DATA VN10/-2.25,-3.8,-5.4,-4.7,-4.3,-3.0,-2.15,-2.25/
 
*     LLeg
      DATA UN11/-0.1 , 0.0,-0.15, 0.2, 0.0, 0.2, 0.5, 0.4, 0.25,-0.1 /
      DATA VN11/-2.15,-3.0,-3.4 ,-4.4,-5.0,-5.2,-4.4,-4.2,-2.1 ,-2.15/
C.    ------------------------------------------------------------------
C.
      DO 20 I=1,11
         JMAX=LEN(I)
         DO 10 J=1,JMAX
            U(J)=UN(J,I)*20.0*0.83*GSCU*GZUA+U0
            V(J)=VN(J,I)*20.0*0.83*GSCV*GZVA+V0
C
C             Normalize to PLTRNX,PLTRNY
C
            U(J)=U(J)*PLTRNX/20.
            V(J)=V(J)*PLTRNY/20.
   10    CONTINUE
         CALL GDRAWV(U,V,JMAX)
   20 CONTINUE
      END
