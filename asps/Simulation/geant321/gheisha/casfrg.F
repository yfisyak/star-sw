*
* $Id: casfrg.F,v 1.1.1.1 2004/01/15 00:12:09 potekhin Exp $
*
* $Log: casfrg.F,v $
* Revision 1.1.1.1  2004/01/15 00:12:09  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:30:11  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:21:02  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.39  by  S.Giani
*-- Author :
      SUBROUTINE CASFRG(NUCFLG,INT,NFL)
C
C *** CASCADE OF HEAVY FRAGMENTS ***
C *** NVE 11-MAY-1988 CERN GENEVA ***
C
C ORIGIN : H.FESEFELDT (02-DEC-1986)
C
C --- NUCFLG IS A FLAG TO DENOTE THE NUCREC ACTION ---
C NUCFLG = 0 ==> NO ACTION TAKEN BY NUCREC
C          1 ==> ACTION TAKEN BY NUCREC
      NUCFLG=1
      CALL NUCREC(NOPT,2)
      IF (NOPT .NE. 0) GO TO 9999
C
      NUCFLG=0
      CALL COSCAT
C
 9999 CONTINUE
      END
