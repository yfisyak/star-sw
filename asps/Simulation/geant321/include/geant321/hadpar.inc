*
* $Id: hadpar.inc,v 1.1.1.1 2004/01/15 00:12:28 potekhin Exp $
*
* $Log: hadpar.inc,v $
* Revision 1.1.1.1  2004/01/15 00:12:28  potekhin
*
*
* Revision 1.1.1.1  1997/11/03 15:29:51  atlascvs
* Importing CERNLIB version 08.21.
*
* Revision 1.1.1.1  1995/10/24 10:20:39  cernlib
* Geant
*
*
#ifndef CERNLIB_GEANT321_HADPAR_INC
#define CERNLIB_GEANT321_HADPAR_INC
*
*
* hadpar.inc
*
C***********************************************************************
C     INCLUDE FILE: HADPAR COPY                   CREATED 11/12/86 BY PA
C     CHANGES: NONE
C     INCLUDED IN THE FOLLOWING SUBROUTINES OR FUNCTIONS: NOT UPDATED
C
C     DESCRIPTION OF THE COMMON BLOCK(S) AND VARIABLE(S)
C
C***********************************************************************
      PARAMETER (IDMAX4=1133)
      CHARACTER*8 ANH
      COMMON /FKHADP/PXH(IDMAX4),PYH(IDMAX4),PZH(IDMAX4),HEPH(IDMAX4),
     *AMH(IDMAX4),ICHH(IDMAX4),IBARH(IDMAX4),            NREH(IDMAX4)
      COMMON /FKHADC/ANH(IDMAX4)
 

#endif
