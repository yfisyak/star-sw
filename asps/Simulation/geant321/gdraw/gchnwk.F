*
* $Id: gchnwk.F,v 1.1.1.1 2004/01/15 00:12:04 potekhin Exp $
*
* $Log: gchnwk.F,v $
* Revision 1.1.1.1  2004/01/15 00:12:04  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:38  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:18  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.25  by  S.Giani
*-- Author :
*
      SUBROUTINE GCHNWK
*
#include "geant321/gcbank.inc"
#include "geant321/gcdraw.inc"
#include "geant321/gcunit.inc"
#include "geant321/gcflag.inc"
#include "geant321/gcspee.inc"
*
      SAVE FIRST
      LOGICAL FIRST
      DATA FIRST/.TRUE./
*
      IF(FIRST)THEN
         FIRST=.FALSE.
         CALL IOPWK(2,1,9)
      ENDIF
      CALL IDAWK(1)
      CALL IACWK(2)
*
 999  END
