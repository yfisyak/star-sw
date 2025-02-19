*
* $Id: ang.F,v 1.1.1.1 2004/01/15 00:12:09 potekhin Exp $
*
* $Log: ang.F,v $
* Revision 1.1.1.1  2004/01/15 00:12:09  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:30:10  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:21:07  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.38  by  S.Giani
*-- Author :
C
C *** VARIOUS VECTOR OPERATIONS ***
C
C COPIED FROM F14BLO.PAMLIB 23.4.82
C AUTHOR: V.BLOBEL (UNIVERSITY OF HAMBURG)
C DESYLIB
C
C *** BLANK COMMON REPLACED BY /VECUTY/ TO MATCH GEANT/GHEISHA CODE ***
C *** NOTE THAT P(10,100) HAS BECOME PV(10,200) DUE TO THIS         ***
C
C UN-USED ENTRIES REMOVED :
C     "PCOP" "PEXC" "PZER" "PWRT" "DOT4" "IMPU" "IMPULI" "ADD3"
C     "SUB3" "CROSS" "DOT" "SMUL" "NORZ" "PARPER" "PUNIT" "TRAP"
C
C *** ALL ENTRIES RE-WRITTEN AS SUBROUTINES USING ONLY NECESSARY ***
C *** "DOUBLE PRECISION" STMTS. AND ALL SPECIFIC FUNCTIONS HAVE  ***
C *** BEEN CHANGED TO THEIR GENERIC EQUIVALENCES                 ***
C *** NVE 29-MAR-1988 CERN GENEVA ***
C
C ORIGIN : H.FESEFELDT (22-JUNE-1984)
C
      SUBROUTINE ANG(K,L,U,V)
C
C --- PV-ARRAY ---
#include "geant321/mxgkgh.inc"
#include "geant321/s_blankp.inc"
C
      DOUBLE PRECISION A,B,C,D
C
      A=0.0
      B=0.0
      C=0.0
      DO 38 I=1,3
      A=A+PV(I,K)*PV(I,K)
      B=B+PV(I,L)*PV(I,L)
      C=C+PV(I,K)*PV(I,L)
 38   CONTINUE
      D=SQRT(A*B)
      IF (D .NE. 0.0) D=C/D
      IF (ABS(D) .GT. 1.D0) D=SIGN(1.D0,D)
      U=D
      V=ACOS(D)
      RETURN
      END
