*
* $Id: sub.F,v 1.1.1.3 2009/02/18 20:33:31 fisyak Exp $
*
* $Log: sub.F,v $
* Revision 1.1.1.3  2009/02/18 20:33:31  fisyak
* *** empty log message ***
*
* Revision 1.1.1.1  2002/06/16 15:18:40  hristov
* Separate distribution  of Geant3
*
* Revision 1.1.1.1  1999/05/18 15:55:19  fca
* AliRoot sources
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
      SUBROUTINE SUB(K,L,M)
C
C --- PV-ARRAY ---
#include "geant321/mxgkgh.inc"
#include "geant321/s_blankp.inc"
C
      DOUBLE PRECISION A,B
C
      A=PV(4,K)-PV(4,L)
      PV(4,M)=A
      B=A*A
      DO 4 I=1,3
      A=PV(I,K)-PV(I,L)
      B=B-A*A
      PV(I,M)=A
 4    CONTINUE
      PV(5,M)=SIGN(SQRT(ABS(B)),B)
      RETURN
      END
