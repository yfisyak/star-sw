*
* $Id: gphini.F,v 1.1.1.1 2004/01/15 00:12:14 potekhin Exp $
*
* $Log: gphini.F,v $
* Revision 1.1.1.1  2004/01/15 00:12:14  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:30:39  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:21:29  cernlib
* Geant
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.22  by  S.Giani
*-- Author :
      SUBROUTINE GPHINI
C.
C.    ******************************************************************
C.    *                                                                *
C     *       Initialize material constants for                        *
C.    *       the photoelectric effect                                 *
C.    *                                                                *
C.    *    ==>Called by : GPHYSI                                       *
C.    *       Author    J. Chwastowski                                 *
C.    *                                                                *
C.    ******************************************************************
C.
      CALL GPHRIN
      CALL GSHLIN
      CALL GPHXIN
      END
