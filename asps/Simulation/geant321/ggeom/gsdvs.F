*
* $Id: gsdvs.F,v 1.1.1.1 2004/01/15 00:12:08 potekhin Exp $
*
* $Log: gsdvs.F,v $
* Revision 1.1.1.1  2004/01/15 00:12:08  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:30:08  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:55  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.30  by  S.Giani
*-- Author :
      SUBROUTINE GSDVS(CHNAME,CHMOTH,STEP,IAXIS,NUMED)
C.
C.    ******************************************************************
C.    *                                                                *
C.    *    To be replaced in the future by GSDVT                       *
C.    *                                                                *
C.    ******************************************************************
C.
#include "geant321/gcunit.inc"
      CHARACTER*4 CHNAME,CHMOTH
      WRITE(CHMAIL,
     +'('' *** GSDVS: Obsolete Routine -- Call GSDVT instead'')')
      CALL GMAIL(1,0)
      WRITE(CHMAIL,
     +'(''            This code will be removed from next version'')')
      CALL GMAIL(0,1)
      CALL GSDVT(CHNAME,CHMOTH,STEP,IAXIS,NUMED,0)
      END
